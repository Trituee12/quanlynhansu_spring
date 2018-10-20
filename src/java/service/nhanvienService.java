/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package service;

import dao.nhanvienDAO;
import java.math.BigInteger;
import model.Nhanvien;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

/**
 *
 * @author TUE
 */
public class nhanvienService {
    @Autowired
    nhanvienDAO nhanvienDAO;
    public List<Nhanvien> getAllNhanvien(){
    return nhanvienDAO.getAllnhanvien();
    }
    public Nhanvien login(String email,String password){
    return nhanvienDAO.login(email, password);
    }
    public Nhanvien editnv(String manv){
    return nhanvienDAO.findBymanv(manv);
    }
    public void removenv(String manv){
     nhanvienDAO.remove(manv);
    }
    public void updatenv(Nhanvien nv){
    nhanvienDAO.editnv(nv);
    }
     public void addnv(Nhanvien nv){
    nhanvienDAO.addnv(nv);
    }
     public Nhanvien loginnv(String email,String password){
    return nhanvienDAO.loginnv(email, password);
    }
     public ArrayList<Nhanvien> findpb(String maphongban){
    return nhanvienDAO.findpb(maphongban);
    }
     public BigInteger manvthem(){
    return nhanvienDAO.Manv();
    }
     public BigInteger sonv(){
     return  nhanvienDAO.sonv();
     
     }
     public Nhanvien email(String email){
     return nhanvienDAO.formemail(email);
     }
 public Nhanvien sdt(String sdt){
     return nhanvienDAO.formsdt(sdt);
     }
}
