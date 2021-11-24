package web.servlet;

import dom.User;
import service.UserService;
import service.impl.UserServiceImpl;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/UserListServlet")
public class UserListServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //调用UserService
        UserService service = new UserServiceImpl();
        List<User> users = service.findAll();
        //存入request
        request.setAttribute("users",users);
        //转发
        request.getRequestDispatcher("test.jsp").forward(request,response);
    }
}
