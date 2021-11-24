package web.filter;

import javax.servlet.*;
import javax.servlet.annotation.*;
import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.lang.reflect.InvocationHandler;
import java.lang.reflect.Method;
import java.lang.reflect.Proxy;
import java.util.ArrayList;
import java.util.List;

/**
 * 敏感词过滤
 */
@WebFilter(filterName = "SensitiveFilter")
public class SensitiveFilter implements Filter {
    //Sensitive Words ArrayList
    private List<String> list = new ArrayList<String>();

    public void init(FilterConfig config) throws ServletException {
        try{
            //获取路径
            ServletContext servletContext = config.getServletContext();
            String realPath = servletContext.getRealPath("/WEB-INF/classes/sensitive.txt");
            //读取
            BufferedReader br = new BufferedReader(new FileReader(realPath));
            //添加
            String l = null;
            while((l=br.readLine())!=null){
                list.add(l);
            }
            //释放
            br.close();

        }catch (Exception e){
            e.printStackTrace();}

    }

    public void destroy() {
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws ServletException, IOException {
        //代理对象 增强getParameter
        ServletRequest proxy_req = (ServletRequest) Proxy.newProxyInstance(request.getClass().getClassLoader(), request.getClass().getInterfaces(), new InvocationHandler() {
            @Override
            public Object invoke(Object proxy, Method method, Object[] args) throws Throwable {
                //判断是否是需要增强的方法
                if(method.getName().equals("getParameter")){
                    //获取值
                    String value = (String) method.invoke(request,args);
                    //遍历
                    if(value!=null){
                        for (String s : list) {
                            if(value.contains(s)){
                                value = value.replaceAll(s,"***");
                            }
                        }
                    }
                    return value;
                }

                return method.invoke(request,args);
            }
        });

        chain.doFilter(proxy_req, response);
    }
}
