package web.servlet;

import dom.Cargo;
import service.CargoService;
import service.impl.CargoServiceImpl;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet("/CargoModifyServlet")
public class CargoModifyServlet extends HttpServlet {
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
//        String _uid = request.getParameter("uid");
//        int uid = Integer.parseInt(_uid);

        CargoService service = new CargoServiceImpl();
        Cargo cargo = service.findCargoById(id);

        request.setAttribute("cargo",cargo);
        request.getRequestDispatcher("/CargoModify.jsp").forward(request,response);
    }
}
