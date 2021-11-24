package web.servlet;

import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.util.Random;

@WebServlet("/checkServlet")
public class checkServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //服务器通知浏览器不要缓存
        response.setHeader("pragma","no-cache");
        response.setHeader("cache-control","no-cache");
        response.setHeader("expires","0");

        /**
         * 属性
         */
        int width=100;
        int height=40;
        int R=(int)(Math.random()*255);
        int G=(int)(Math.random()*255);
        int B=(int)(Math.random()*255);
        String str="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz1234567890";

        BufferedImage Image = new BufferedImage(width,height,BufferedImage.TYPE_INT_RGB);
        Random ran = new Random();
        Graphics graphics = Image.getGraphics();
        /**
         * 背景
         */
        graphics.setColor(new Color(188, 188, 230));
        graphics.fillRect(0,0,width,height);
        /**
         * 验证码
         */
        graphics.setColor(Color.black);
        Font font = new Font("TimesRoman",Font.BOLD,25);
        graphics.setFont(font);
        //sb拼接验证码发送给login&registerServlet进行 验证
        StringBuffer sb = new StringBuffer();
        for(int i=1;i<=4;i++){
            int index=ran.nextInt(str.length());
            char ch=str.charAt(index);
            sb.append(ch);
            //设置验证码字体样式
            int floatx=ran.nextInt(1)+5;
            int floaty=ran.nextInt(1)+4;
            Graphics2D graphics2D = (Graphics2D) graphics.create();
            graphics2D.translate(ran.nextInt(10)+20,ran.nextInt(10)+20);
            graphics2D.rotate(Math.PI/180,-10,-10);
            graphics2D.drawString(ch+"",width/5*i-35+floatx,5+floaty);
//            graphics.drawString(ch+"",(width+6)/5*i+floatx-10,height/2+5+floaty);
        }
        /**
         * 干扰线
         */
        Font font2= new Font("TimesRoman",Font.BOLD,30);
        graphics.setFont(font2);
        graphics.setColor(new Color(186, 186, 187));
        int r=ran.nextInt(15)+10;//生成15-24的随机数
        for(int i=1;i<=r;i++){
            int x1=ran.nextInt(width-1);
            int x2=ran.nextInt(width-1);
            int y1=ran.nextInt(height-1);
            int y2=ran.nextInt(height-1);
            graphics.drawLine(x1,y1,x2,y2);
        }
        Font font3= new Font("TimesRoman",Font.BOLD,25);
        graphics.setFont(font3);
        int r2=ran.nextInt(6)+6;//生成6-11的随机数
        for(int i=1;i<=r2;i++){
            graphics.setColor(new Color(R, G, B));
            int x1=ran.nextInt(width-1);
            int x2=ran.nextInt(width-1);
            int y1=ran.nextInt(height-1);
            int y2=ran.nextInt(height-1);
            graphics.drawLine(x1,y1,x2,y2);
        }
        int r3=ran.nextInt(20)+20;//生成20-39的随机数
        for(int i=1;i<=r3;i++){
            graphics.setColor(new Color(R, G, B));
            int x=ran.nextInt(width-1);
            int y=ran.nextInt(height-1);
            graphics.drawOval(x,y,1,1);
        }
        /**
         * 边框
         */
        graphics.setColor(Color.black);
        graphics.drawRect(0,0,width-1,height-1);

        //返回验证码(session)
        String checkcode =sb.toString();
        request.getSession().setAttribute("checkcodeServ",checkcode);

        //展示验证码
        ImageIO.write(Image,"jpg",response.getOutputStream());



    }
}
