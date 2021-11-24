package web.servlet;

import dao.impl.CargoDaoImpl;
import dom.Cargo;
import dom.User;
import service.CargoService;
import service.impl.CargoServiceImpl;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/CargoListServlet")
public class CargoListServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        CargoService service = new CargoServiceImpl();
        List<Cargo> cargo = service.findAll();
        //存入request
        request.setAttribute("cargo",cargo);
        //转发
        //response.sendRedirect("${pageContext.request.contextPath}/CargoManagement.jsp");
        request.getRequestDispatcher("CargoManagement.jsp").forward(request,response);
    }
}
