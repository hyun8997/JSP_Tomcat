package d20210128;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

// Servlet : ������ �����ϴ� ���� �ڹ� ���α׷�

@WebServlet("/hello.html")		//�� ������̼����� �ּҸ� �ο�, �ּҿ� ������ �ǵ� ������ �� ������ ���� �Ŷ� ���ȼ� ������
public class HelloServlet extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//super.doGet(req, resp);
		
		PrintWriter out = resp.getWriter();	//��¿� ��ü
		
		//html �������� ��밡��
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
