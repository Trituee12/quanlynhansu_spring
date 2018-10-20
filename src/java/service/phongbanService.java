/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package service;

import dao.phongbanDAO;
import java.math.BigInteger;
import java.util.List;
import model.Phongban;

import org.springframework.beans.factory.annotation.Autowired;

/**
*
 * @author TUE
 */
public class phongbanService {
    @Autowired
    phongbanDAO phongbanDAO;
    public List<Phongban> getAllphongban(){
    return phongbanDAO.getAllphongban();
    }
    public Phongban edit(String maphong){
    return phongbanDAO.findBymanv(maphong);
    }
    public void update(Phongban phongban){
    phongbanDAO.editphong(phongban);
    }
    public void remove(String  maphong){
    phongbanDAO.remove(maphong);
    }
     public void addpb(Phongban  phongban){
    phongbanDAO.addpb(phongban);
    }
     public BigInteger sopb(){
     return phongbanDAO.sopb();
     }
   public Phongban maphong(String maphong){
   return phongbanDAO.maphong(maphong);
   }
   public Phongban tenphong(String tenphong){
   return phongbanDAO.tenphong(tenphong);
   }
}
