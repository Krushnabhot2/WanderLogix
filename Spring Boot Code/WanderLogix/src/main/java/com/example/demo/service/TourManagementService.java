package com.example.demo.service;

import com.example.demo.model.TourPackage;
import com.example.demo.repository.TourPackageRepository;
import com.example.demo.repository.TourImageRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class TourManagementService {

    @Autowired
    private TourPackageRepository tourPackageRepository;

    @Autowired
    private TourImageRepository tourImageRepository;

    public TourPackage createPackage(TourPackage tourPackage) {
        if (tourPackage.getEndDate() == null) {
            throw new IllegalArgumentException("End date cannot be null");
        }
        return tourPackageRepository.save(tourPackage);
    }
    public List<TourPackage> searchPackagesByName(String tourName) {
        return tourPackageRepository.findByTourNameContaining(tourName);
    }


    public List<TourPackage> getAllPackages() {
        return tourPackageRepository.findAll();
    }

    public TourPackage getPackageById(Integer id) {
        return tourPackageRepository.findById(id)
                .orElseThrow(() -> new IllegalArgumentException("Package with ID " + id + " not found"));
    }
    public List<TourPackage> getPackagesByGuide(Integer guideId) {
        return tourPackageRepository.findByGuideId(guideId);
    }
    


    public void deletePackage(Integer packageId) {
        tourImageRepository.deleteByTourPackage_TourPackageId(packageId);
        tourPackageRepository.deleteById(packageId);
    }

    public TourPackage updatePackage(Integer packageId, TourPackage updatedPackage) {
        return tourPackageRepository.findById(packageId)
                .map(existingPackage -> {
                    existingPackage.setTourName(updatedPackage.getTourName());
                    existingPackage.setDescription(updatedPackage.getDescription());
                    existingPackage.setPrice(updatedPackage.getPrice());
                    existingPackage.setStartDate(updatedPackage.getStartDate());
                    existingPackage.setEndDate(updatedPackage.getEndDate());
                    existingPackage.setDuration(updatedPackage.getDuration());
                    existingPackage.setNoOfSeats(updatedPackage.getNoOfSeats());
                    existingPackage.setStatus(updatedPackage.getStatus());
                    existingPackage.setManager(updatedPackage.getManager());
                    existingPackage.setGuide(updatedPackage.getGuide());
                    return tourPackageRepository.save(existingPackage);
                })
                .orElseThrow(() -> new IllegalArgumentException("Package with ID " + packageId + " not found"));
    }
}
