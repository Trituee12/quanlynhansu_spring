/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package service;

import dao.thanhtichkyluatDAO;
import model.Thanhtichkyluat;
import java.util.ArrayList;
import java.util.List;
import model.Nhanvien;

import org.springframework.beans.factory.annotation.Autowired;

/**
 *
 * @author TUE
 */
public class thanhtichkyluatService {
    @Autowired
    thanhtichkyluatDAO thanhtichkyluatDAO;
    public ArrayList<Thanhtichkyluat> getAllthThanhtichkyluat(){
    return thanhtichkyluatDAO.getAllthanhtichkyluat();
    } 
    public void  addtt (Thanhtichkyluat tt){
    thanhtichkyluatDAO.addtt(tt);
    }

 
}
