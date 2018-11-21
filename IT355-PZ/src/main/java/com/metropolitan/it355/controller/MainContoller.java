/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.metropolitan.it355.controller;

import com.metropolitan.it355.dao.CRUDDao;
import com.metropolitan.it355.entity.Artist;
import com.metropolitan.it355.entity.Booking;
import com.metropolitan.it355.entity.Users;
import java.security.Principal;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author Milos
 */
@Controller
public class MainContoller {
    
    @Autowired
    CRUDDao crudDao;
    
    @RequestMapping(value = {"/"}, method = RequestMethod.GET)
    public ModelAndView defaultPage() {
        ModelAndView model = new ModelAndView();
        model.setViewName("index");
        return model;
    }
    
    @RequestMapping(value = "/about", method = RequestMethod.GET)
    public ModelAndView aboutPage() {
        ModelAndView model = new ModelAndView();
        model.setViewName("about");
        return model;
    }
    
    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public ModelAndView login(@RequestParam(value = "error", required = false) String error,
            @RequestParam(value = "logout", required = false) String logout) {
        ModelAndView model = new ModelAndView();
        if (error != null) {
            model.addObject("error", "Podaci nisu korektni!");
        }
        if (logout != null) {
            model.addObject("msg", "Sada ste izlogovani.");
        }
          
        model.setViewName("login");
        return model;
    }

    @RequestMapping(value = "/403", method = RequestMethod.GET)
    public ModelAndView accesssDenied() {
        ModelAndView model = new ModelAndView();
        Authentication auth
                = SecurityContextHolder.getContext().getAuthentication();
        if (!(auth instanceof AnonymousAuthenticationToken)) {
            UserDetails userDetail = (UserDetails) auth.getPrincipal();
            System.out.println(userDetail);
            model.addObject("username", userDetail.getUsername());
        }
        model.setViewName("403");
        return model;
    }
    
    @RequestMapping(value = "/register", method = RequestMethod.GET)
    public String register(Model model) {
        model.addAttribute("user", new Users());
        return "register";
    }

    @RequestMapping(value = "/register", method = RequestMethod.POST)
    public ModelAndView register(@ModelAttribute("user") Users u, ModelAndView model) {
        Users exist = crudDao.findUserByUsername(u.getUsername());
        if (u.getUsername().isEmpty()) {
            model.addObject("error", "Morate uneti username!");
        } else if (exist != null) {
            model.addObject("error", "Username već postoji!");
        } else if (u.getPassword().isEmpty()) {
            model.addObject("error", "Morate uneti password!");
        } else if (u.getEmail().isEmpty()) {
            model.addObject("error", "Morate uneti email!");
        } else if (u.getFirstname().isEmpty()) {
            model.addObject("error", "Morate uneti ime!");
        } else if (u.getLastname().isEmpty()) {
            model.addObject("error", "Morate uneti prezime!");
        } else {
            crudDao.register(u);
            model.addObject("successMsg", "Registracija je uspešna!");
        }

        return model;
    }
    
    @RequestMapping(value = "/users", method = RequestMethod.GET)
    public ModelAndView getUsers(ModelAndView model) {
        model.addObject("users", crudDao.getUsers());
        model.addObject("user", new Users());
        return model;
    }
    
    @RequestMapping(value = "/addUser", method = RequestMethod.GET)
    public String addUser(Model model) {
        model.addAttribute("user", new Users());
        return "addUser";
    }

    @RequestMapping(value = "/addUser", method = RequestMethod.POST)
    public ModelAndView addUser(@ModelAttribute("user") Users p, ModelAndView model) {
        p = crudDao.addUser(p);
        model.addObject("user", p);
        return new ModelAndView("redirect:/users");
    }
    
    @RequestMapping(value = "/editUser/{userId}", method = RequestMethod.GET)
    public String addUser(@PathVariable("userId") int userId, Model model) {
        Users user = crudDao.getUserById(userId);
        model.addAttribute("user", user);
        return "addUser";
    }
    
    @RequestMapping(value = "/deleteUser/{userId}", method = RequestMethod.GET)
    public String deleteUser(@PathVariable("userId") int userId, HttpServletRequest request) {
        System.out.println("Fetching & Deleting user with id " + userId);
        Users user = crudDao.getUserById(userId);
        if (user == null) {
            System.out.println("Unable to delete. User with id " + userId + " not found");
            String referer = request.getHeader("Referer");
            return "redirect:" + referer;
        }
        crudDao.deleteUser(user);
        String referer = request.getHeader("Referer");
        return "redirect:" + referer;
    }
    
