import java.io.*;
import java.lang.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class main extends HttpServlet {

		private String message;

		public void init() throws ServletException
		{
				message = "Hello World";
		}

		public int fibonacci(int n)
		{
				if(n == 0) return 0;
				if(n == 1) return 1;
				return fibonacci(n-1) + fibonacci(n-2);
		}

		private int test1()
		{
				//try{
						//Thread.sleep(500);
				return fibonacci(20);
				//} catch(InterruptedException e)
				//{
				//			return 0;
				//	}

		}

		public void doGet(HttpServletRequest request, HttpServletResponse response) 
				throws ServletException, IOException {
				response.setContentType("text/plain");
				PrintWriter out = response.getWriter();
				out.println(test1());
		}
  
		public void destroy()
		{

		}
}
