/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.nhanvienDAO;
import dao.phongbanDAO;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import model.Nhanvien;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import model.Phongban;
import model.Thanhtichkyluat;
import model.listthanhtich;
import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import service.nhanvienService;
import service.phongbanService;
import service.thanhtichkyluatService;

/**
 *
 * @author TUE
 */
@Controller
@RequestMapping("/home")
public class HomeController {
    
     
    
    @RequestMapping(value = "/login",method = RequestMethod.GET)
    public String Login(ModelMap mm){ 
        return "/login";
    }
    
@RequestMapping(value = "/login", method = RequestMethod.POST)
public String login(HttpServletRequest request, HttpServletResponse response,
         HttpSession session,@ModelAttribute("userForm") Nhanvien nv, ModelMap mm) {
    Nhanvien userad = nhanvienService.login(nv.getEmail(), nv.getPassword());
    Nhanvien usernv = nhanvienService.loginnv(nv.getEmail(), nv.getPassword());
     if (userad != null || usernv != null) {
        session.setAttribute("userad", userad);
        session.setAttribute("usernv", usernv);
        return "redirect:/";
    } else  {
        mm.put("msg", "Incorrect email or password!");
        return "/login";
   }}
@RequestMapping(value = "/logout", method = RequestMethod.GET)
public void logout(HttpServletRequest request, HttpServletResponse response) throws IOException{
request.getSession().invalidate();
 response.sendRedirect(request.getContextPath() + "/home/login");
}
@Autowired
    nhanvienService nhanvienService;
     @RequestMapping(value = "/",method = RequestMethod.GET)
    public String trangchu(ModelMap mm,HttpSession session){
       if(null == session.getAttribute("userad") && null == session.getAttribute("usernv")){
        return "redirect:/home/login";} 
       mm.put("thoigianthem", nhanvienService.getAllNhanvien());
       mm.addAttribute("sonv", nhanvienService.sonv());
        mm.addAttribute("sopb", phongbanService.sopb());
        return "/Home";
    }
    
      
    @RequestMapping(value = "/employed", method = RequestMethod.GET)
    public String employed(ModelMap mm,HttpSession session,Nhanvien nv){
       if(null == session.getAttribute("userad") && null == session.getAttribute("usernv")){
        return "redirect:/home/login";} 
        mm.put("list", nhanvienService.getAllNhanvien());
    return "/nv/employed";
    }
        @Autowired
    phongbanService phongbanService;
    @RequestMapping("/Department")
    public String department(Map<String, Object> mm,HttpSession session){
        if(null == session.getAttribute("userad") && null == session.getAttribute("usernv")){
        return "redirect:/home/login";}
    mm.put("listpb", phongbanService.getAllphongban());
    
    return "/pb/Department";
    }
    @Autowired
    thanhtichkyluatService thanhtichkyluatService;
    @RequestMapping("/achievements")
    public String achievements(ModelMap mm,HttpSession session){
        if(null == session.getAttribute("userad") && null == session.getAttribute("usernv")){
        return "redirect:/home/login";}
    mm.put("listtt", thanhtichkyluatService.getAllthThanhtichkyluat());
    return "/thanhtich/achievements";
    }
    @RequestMapping(value = "/editnv",method = RequestMethod.GET)
    public String editnv(@RequestParam(value = "manv")String manv,ModelMap mm,HttpSession session){
        if(null == session.getAttribute("userad")){
        return "redirect:/home/locktk";}
        Nhanvien nv  = nhanvienService.editnv(manv);
            mm.addAttribute("suanv", nv);
    List<Phongban> list = phongbanService.getAllphongban();
    mm.addAttribute("list_pb",list);
     getListDepart(mm);
       mm.put("list", nhanvienService.getAllNhanvien());
    return "/nv/editemployed";
    }
    nhanvienDAO nhanvienDao;
    @RequestMapping(value = "/updatenv",method = RequestMethod.POST)
    public String updatenv(ModelMap mm,Nhanvien nv ,HttpServletRequest request,@ModelAttribute(value = "suanv") @Valid Nhanvien suanv, BindingResult result , HttpSession session, @RequestParam(value = "fileUpload", required = false) MultipartFile fileUpload){
        if(null == session.getAttribute("userad") ){
        return "redirect:/home/locktk";}
        if(result.hasErrors()){
                mm.put("list", nhanvienService.manvthem());
           return "/nv/editemployed";
           }
                String path = request.getSession().getServletContext().getRealPath("/") + "assets/core/img/friends/";
    if (fileUpload != null) {
        try {
             FileUtils.forceMkdir(new File(path));
             File upload = new File(path + fileUpload.getOriginalFilename());
             fileUpload.transferTo(upload);
             suanv.setTenhinh(fileUpload.getOriginalFilename());
             nhanvienService.updatenv(suanv);
        } catch (IOException ex) {
             ex.printStackTrace();
        }}
     return "redirect:/home/employed";
       
   
    }
    @RequestMapping(value = "/removenv/{manv}",method = RequestMethod.GET)
    public String deletenv(@PathVariable("manv")String manv, Map<String,Object> map,HttpSession session){
        if(null == session.getAttribute("userad")  ){
        return "redirect:/home/locktk";}
        nhanvienService.removenv(manv);
    return "redirect:/home/employed";
    }
    @RequestMapping(value = "/adddnv",method = RequestMethod.GET)
    public String addnv(ModelMap mm,HttpSession session){
        if(null == session.getAttribute("userad") ){
        return "redirect:/home/locktk";}
    List<Phongban> list = phongbanService.getAllphongban();
    mm.addAttribute("list_pb",list);
   mm.put("list", nhanvienService.manvthem());
    return "/nv/adddem";
    }
    @RequestMapping(value = "/addem",method = RequestMethod.POST)
    public String addem(ModelMap mm, @ModelAttribute("userForm") @Valid Nhanvien nv , BindingResult result , HttpServletRequest request,Nhanvien suanv,HttpSession session, @RequestParam(value = "fileUpload", required = false) MultipartFile fileUpload){
        if(null == session.getAttribute("userad") ){
        return "redirect:/home/locktk";}
        Nhanvien formemail = nhanvienService.email(nv.getEmail());
        Nhanvien formsdt = nhanvienService.sdt(nv.getDienthoai());
        if( formemail != null ){
        mm.put("erroremail", "Email này đã có người sử dụng. Vui lòng nhập email khác!");
         return "/nv/adddem";
        }
          if( formsdt != null ){
        mm.put("errorsdt", "Số điện thoại này đã có người sử dụng. Vui lòng nhập số khác!");
        return "/nv/adddem";
        }
           if(result.hasErrors()){
                mm.put("list", nhanvienService.manvthem());
           return "/nv/adddem";
           }
        else{
             
            String path = request.getSession().getServletContext().getRealPath("/") + "assets/core/img/friends/";
    if (fileUpload != null) {
        try {
             FileUtils.forceMkdir(new File(path));
             File upload = new File(path + fileUpload.getOriginalFilename());
             fileUpload.transferTo(upload);
             suanv.setTenhinh(fileUpload.getOriginalFilename());
             nhanvienService.addnv(suanv);
        } catch (IOException ex) {
             ex.printStackTrace();
        }
    }
    return "redirect:/home/employed"; }
    } 

