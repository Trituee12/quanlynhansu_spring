/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import model.Thanhtichkyluat;
import java.util.ArrayList;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import util.HibernateUtil;

/**
 *
 * @author TUE
 */
public class thanhtichkyluatDAO {
    public ArrayList<Thanhtichkyluat> getAllthanhtichkyluat(){
        Session ss = HibernateUtil.getSessionFactory().openSession();
        Transaction tran = ss.beginTransaction();
        Query query = ss.createQuery("FROM Thanhtichkyluat order by ngayghinhan desc");
        ArrayList<Thanhtichkyluat> list = (ArrayList<Thanhtichkyluat>) query.list();
        tran.commit(); 
      
        return list;
        
    }
     public void addtt(Thanhtichkyluat tt){
       Session session = HibernateUtil.getSessionFactory().openSession();
       Transaction tran = session.beginTransaction();
         session.saveOrUpdate(tt);
       tran.commit();
      
       
   }
    
  
     
}
