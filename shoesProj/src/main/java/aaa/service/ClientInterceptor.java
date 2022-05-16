package aaa.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;
import org.springframework.web.servlet.HandlerInterceptor;

@Service
public class ClientInterceptor implements HandlerInterceptor {
   @Override
   public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
         throws Exception {
	   HttpSession session = request.getSession();

	   String url = request.getRequestURI().substring(request.getContextPath().length()).split("/")[3];
	   String pid = session.getAttribute("sessionId") + "";
	   
	   if(url.equals("center")) {
    	  String catePid = request.getParameter("pid");
    	  String cate = request.getRequestURI().substring(request.getContextPath().length()).split("/")[5];
    	  
    	  if(pid.equals("null") && (cate.equals("insertForm") || cate.equals("modifyForm"))) {
	         response.sendRedirect("/intercepter/fail");
	         return false;
    	  }
    	  
    	  if(!pid.equals(catePid) && cate.equals("modifyForm")) {
    		  response.sendRedirect("/intercepter/fail");
    		  return false;
    	  }
    	  
    	  return true;
      }
      if(pid.equals("null") && (url.equals("logout") || url.equals("myy") || url.equals("payone") || url.equals("sellregcomp"))) {
         
         response.sendRedirect("/intercepter/fail");
         return false;
      }
      
      if(!pid.equals("null") && !url.equals("myy") && !url.equals("logout")) {
    	  String model = request.getParameter("model");
    	  if(url.equals("sellregcomp")) {
    		  String psize = request.getParameter("psize");
    		  if(model != null || psize != null) {
    			  return true;
    		  }
    	  }
    	  
    	  if(url.equals("payone")) {
    		  String productid = request.getParameter("productid");
    		  if(model != null || productid != null) {
    			  return true;
    		  } 
    	  }
    	  
    	  response.sendRedirect("/intercepter/fail");
          return false;
      }
      
      
      return true;
   }
}