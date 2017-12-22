package com.ic.testvisit;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import dao.VisitDao;
import vo.VisitVo;

@Controller
public class VisitController {
	
	@Autowired
	HttpServletRequest request;
	
	VisitDao dao;
	
    public void setDao(VisitDao dao) {
		this.dao = dao;
	}

	String view_path = "/WEB-INF/views/visit/";
	
	@RequestMapping("/visit/modify_form.do")
	public String modify_form(int idx, Model model){ //Param 값
		
		VisitVo vo = dao.selectOne(idx);
		
		model.addAttribute("vo", vo);
		
		return view_path +"visit_modify_form.jsp";
	}
	
	@RequestMapping("/visit/modify.do")
	public String modify(VisitVo vo){

		String content = vo.getContent().replaceAll("\r\n", "<br>");
		vo.setContent(content);
		
		/*String ip = request.getRemoteAddr();
		vo.setIp(ip);*/
		
		int res = dao.update(vo);
		
		return "redirect:list.do";
	}
	
	@RequestMapping("/visit/delete.do")
	public String delete(int idx){
		
		int res = dao.delete(idx);
		
		return "redirect:list.do";
	}
	
	@RequestMapping("/visit/check_password.do")
	@ResponseBody
	public String check_password(int idx,String c_pwd){
		
	    VisitVo vo = dao.selectOne(idx);
	    
	    String res = "no";
	     if(c_pwd.equals(vo.getPwd())){
	    	res = "yes";
	    } 
		
		return res;
	}
	
	@RequestMapping("/visit/insert.do")
	public String insert(VisitVo vo){

		String content = vo.getContent().replaceAll("\r\n", "<br>");
		vo.setContent(content);
		
		/*String ip = request.getRemoteAddr();
		vo.setIp(ip);*/
		
		int res = dao.insert(vo);
		
		return "redirect:list.do";
	}
	
	@RequestMapping("/visit/insert_form.do")
	public String insert_form(){
		
		return view_path +"visit_insert_form.jsp";
	}
	
	@RequestMapping("/visit/list.do")
    public String selectList(String search,String search_text, Model model){

		VisitVo  vo = new VisitVo();
	
		if(search!=null &&  !search.equals("all")){
		
			if(search.equals("content_name")){
				vo.setContent(search_text);
				vo.setName(search_text);
			}else if(search.equals("content")){
				vo.setContent(search_text);
			}else if(search.equals("name")){
                vo.setName(search_text);
                
			}
		}

		List<VisitVo> list = dao.selectList(vo);
	
		model.addAttribute("list", list);
		
		return view_path + "visit_list.jsp";
	}
	
}

