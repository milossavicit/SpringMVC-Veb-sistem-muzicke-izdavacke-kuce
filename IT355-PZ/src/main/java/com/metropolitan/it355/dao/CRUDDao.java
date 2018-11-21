/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.metropolitan.it355.dao;

import com.metropolitan.it355.entity.Artist;
import com.metropolitan.it355.entity.Booking;
import com.metropolitan.it355.entity.Users;
import java.util.List;

/**
 *
 * @author Milos
 */
public interface CRUDDao {
    public Users register(Users user);

    public Users findUserByUsername(String username);
    
    public Users addUser(Users user);
    
    public void deleteUser(Users user);
    
    public void editUser(Users user);

    public Object getUsers();
    
    public Users getUserById(int userId);
    
    public List<Artist> getArtists();

    public Artist getArtistById(int id);
    
    public void editArtist(Artist artist);

    public Artist addArtist(Artist artist);
    
    public void deleteArtist(Artist artist);
    
    public Booking addBooking(Booking booking);
    
    public List<Booking> getBooking();

    public Booking getBookingById(int id);
    
    public void editBooking(Booking booking);
    
    public void deleteBooking(Booking booking);
    
    public List<Booking> getBookingByUser(Users user);
    
}
