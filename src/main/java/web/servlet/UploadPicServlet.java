package web.servlet;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.File;
import java.io.IOException;
import java.util.List;

@WebServlet("/UploadPicServlet")
public class UploadPicServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");

        DiskFileItemFactory factory = new DiskFileItemFactory();

        ServletFileUpload sfu = new ServletFileUpload(factory);

        sfu.setFileSizeMax(1920*1080);

        try {
            List<FileItem> items = sfu.parseRequest(request);

            for(int i=0;i<items.size();i++){
                FileItem item = items.get(i);

                if(!item.isFormField()){
                    ServletContext sctx = getServletContext();
                    //
                    String path = sctx.getRealPath("/upload");
                    System.out.println(path);
                    String fileName = item.getName();
                    System.out.println(fileName);
                    fileName = fileName.substring(fileName.lastIndexOf("/")+1);
                    File file = new File(path+"\\"+fileName);
                    if(!file.exists()){
                        item.write(file);

                        response.sendRedirect("/upload/ok.html");
                    }
                }

            }
        } catch (FileUploadException e) {
            e.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        }

    }
}