    @RequestMapping(value = "/artists", method = RequestMethod.GET)
    public ModelAndView getArtists(ModelAndView model) {
        model.addObject("artists", crudDao.getArtists());
        model.addObject("artist", new Artist());
        return model;
    }
    
    @RequestMapping(value = "/addArtist", method = RequestMethod.GET)
    public String addArtist(Model model) {
        model.addAttribute("artist", new Artist());
        return "addArtist";
    }

    @RequestMapping(value = "/addArtist", method = RequestMethod.POST)
    public ModelAndView addArtist(@ModelAttribute("artist") Artist p, ModelAndView model) {
        p = crudDao.addArtist(p);
        model.addObject("artist", p);
        return new ModelAndView("redirect:/artists");
    }
    
    @RequestMapping(value = "/editArtist/{id}", method = RequestMethod.GET)
    public String addArtist(@PathVariable("id") int id, Model model) {
        Artist artist = crudDao.getArtistById(id);
        model.addAttribute("artist", artist);
        return "addArtist";
    }
    
    @RequestMapping(value = "/deleteArtist/{id}", method = RequestMethod.GET)
    public String deleteArtist(@PathVariable("id") int id, HttpServletRequest request) {
        System.out.println("Fetching & Deleting artist with id " + id);
        Artist artist = crudDao.getArtistById(id);
        if (artist == null) {
            System.out.println("Unable to delete. Artist with id " + id + " not found");
            String referer = request.getHeader("Referer");
            return "redirect:" + referer;
        }
        crudDao.deleteArtist(artist);
        String referer = request.getHeader("Referer");
        return "redirect:" + referer;
    }
    
    @RequestMapping(value = "/artistsList", method = RequestMethod.GET)
    public ModelAndView getArtistsList(ModelAndView model) {
        model.addObject("artists", crudDao.getArtists());
        model.addObject("artist", new Artist());
        return model;
    }
    
    @RequestMapping(value = "/addBooking", method = RequestMethod.GET)
    public String addBooking(Model model) {
        model.addAttribute("booking", new Booking());
        model.addAttribute("artists", crudDao.getArtists());
        return "addBooking";
    }
    
    @RequestMapping(value = "/addBooking", method = RequestMethod.POST)
    public ModelAndView addBooking(@ModelAttribute("booking") Booking b, HttpServletRequest request, ModelAndView model) {
        Principal principal = request.getUserPrincipal();
        Users u = crudDao.findUserByUsername(principal.getName());
        b.setUser(u);
        b = crudDao.addBooking(b);
        model.addObject("artist", crudDao.getArtists());
        model.addObject("booking", b);
        model.addObject("successMsg", "Uspešno ste rezervisali nastup!");
        return new ModelAndView("redirect:/myBookings");
    }
    
    @RequestMapping(value = "/booking", method = RequestMethod.GET)
    public ModelAndView getBooking(ModelAndView model) {
        model.addObject("bookings", crudDao.getBooking());
        model.addObject("booking", new Booking());
        return model;
    }
    
    @RequestMapping(value = "/deleteBooking/{id}", method = RequestMethod.GET)
    public String deleteBooking(@PathVariable("id") int id, HttpServletRequest request) {
        System.out.println("Fetching & Deleting booking with id " + id);
        Booking booking = crudDao.getBookingById(id);
        if (booking == null) {
            System.out.println("Unable to delete. Booking with id " + id + " not found");
            String referer = request.getHeader("Referer");
            return "redirect:" + referer;
        }
        crudDao.deleteBooking(booking);
        String referer = request.getHeader("Referer");
        return "redirect:" + referer;
    }
    
    @RequestMapping(value = "/myBookings", method = RequestMethod.GET)
    public ModelAndView getMyBookings(ModelAndView model, HttpServletRequest request) {
        Principal principal = request.getUserPrincipal();
        Users u = crudDao.findUserByUsername(principal.getName());
        List<Booking> b = crudDao.getBookingByUser(u);

        model.addObject("bookings", b);
        return model;
    }
    
    @RequestMapping(value = "/editBooking/{id}", method = RequestMethod.GET)
    public String editBooking(@PathVariable("id") int id, Model model) {
        Booking b = crudDao.getBookingById(id);
        model.addAttribute("booking", b);
        model.addAttribute("artists", crudDao.getArtists());
        return "addBooking";
    }

}
