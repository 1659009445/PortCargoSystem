package web.servlet;

import dom.User;
import org.apache.commons.beanutils.BeanUtils;
import service.UserService;
import service.impl.UserServiceImpl;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.Map;

@WebServlet("/loginServlet")
public class loginServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        //验证码
        //获取--checkcode
        String checkcode = request.getParameter("checkcode");
        //获取--checkServlet并移除
        HttpSession session = request.getSession();
        String checkcodeServ = (String)session.getAttribute("checkcodeServ");

        //判断
        if(!checkcodeServ.equalsIgnoreCase(checkcode)){
            request.setAttribute("login_smg","验证码错误!");
            request.getRequestDispatcher("/login.jsp").forward(request,response);
            return;
        }
        session.removeAttribute("checkcodeServ");
        //封装user对象
        Map<String, String[]> map= request.getParameterMap();
        User user = new User();
        try {
            BeanUtils.populate(user,map);
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        } catch (InvocationTargetException e) {
            e.printStackTrace();
        }

        //调用service
        UserService service = new UserServiceImpl();
        User loginUser = service.login(user);
        if(loginUser!=null){
            //登陆成功
            //存入session
            session.setAttribute("user",loginUser);
            //重定向 跳转页面
            response.sendRedirect("/PortCargoSystem_war_exploded/index.jsp");
        }else{
            request.setAttribute("login.msg","登陆失败，用户名或密码错误!");
            request.getRequestDispatcher("/login.jsp").forward(request,response);
        }

    }
}
