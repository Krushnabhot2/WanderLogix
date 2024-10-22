package com.example.demo.repository;

import com.example.demo.model.TourMember;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface TourMemberRepository extends JpaRepository<TourMember, Integer> {
}
