package aaa.service;

import javax.annotation.Resource;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import aaa.service.admin.AdminInterceptor;

@Configuration
public class WebMVCConfig implements WebMvcConfigurer {
   
   @Resource
   AdminInterceptor ai;
   
   @Resource
   ClientInterceptor client;
   
   @Override
   public void addInterceptors(InterceptorRegistry registry) {
      registry.addInterceptor(ai).addPathPatterns("/admin/**");
      
      registry.addInterceptor(client)
      		.addPathPatterns("/shoeger/myPage/**")
      		.addPathPatterns("/shoeger/member/**")
      		.addPathPatterns("/shoeger/shop/buyOrderView")
      		.addPathPatterns("/shoeger/sell/sellregcomp")
      		.addPathPatterns("/shoeger/sell/policy")
      		.addPathPatterns("/shoeger/shop/payone");
   }
}