/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.metropolitan.it355.dao.impl;

import com.metropolitan.it355.dao.CRUDDao;
import com.metropolitan.it355.entity.Artist;
import com.metropolitan.it355.entity.Booking;
import com.metropolitan.it355.entity.Users;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author Milos
 */
@Repository("crudDao")
@Service
public class CRUDDaoImpl implements CRUDDao{
    
    // instanciranje sesije
    @Autowired
    private SessionFactory sessionFactory;

    // kreiranje setera
    @Autowired
    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }
    // kreiranje getera

    public Session getSession() {
        return sessionFactory.getCurrentSession();
    }
    
    @Transactional
    @Override
    public Users register(Users user) {
        return (Users) getSession().merge(user);
    }

    @Transactional
    @Override
    public Users findUserByUsername(String username) {
        Users user = (Users) getSession().createCriteria(Users.class).add(Restrictions.eq("username", username)).uniqueResult();
        return user;
    }

    @Transactional
    @Override
    public Users addUser(Users user) {
        return (Users) getSession().merge(user);
    }

    @Transactional
    @Override
    public void deleteUser(Users user) {
        getSession().delete(user);
    }

    @Override
    @Transactional
    public void editUser(Users user) {
        getSession().saveOrUpdate(user);
    }

    @SuppressWarnings("unchecked")
    @Override
    @Transactional
    public List<Users> getUsers() {
        List<Users> results = (List<Users>) getSession().createCriteria(Users.class).list();
        return results;
    }
    
    @Override
    @Transactional
    public Users getUserById(int userId) {
        Users users = (Users) getSession().createCriteria(Users.class).add(Restrictions.eq("userId", userId)).uniqueResult();
        return users;
    }
    
    @Override
    @Transactional
    public List<Artist> getArtists() {
        List<Artist> results = (List<Artist>) getSession().createCriteria(Artist.class).list();
        return results;
    }

    @Override
    @Transactional
    public Artist getArtistById(int id) {
        Artist artist = (Artist) getSession().createCriteria(Artist.class).add(Restrictions.eq("id", id)).uniqueResult();
        return artist;
    }
    
    @Override
    @Transactional
    public void editArtist(Artist artist) {
        getSession().saveOrUpdate(artist);
    }
    
    @Override
    @Transactional
    public Artist addArtist(Artist artist) {
        return (Artist) getSession().merge(artist);
    }
    
    @Transactional
    @Override
    public void deleteArtist(Artist artist) {
        getSession().delete(artist);
    }
    
    @Override
    @Transactional
    public Booking addBooking(Booking booking) {
        return (Booking) getSession().merge(booking);
    }
    
    @Override
    @Transactional
    public List<Booking> getBooking() {
        List<Booking> results = (List<Booking>) getSession().createCriteria(Booking.class).list();
        return results;
    }

    @Override
    @Transactional
    public Booking getBookingById(int id) {
        Booking booking = (Booking) getSession().createCriteria(Booking.class).add(Restrictions.eq("id", id)).uniqueResult();
        return booking;
    }
    
    @Override
    @Transactional
    public void editBooking(Booking booking) {
        getSession().saveOrUpdate(booking);
    }
    
    @Transactional
    @Override
    public void deleteBooking(Booking booking) {
        getSession().delete(booking);
    }
    
    @Transactional
    @Override
    public List<Booking> getBookingByUser(Users u) {
        List<Booking> b = (List<Booking>) getSession().createCriteria(Booking.class).add(Restrictions.eq("user", u)).list();
        return b;
    }
}
