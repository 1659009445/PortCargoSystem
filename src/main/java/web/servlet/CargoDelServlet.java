package web.servlet;

import service.CargoService;
import service.impl.CargoServiceImpl;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet("/CargoDelServlet")
public class CargoDelServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //获取货物id
        String _id = request.getParameter("id");
        int id = Integer.parseInt(_id);
        //获取用户id
        //重新返回管理页面(加载该用户相关数据)
        String _uid = request.getParameter("uid");
        int uid = Integer.parseInt(_uid);

        CargoService service = new CargoServiceImpl();
        service.delCargoByid(id);

        response.sendRedirect("/PortCargoSystem_war_exploded/CargoUserServlet?id="+uid);
    }
}
