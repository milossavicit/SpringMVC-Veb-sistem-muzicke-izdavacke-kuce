/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.metropolitan.it355.converter;

import com.metropolitan.it355.dao.CRUDDao;
import com.metropolitan.it355.entity.Artist;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.convert.converter.Converter;

/**
 *
 * @author Milos
 */
public class IntegerToArtist implements Converter<String, Artist> {
    @Autowired
    CRUDDao crudDao;

    @Override
    public Artist convert(String s) {
        if (s.isEmpty()) {
            return null;
        }
        Integer valeu = Integer.valueOf(s);
        System.out.println("Konvertujem u artist");
        Artist a = crudDao.getArtistById(valeu);
        return a;
    }
}
