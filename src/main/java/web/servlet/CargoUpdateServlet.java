package web.servlet;

import dom.Cargo;
import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.beanutils.ConvertUtils;
import org.apache.commons.beanutils.converters.DateConverter;
import service.CargoService;
import service.impl.CargoServiceImpl;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.Date;
import java.util.Map;

@WebServlet("/CargoUpdateServlet")
public class CargoUpdateServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        Map<String, String[]> map = request.getParameterMap();
        Cargo cargo = new Cargo();

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

        CargoService service = new CargoServiceImpl();
        service.updateUser(cargo);

        //获取用户id
        //重新返回管理页面(加载该用户相关数据)
        String _uid = request.getParameter("uid");
        int uid = Integer.parseInt(_uid);
        request.setAttribute("uid",uid);

        response.sendRedirect("/PortCargoSystem_war_exploded/CargoUserServlet?id="+uid);
    }
}
