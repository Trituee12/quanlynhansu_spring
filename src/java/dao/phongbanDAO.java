/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.math.BigInteger;
import java.util.ArrayList;
import model.Phongban;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import util.HibernateUtil;

/**
 *
 * @author TUE
 */
public class phongbanDAO {
    public List<Phongban> getAllphongban(){
    Session ss = HibernateUtil.getSessionFactory().openSession();
       Transaction tran = ss.beginTransaction();
       List<Phongban> list = new ArrayList<>();
       list = ss.createCriteria(Phongban.class).list();
       tran.commit();
       return list;
    }
    
     public Phongban findBymanv(String maphong){
       Session session = HibernateUtil.getSessionFactory().openSession();
       Transaction tran = session.beginTransaction();
          Phongban phongban = (Phongban) session.get(Phongban.class, maphong);
      tran.commit();
   return phongban; }
    public void editphong(Phongban phongban){
       Session session = HibernateUtil.getSessionFactory().openSession();
       Transaction tran = session.beginTransaction();
       session.update(phongban);
      tran.commit();
   }
    public void remove(String maphong){
    Session session = HibernateUtil.getSessionFactory().openSession();
       Transaction tran = session.beginTransaction();
       Phongban pb = (Phongban) session.get(Phongban.class, maphong);
       session.delete(pb);
      tran.commit();
    }
   public void addpb(Phongban phongban){
       Session session = HibernateUtil.getSessionFactory().openSession();
       Transaction tran = session.beginTransaction();
       session.save(phongban);
      tran.commit();
   }
   public BigInteger sopb(){
    Session session = HibernateUtil.getSessionFactory().openSession();
       Transaction tran = session.beginTransaction();
       Query q = session.createSQLQuery("select count(*) from phongban");
       BigInteger i = (BigInteger) q.uniqueResult();
      tran.commit();
   return i;
   }
 public Phongban maphong(String maphong){
 Session ss = HibernateUtil.getSessionFactory().openSession();
 Transaction tran = ss.beginTransaction();
 Query q = ss.createQuery("from Phongban where maphong = :maphong");
 q.setString("maphong", maphong);
 Phongban pb =(Phongban) q.uniqueResult();
 return pb;
 }
  public Phongban tenphong(String tenphong){
 Session ss = HibernateUtil.getSessionFactory().openSession();
 Transaction tran = ss.beginTransaction();
 Query q = ss.createQuery("from Phongban where tenphong = :tenphong");
 q.setString("tenphong", tenphong);
 Phongban pb =(Phongban) q.uniqueResult();
 return pb;
 }
}