    @RequestMapping(value = "/editpb",method = RequestMethod.GET)
    public String editpb(@RequestParam(value = "maphong")String maphong,ModelMap mm,HttpSession session){
        if(null == session.getAttribute("userad") ){
        return "redirect:/home/locktk";}
    Phongban pb  = phongbanService.edit(maphong);
    mm.addAttribute("suapb", pb);
       
    return "/pb/editpb";
    }
    
    @RequestMapping(value = "/updatepb",method = RequestMethod.POST)
    public String updatepb(@ModelAttribute(value = "suapb")Phongban phongban,HttpSession session, ModelMap mm){
        if(null == session.getAttribute("userad") ){
        return "redirect:/home/locktk";}
        
        Phongban pb = phongbanService.maphong(phongban.getMaphong());
        Phongban pb1 = phongbanService.tenphong(phongban.getTenphong());
        if(pb.getMaphong().equals(phongban.getMaphong()) && pb.getTenphong().equals(phongban.getTenphong())){
        phongbanService.update(phongban);
    return "redirect:/home/Department";
        }
         if(pb1 != null){
        mm.put("errorpb1", "Tên Phòng ban này đã có");
        return "/pb/adddpb"; 
        }
        else{
        phongbanService.update(phongban);
    return "redirect:/home/Department";}
    }
     @RequestMapping(value = "/removepb/{maphong}",method = RequestMethod.GET)
    public String deletepb(@PathVariable("maphong")String maphong, Map<String,Object> map,HttpSession session){
        if(null == session.getAttribute("userad") ){
        return "redirect:/home/locktk";}
        phongbanService.remove(maphong);
    return "redirect:/home/Department";
    }
    @RequestMapping(value = "/addpb",method = RequestMethod.GET)
    public String addpb(HttpSession session, ModelMap mm){
        if(null == session.getAttribute("userad") ){
        return "redirect:/home/locktk";
       } 
       
    return "/pb/adddpb";
    }
    
