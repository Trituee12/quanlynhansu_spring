package model;
// Generated Apr 13, 2018 2:16:40 AM by Hibernate Tools 4.3.1


import java.math.BigInteger;
import java.util.Date;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 * Thanhtichkyluat generated by hbm2java
 */
@Entity
@Table(name="thanhtichkyluat"
    ,catalog="quanlythanhtichabc"
)
public class Thanhtichkyluat  implements java.io.Serializable {

    private int matt;

     private Nhanvien nhanvien;
     private int loai;
 
     private Date ngayghinhan;
     private Phongban phongban;
  

    public Thanhtichkyluat() {
    }

    public Thanhtichkyluat(int matt, Nhanvien nhanvien, int loai, Date ngayghinhan, Phongban phongban) {
        this.matt = matt;
        this.nhanvien = nhanvien;
        this.loai = loai;
        this.phongban = phongban;
        this.ngayghinhan = ngayghinhan;
    }

   

    public Thanhtichkyluat(int matt, int loai, Date ngayghinhan) {
        this.matt = matt;
        this.loai = loai;
   
        this.ngayghinhan = ngayghinhan;
    }
   
     
    @Id
    @Column(name="matt", unique=true, nullable=false)
    @GeneratedValue(strategy = GenerationType.AUTO)
    public int getMatt() {
        return this.matt;
    }
    
    public void setMatt(int matt) {
        this.matt = matt;
    }
    

@ManyToOne(fetch=FetchType.LAZY, cascade = { CascadeType.MERGE, CascadeType.PERSIST})
@JoinColumn(name = "manhanvien")
    public Nhanvien getNhanvien() {
        return this.nhanvien;
    }
    
    public void setNhanvien(Nhanvien nhanvien) {
        this.nhanvien = nhanvien;
    }
@ManyToOne(fetch=FetchType.LAZY, cascade = { CascadeType.MERGE, CascadeType.PERSIST})
@JoinColumn(name = "maphongb")
    public Phongban getPhongban() {
        return phongban;
    }

    public void setPhongban(Phongban phongban) {
        this.phongban = phongban;
    }
    

    
    @Column(name="loai")
    public int getLoai() {
        return this.loai;
    }
    
    public void setLoai(int loai) {
        this.loai = loai;
    }

    
    

    @Temporal(TemporalType.DATE)
    @Column(name="ngayghinhan", length=10)
    public Date getNgayghinhan() {
        return this.ngayghinhan;
    }
    
    public void setNgayghinhan(Date ngayghinhan) {
        this.ngayghinhan = ngayghinhan;
    }



}


