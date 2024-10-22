package com.example.demo.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.example.demo.model.TourPackage;

import java.util.List;

@Repository
public interface TourPackageRepository extends JpaRepository<TourPackage, Integer> {

    // Custom query to search by tour name
    @Query("SELECT t FROM TourPackage t WHERE t.tourName LIKE %:tourName%")
    List<TourPackage> findByTourNameContaining(@Param("tourName") String tourName);

    // Custom query to search by guide's user_id
    @Query("SELECT t FROM TourPackage t WHERE t.guide.id = :guideId")
    List<TourPackage> findByGuideId(@Param("guideId") Integer guideId);

    // Custom query to search by manager's user_id (manager is user with id 3)
    @Query("SELECT t FROM TourPackage t WHERE t.manager.userId = :managerId")
    List<TourPackage> findByManagerId(@Param("managerId") Integer managerId);
    

    // Custom query to search by tour name and manager's user_id
    @Query("SELECT t FROM TourPackage t WHERE t.tourName LIKE %:tourName% AND t.manager.userId = :managerId")
    List<TourPackage> findByTourNameAndManagerId(@Param("tourName") String tourName, @Param("managerId") Integer managerId);
}
