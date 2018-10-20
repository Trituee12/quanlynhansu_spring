/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.math.BigInteger;
import model.Nhanvien;
import java.util.ArrayList;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import util.HibernateUtil;
/**
 *
 * @author TUE
 */
public class nhanvienDAO {
    
public ArrayList<Nhanvien> getAllnhanvien(){
     Session session = HibernateUtil.getSessionFactory().openSession();
     Transaction tran = session.beginTransaction();
     Query query = (Query) session.createQuery("from Nhanvien order by CONVERT(substring(manv,3,6), int) asc");
     ArrayList<Nhanvien> list = (ArrayList<Nhanvien>) query.list();
     tran.commit();
     return list;
    
}
public BigInteger Manv(){
Session  ss = HibernateUtil.getSessionFactory().openSession();
Transaction tran  = ss.beginTransaction();
Query q = ss.createSQLQuery("SELECT CONVERT(substring(manv,3,6), int)+1 as so from Nhanvien order by so desc limit 1");
Object nv = q.uniqueResult();
return (BigInteger) nv;
}
    public Nhanvien login(String email, String password) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tran = session.beginTransaction();
        Query query = session.createQuery(" from Nhanvien where email = :email and password = :password and loaitk = 'AD'");
        query.setString("email", email);
        query.setString("password", password);
        Nhanvien user = (Nhanvien) query.uniqueResult();
        return user;
}   
    public Nhanvien loginnv(String email, String password) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tran = session.beginTransaction();
        Query query = session.createQuery("from Nhanvien where email = :email and password = :password and loaitk = 'NV'");
        query.setString("email", email);
        query.setString("password", password);
        Nhanvien user = (Nhanvien) query.uniqueResult();
        return user;
}   
 public Nhanvien findBymanv(String manv){
       Session session = HibernateUtil.getSessionFactory().openSession();
       Transaction tran = session.beginTransaction();
          Nhanvien nhanvien = (Nhanvien) session.get(Nhanvien.class, manv);
      tran.commit();
   return nhanvien; }
   
   public  ArrayList<Nhanvien> findpb(String maphongban){
       Session session = HibernateUtil.getSessionFactory().openSession();
       Transaction tran = session.beginTransaction();
          Query query = session.createQuery("from Nhanvien where maphongban = :maphongban");
          query.setString("maphongban", maphongban);
           ArrayList<Nhanvien> list = (ArrayList<Nhanvien>) query.list();
   return list; }
       
    
 
 public void editnv(Nhanvien nv){   
          Session session = HibernateUtil.getSessionFactory().openSession();
       Transaction tran = session.beginTransaction();
       session.saveOrUpdate(nv);
     tran.commit();
}
 public void remove(String manv){
  Session session = HibernateUtil.getSessionFactory().openSession();
       Transaction tran = session.beginTransaction();
        Nhanvien nvv = (Nhanvien) session.get(Nhanvien.class, manv);
       session.delete(nvv);
        tran.commit();
 }
 public void addnv(Nhanvien nv){
     Session session = HibernateUtil.getSessionFactory().openSession();
     Transaction tran = session.beginTransaction();
     session.save(nv);
     tran.commit();
 }
 public BigInteger sonv(){
 Session session = HibernateUtil.getSessionFactory().openSession();
     Transaction tran = session.beginTransaction();
     Query q = session.createSQLQuery("select count(*) from nhanvien");
     BigInteger i = (BigInteger) q.uniqueResult();
     tran.commit();
     return i;
 }
 public Nhanvien formemail(String email){
 Session ss = HibernateUtil.getSessionFactory().openSession();
 Transaction tran = ss.beginTransaction();
 Query q = ss.createQuery(" FROM Nhanvien where email = :email");
 q.setString("email", email);
 Nhanvien nv = (Nhanvien) q.uniqueResult();
 return nv;
 }
 public Nhanvien formsdt(String sdt){
 Session ss = HibernateUtil.getSessionFactory().openSession();
 Transaction tran = ss.beginTransaction();
 Query q = ss.createQuery(" FROM Nhanvien where dienthoai = :sdt");
 q.setString("sdt", sdt);
 Nhanvien nv = (Nhanvien) q.uniqueResult();
 return nv;
 }
}