    @RequestMapping(value = "/addpbp",method = RequestMethod.POST)
    public String adddpb(Phongban phongban,HttpSession session, ModelMap mm){
        if(null == session.getAttribute("userad") ){
        return "redirect:/home/locktk";}
        Phongban pb = phongbanService.maphong(phongban.getMaphong());
        Phongban pb1 = phongbanService.tenphong(phongban.getTenphong());
      if(pb != null){
        mm.put("errorpb", "Mã Phòng ban này đã có");
        return "/pb/adddpb"; 
        }
     if(pb1 != null){
        mm.put("errorpb1", "Tên Phòng ban này đã có");
        return "/pb/adddpb"; 
        }
                else{
        phongbanService.addpb(phongban);
    return "redirect:/home/Department";}
    }
    
    
    @Autowired
     @RequestMapping(value = "/locktk",method = RequestMethod.GET)
    public String locktk(){ 
        return "/locknv";
    }
    @RequestMapping(value = "/diemdanh",method = RequestMethod.GET)
    public String diemdanh(@RequestParam(value = "maphongban")String maphongban,ModelMap mm,HttpSession session){
        if(null == session.getAttribute("userad") ){
        return "redirect:/home/locktk";}
        
   ArrayList<Nhanvien> nv = nhanvienService.findpb(maphongban);
   mm.put("themdd", thanhtichkyluatService.getAllthThanhtichkyluat());
    mm.addAttribute("pbnv", nv);
    return "/pb/pb";
    }
    
     public void getListDepart(ModelMap model){
         phongbanDAO pbdao = new phongbanDAO();
        List<Phongban> listDepart= pbdao.getAllphongban();
        if(!listDepart.isEmpty()){
            HashMap<String, String> hashMap= new HashMap<String, String>();
            for (Phongban depaerts : listDepart){
                hashMap.put(depaerts.getMaphong(), depaerts.getTenphong());
            }
            System.out.println(hashMap);
            model.addAttribute("lspb", hashMap);
        }
    }
        @ModelAttribute("listtt")
     public listthanhtich thanhtichkl(){
         listthanhtich listtt = new listthanhtich();
        List<Thanhtichkyluat> thanhtich = new ArrayList<Thanhtichkyluat>();
     for(int i=0;i<1;i++){
         thanhtich.add(new Thanhtichkyluat());        
     }
     listtt.setThanhtich(thanhtich);
     return listtt;
     }
     
     
     
     
    @RequestMapping(value = "/addtt",method = RequestMethod.POST)
    public String addtt(HttpSession session,@ModelAttribute("listtt") listthanhtich listtt){
        if(null == session.getAttribute("userad") ){
        return "redirect:/home/locktk";}
   for(Thanhtichkyluat tt : listtt.getThanhtich()){
   thanhtichkyluatService.addtt(tt);
   
   }
    return "redirect:/home/Department";
    }
     @RequestMapping(value = "/tongdiemcn", method = RequestMethod.GET)
    public String tongdiemcn(ModelMap mm,HttpSession session,Nhanvien nv){
       if(null == session.getAttribute("userad") && null == session.getAttribute("usernv")){
        return "redirect:/home/login";} 
    return "/thanhtich/thanhtichcanhan";
    }
    
       @RequestMapping(value = "/tongdiempb", method = RequestMethod.GET)
    public String tongdiempb(ModelMap mm,HttpSession session,Nhanvien nv){
       if(null == session.getAttribute("userad") && null == session.getAttribute("usernv")){
        return "redirect:/home/login";} 
    return "/thanhtich/thanhtichphongban";
    }
  
}

