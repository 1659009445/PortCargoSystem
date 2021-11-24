package web.servlet;

import dom.Cargo;
import dom.PageBean;
import service.CargoService;
import service.impl.CargoServiceImpl;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.Map;

@WebServlet("/CargoFindServlet")
public class CargoFindServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
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

        Map<String, String[]> condition = request.getParameterMap();
       // System.out.println(condition.toString());

        CargoService service = new CargoServiceImpl();
        PageBean<Cargo> pc = service.CargoFind(currentPage,rows,condition);

        //System.out.println(pc);

        request.setAttribute("pc",pc);
        //存入查询条件并返回
        request.setAttribute("condition",condition);

//        request.getRequestDispatcher("/CargoListServlet").forward(request,response);
        request.getRequestDispatcher("CargoFind.jsp").forward(request,response);
    }
}
