package com.example.demo.repository;

import com.example.demo.model.TourImage;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface TourImageRepository extends JpaRepository<TourImage, Integer> {
    // Custom method to delete images by package ID
    void deleteByTourPackage_TourPackageId(Integer tourPackageId);
}
