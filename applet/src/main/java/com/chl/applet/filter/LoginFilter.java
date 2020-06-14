package com.chl.applet.filter;

import com.chl.applet.util.StringToNumberUtil;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletMapping;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebFilter(urlPatterns = {"/user/*", "/daily/*", "/drafts/*", "/ed/*", "/cal/*","/show/*"})
public class LoginFilter implements Filter {
    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        HttpServletRequest request = (HttpServletRequest) servletRequest;
        HttpServletResponse response = (HttpServletResponse) servletResponse;
        Object USER = request.getSession().getAttribute("USER");
        String bath = request.getServletPath();
        if ((bath.toLowerCase().contains("login")) || (bath.toLowerCase().contains("register"))) {
            filterChain.doFilter(servletRequest, servletResponse);
        } else {
            if (USER == null) {
                if(bath.contains("show")){
                    Integer edId= StringToNumberUtil.getNumber(bath);
                    response.sendRedirect(request.getContextPath() + "/to_login?edId="+edId);
                }else {
                    response.sendRedirect(request.getContextPath() + "/to_login");
                }
            } else {
                filterChain.doFilter(servletRequest, servletResponse);
            }
        }
    }
}
