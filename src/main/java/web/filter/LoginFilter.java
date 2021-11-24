package web.filter;

import javax.servlet.*;
import javax.servlet.annotation.*;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;

/**
 * 登陆验证过滤器
 */
@WebFilter("/*")
public class LoginFilter implements Filter {
    public void init(FilterConfig config) throws ServletException {
    }

    public void destroy() {
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws ServletException, IOException {
        //ServletRequest转为HttpServletRequest
        HttpServletRequest req = (HttpServletRequest)  request;
        //获取登录相关页面uri
        String uri = req.getRequestURI();

        if(uri.contains("/index.jsp") ||uri.contains("/login.jsp") || uri.contains("/register.jsp") || uri.contains("/loginServlet") || uri.contains("/RegisterServlet") || uri.contains("/checkServlet") || uri.contains("/css/") || uri.contains("/js/") || uri.contains("/img/") || uri.contains("/fonts/")){
            //判断为登录行为 放行
            chain.doFilter(request, response);
        }else{
            //获取用户session
            Object user = req.getSession().getAttribute("user");
            if(user != null){
                chain.doFilter(request, response);
            }else{
                req.setAttribute("login_msg","请先登录!");
                req.getRequestDispatcher("/login.jsp").forward(request,response);
            }
        }


    }
}
