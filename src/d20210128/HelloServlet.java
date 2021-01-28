package d20210128;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

// Servlet : 웹에서 동작하는 작은 자바 프로그램

@WebServlet("/hello.html")		//이 어노테이션으로 주소를 부여, 주소에 노출이 되도 실제로 이 파일은 없는 거라서 보안성 높아짐
public class HelloServlet extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//super.doGet(req, resp);
		
		PrintWriter out = resp.getWriter();	//출력용 객체
		
		//html 형식으로 사용가능
		out.println("<html>");
		out.println("<head>");
		out.println("<title>Hello</title>");
		out.println("</head>");
		out.println("<body>");
		out.println("<h2> Hello Servlet World </h2>");
		out.println("</body>");
		out.println("</html>");
		
		
	}

}
