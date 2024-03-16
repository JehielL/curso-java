package com.bitebooking.model;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.springframework.web.bind.annotation.CrossOrigin;

import java.time.LocalDate;


@Entity
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
public class Booking {

    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Id
    private Long id;
    private String title;
    private Boolean status;
    private Double numTable;
    private LocalDate createDate;
    private String imgUrl;
    @ManyToOne
    private Menu menu;
    @ManyToOne
    private Restaurant restaurant;
}
