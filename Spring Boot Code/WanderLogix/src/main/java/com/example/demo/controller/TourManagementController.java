package com.example.demo.controller;

import com.example.demo.model.TourPackage;
import com.example.demo.model.User;
import com.example.demo.service.TourManagementService;
import com.example.demo.service.UserService;
import com.example.demo.dto.TourPackageRequest;
import com.example.demo.exception.ResourceNotFoundException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@CrossOrigin(origins = "http://localhost:3000")
@RestController
@RequestMapping("/api/TourManagement")
public class TourManagementController {

    private final TourManagementService tourManagementService;
    private final UserService userService;

    @Autowired
    public TourManagementController(TourManagementService tourManagementService, UserService userService) {
        this.tourManagementService = tourManagementService;
        this.userService = userService;
    }
    

    @PostMapping("/CreatePackage")
    public ResponseEntity<?> createPackage(@RequestBody TourPackageRequest request) {
        if (request.getManager() == null || request.getGuide() == null) {
            return ResponseEntity.badRequest().body("Manager ID and Guide ID must not be null.");
        }

        User manager = userService.findById(request.getManager())
                .orElseThrow(() -> new ResourceNotFoundException("User not found with id " + request.getManager()));
        User guide = userService.findById(request.getGuide())
                .orElseThrow(() -> new ResourceNotFoundException("User not found with id " + request.getGuide()));

        TourPackage tourPackage = new TourPackage();
        tourPackage.setTourPackageId(request.getTourPackageId());
        tourPackage.setTourName(request.getTourName());
        tourPackage.setDescription(request.getDescription());
        tourPackage.setPrice(request.getPrice());
        tourPackage.setStartDate(request.getStartDate());
        tourPackage.setEndDate(request.getEndDate());
        tourPackage.setDuration(request.getDuration());
        tourPackage.setNoOfSeats(request.getNoOfSeats());
        tourPackage.setStatus(request.getStatus());
        tourPackage.setManager(manager);
        tourPackage.setGuide(guide);

        tourManagementService.createPackage(tourPackage);

        return ResponseEntity.ok(tourPackage);
    }

    @GetMapping("/GetPackages")
    public ResponseEntity<List<TourPackage>> getPackages() {
        return ResponseEntity.ok(tourManagementService.getAllPackages());
    }

    @GetMapping("/GetPackageById/{id}")
    public ResponseEntity<TourPackage> getPackageById(@PathVariable("id") Integer id) {
        try {
            TourPackage tourPackage = tourManagementService.getPackageById(id);
            return ResponseEntity.ok(tourPackage);
        } catch (Exception e) {
            return ResponseEntity.notFound().build();
        }
    }
    @GetMapping("/GetPackagesByGuide/{guideId}")
    public ResponseEntity<List<TourPackage>> getPackagesByGuide(@PathVariable("guideId") Integer guideId) {
        List<TourPackage> packages = tourManagementService.getPackagesByGuide(guideId);
        return ResponseEntity.ok(packages);
    }
    

    @GetMapping("/SearchPackages")
    public ResponseEntity<List<TourPackage>> searchPackages(@RequestParam("tourName") String tourName) {
        List<TourPackage> packages = tourManagementService.searchPackagesByName(tourName);
        if (packages.isEmpty()) {
            return ResponseEntity.notFound().build();
        } else {
            return ResponseEntity.ok(packages);
        }
    }


    @PutMapping("/UpdatePackage/{id}")
    public ResponseEntity<?> updatePackage(@PathVariable("id") Integer id, @RequestBody TourPackageRequest request) {
        try {
            User manager = userService.findById(request.getManager())
                    .orElseThrow(() -> new ResourceNotFoundException("Manager not found with id " + request.getManager()));
            User guide = userService.findById(request.getGuide())
                    .orElseThrow(() -> new ResourceNotFoundException("Guide not found with id " + request.getGuide()));

            TourPackage updatedPackage = new TourPackage();
            updatedPackage.setTourPackageId(request.getTourPackageId());
            updatedPackage.setTourName(request.getTourName());
            updatedPackage.setDescription(request.getDescription());
            updatedPackage.setPrice(request.getPrice());
            updatedPackage.setStartDate(request.getStartDate());
            updatedPackage.setEndDate(request.getEndDate());
            updatedPackage.setDuration(request.getDuration());
            updatedPackage.setNoOfSeats(request.getNoOfSeats());
            updatedPackage.setStatus(request.getStatus());
            updatedPackage.setManager(manager);
            updatedPackage.setGuide(guide);

            TourPackage updatedTourPackage = tourManagementService.updatePackage(id, updatedPackage);
            return ResponseEntity.ok(updatedTourPackage);
        } catch (Exception e) {
            return ResponseEntity.badRequest().body(e.getMessage());
        }
    }

    @DeleteMapping("/DeletePackage/{id}")
    public ResponseEntity<?> deletePackage(@PathVariable("id") Integer id) {
        try {
            tourManagementService.deletePackage(id);
            return ResponseEntity.ok().build();
        } catch (Exception e) {
            return ResponseEntity.badRequest().body(e.getMessage());
        }
    }
}
