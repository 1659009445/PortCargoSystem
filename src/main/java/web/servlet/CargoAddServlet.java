package web.servlet;

import dom.Cargo;
import dom.PageBean;
import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.beanutils.ConvertUtils;
import org.apache.commons.beanutils.converters.DateConverter;
import service.CargoService;
import service.impl.CargoServiceImpl;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.lang.reflect.InvocationTargetException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;

@WebServlet("/CargoAddServlet")
public class CargoAddServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");

        Map<String, String[]> map = request.getParameterMap();
        Cargo cargo = new Cargo();
/**
 * BeanUtils注册 不支持date->string
 */
        try {
            DateConverter converter = new DateConverter();
            converter.setPattern(new String("yyyy-MM-dd"));
            ConvertUtils.register(converter, Date.class);
            BeanUtils.populate(cargo,map);
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        } catch (InvocationTargetException e) {
            e.printStackTrace();
        }
        //service
        CargoService service = new CargoServiceImpl();
        service.addCargo(cargo);

        //重定向
        //test

        PrintWriter out = response.getWriter();
        out.print("succes!");

        response.sendRedirect("/PortCargoSystem_war_exploded/bussinessManagement.jsp");
    }
}
