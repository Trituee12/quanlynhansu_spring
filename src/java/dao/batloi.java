/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import model.Nhanvien;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;



/**
 *
 * @author TUE
 */
public class batloi implements Validator{

    @Override
    public boolean supports(Class<?> type) {
        return Nhanvien.class.isAssignableFrom(type);
    }

    @Override
    public void validate(Object o, Errors errors) {
        Nhanvien nv =  (Nhanvien) o;
        
    }
    
  
 
}
