package aaa.service;

import java.net.InetAddress;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import aaa.model.ClientMapper;
import aaa.model.VisitorDTO;

@Service
public class VisitService implements HomeService {

   @Resource
   ClientMapper client;

   @Override
   public Object execute(HttpServletRequest request, HttpSession session) {
      String sessionId = session.getAttribute("sessionId") + "";

      if (sessionId == null || sessionId.equals("") || sessionId.equals("null")) {
         session.setAttribute("sessionId", request.getParameter("pid"));
         session.setAttribute("kind", request.getParameter("kind"));
         System.out.println("session들어옴");
      }

      HttpServletRequest req = ((ServletRequestAttributes) RequestContextHolder.currentRequestAttributes())
            .getRequest();

      InetAddress local;
      String ip = "";
      String browser = "";

      try {

         local = InetAddress.getLocalHost();
         ip = local.getHostAddress();

         System.out.println("local ip : " + ip);
         
         String browserInfo = req.getHeader("User-Agent"); // 사용자 User-Agent 값 얻기

         if (browserInfo != null) {
            if (browserInfo.indexOf("Trident") > -1) {
               browser = "MSIE";
            } else if (browserInfo.indexOf("Chrome") > -1) {
               browser = "Chrome";
            } else if (browserInfo.indexOf("Opera") > -1) {
               browser = "Opera";
            } else if (browserInfo.indexOf("iPhone") > -1 && browserInfo.indexOf("Mobile") > -1) {
               browser = "iPhone";
            } else if (browserInfo.indexOf("Android") > -1 && browserInfo.indexOf("Mobile") > -1) {
               browser = "Android";
            }

            System.out.println("sessionId : " + sessionId);
            System.out.println("browser : " + browser);

         }
      } catch (Exception e) {
         e.printStackTrace();
      }
      sessionId = session.getAttribute("sessionId") + "";

      if (sessionId.equals("null")) {
         sessionId = "비회원";
      }

      VisitorDTO vDTO = new VisitorDTO();
      vDTO.setVisit_id(sessionId);
      vDTO.setVisit_ip(ip);
      vDTO.setVisit_agent(browser);

      client.visitData(vDTO);

      return null;
   }

}