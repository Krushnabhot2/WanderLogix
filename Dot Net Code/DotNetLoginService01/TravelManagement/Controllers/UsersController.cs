using BCrypt.Net;
using UserController.Controllers;
using Microsoft.AspNetCore.Cors;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Identity.Data;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using TravelManagement.Models;
using Microsoft.EntityFrameworkCore.Metadata.Internal;

namespace UserController.Controllers
{
    [Route("api/[controller]/[action]")]
    [EnableCors]
    [ApiController]
    public class TourManagementController : ControllerBase
    {

        [HttpGet]
        public List<User> GetLogin()
        {
            List<User> users = new List<User>();
            using (var db = new projectContext())
            {
                users = db.Users.ToList();
            }
            return users;
        }//getlogin()
        [HttpGet]
        public List<User> GetUsersWithEmail()
        {
            List<User> result = new List<User>();
            using (var db = new projectContext())
            {
                result = db.Users.Include(user => user.Role).ToList();
            }
            return result;
        }
        [HttpPost]
        public IActionResult VerifyLogin([FromBody] LoginRequest loginRequest)
        {
            if (loginRequest == null)
            {
                return BadRequest(new { message = "Invalid request body" });
            }

            using (var db = new projectContext())
            {
                var user = db.Users.FirstOrDefault(u => u.Email == loginRequest.Email);
                if (user == null)
                {
                    return NotFound(new { message = "User not found" });
                }

                bool isPasswordValid = BCrypt.Net.BCrypt.Verify(loginRequest.Password, user.Password);
                if (!isPasswordValid)
                {
                    return Unauthorized(new { message = "Invalid password" });
                }

                return Ok(user);
            }
        }

        [HttpPost]

        public User SaveUser(User user)
        {
            using (var db = new projectContext())
            {
                user.Password = BCrypt.Net.BCrypt.HashPassword(user.Password);
                db.Users.Add(user);
                db.SaveChanges();
            }
            return user;
        }

        [HttpPut]
        public IActionResult UpdateUser([FromBody] User updatedUser)
        {
            if (updatedUser == null)
            {
                return BadRequest(new { message = "Invalid request body" });
            }

            using (var db = new projectContext())
            {
                var existingUser = db.Users.FirstOrDefault(u => u.UserId == updatedUser.UserId);
                if (existingUser == null)
                {
                    return NotFound(new { message = "User not found" });
                }

                existingUser.Fname = updatedUser.Fname;
                existingUser.Lname = updatedUser.Lname;
                existingUser.Email = updatedUser.Email;
                existingUser.PhoneNo = updatedUser.PhoneNo;
                existingUser.Address = updatedUser.Address;
                existingUser.AadharNo = updatedUser.AadharNo;
                existingUser.RoleId = updatedUser.RoleId;

                if (!string.IsNullOrEmpty(updatedUser.Password))
                {
                    existingUser.Password = BCrypt.Net.BCrypt.HashPassword(updatedUser.Password);
                }

                db.SaveChanges();

                return Ok(existingUser);
            }
        }

        [HttpDelete("{id}")]
        public IActionResult DeleteUser(int id)
        {
            using (var db = new projectContext())
            {
                var user = db.Users.Include(u => u.TourPackageGuides)
                                   .Include(u => u.TourPackageMgrs)
                                   .FirstOrDefault(u => u.UserId == id);

                if (user == null)
                {
                    return NotFound(new { message = "User not found" });
                }

                // Remove references to the user in the TourPackage table
                if (user.TourPackageGuides != null && user.TourPackageGuides.Any())
                {
                    foreach (var tourPackage in user.TourPackageGuides)
                    {
                        tourPackage.GuideId = null; // Set GuideId to null or handle as needed
                    }
                }

                if (user.TourPackageMgrs != null && user.TourPackageMgrs.Any())
                {
                    foreach (var tourPackage in user.TourPackageMgrs)
                    {
                        tourPackage.MgrId = null; // Set MgrId to null or handle as needed
                    }
                }

                // Save the changes before deleting the user
                db.SaveChanges();

                // Now delete the user
                db.Users.Remove(user);
                db.SaveChanges();

                return Ok(new { message = "User deleted successfully" });
            }
        }

    }
}