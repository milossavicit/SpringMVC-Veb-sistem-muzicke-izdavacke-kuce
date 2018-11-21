/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.metropolitan.it355.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 *
 * @author Milos
 */
@Entity
@Table(name = "artist")
public class Artist{

    

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Integer id;

    @Column(name = "name")
    private String name;

    @Column(name = "br_albuma")
    private int brAlbuma;

    @Column(name = "br_nagrada")
    private int brNagrada;

    public Artist() {
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getBrAlbuma() {
        return brAlbuma;
    }

    public void setBrAlbuma(int brAlbuma) {
        this.brAlbuma = brAlbuma;
    }

    public int getBrNagrada() {
        return brNagrada;
    }

    public void setBrNagrada(int brNagrada) {
        this.brNagrada = brNagrada;
    }

    @Override
    public String toString() {
        return name;
    }
  
}
