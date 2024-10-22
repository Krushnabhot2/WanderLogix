package com.example.demo.service;

import com.example.demo.model.TourTransaction;
import com.example.demo.repository.TourTransactionRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class TourTransactionService {

    @Autowired
    private TourTransactionRepository tourTransactionRepository;

    public TourTransaction createTransaction(TourTransaction tourTransaction) {
        return tourTransactionRepository.save(tourTransaction);
    }

    public TourTransaction getTransactionById(Integer id) {
        return tourTransactionRepository.findById(id)
                .orElseThrow(() -> new IllegalArgumentException("Transaction with ID " + id + " not found"));
    }
}
