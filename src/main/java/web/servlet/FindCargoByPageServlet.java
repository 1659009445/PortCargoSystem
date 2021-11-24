package web.servlet;

import dom.Cargo;
import dom.PageBean;
import service.CargoService;
import service.impl.CargoServiceImpl;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet("/FindCargoByPageServlet")
public class FindCargoByPageServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //PageBean 获取当前页面及没页最大展示数
        String currentPage = request.getParameter("currentPage");
        String rows = request.getParameter("rows");
        //设置首页page 和 rows
        if(currentPage == null || "".equals(currentPage)){
            currentPage="1";
        }
        if(rows == null || "".equals(rows)){
            rows="10";
        }

        CargoService service = new CargoServiceImpl();
        PageBean<Cargo> pc = service.findCargoByPage(currentPage,rows);

        //System.out.println(pc);

        request.setAttribute("pc",pc);

//        request.getRequestDispatcher("/CargoListServlet").forward(request,response);
        request.getRequestDispatcher("CargoManagement.jsp").forward(request,response);
    }
}
