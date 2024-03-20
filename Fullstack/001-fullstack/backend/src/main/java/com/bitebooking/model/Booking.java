package com.bitebooking.model;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.springframework.web.bind.annotation.CrossOrigin;

import java.time.LocalDate;
import java.time.LocalDateTime;


@Entity
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
public class Booking {

    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Id
    private Long id;
    private LocalDateTime createDate;
    private String title;
    private Double price;
    private Integer numUsers;
    private String observations;
    private Boolean status;
    private Double discount;
    private Boolean interior;
    private Integer numTable;
    private Double totalPrice;
    @ManyToOne
    private Menu menu;
    @ManyToOne
    private Restaurant restaurant;
}
