import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.*;
import javax.servlet.jsp.*;
import javax.servlet.http.*;
import javax.servlet.jsp.tagext.*;
import com.ebooks.CustomEbookBuilder;
import org.w3c.dom.*;
import java.util.*;

import java.io.StringReader;
import java.util.*;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import org.w3c.dom.Document;
import org.xml.sax.InputSource;




public class RemoveChapterServlet extends HttpServlet {

  public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    String id = request.getParameter("name");
    PrintWriter out = response.getWriter();
    HttpSession session = request.getSession();
    CustomEbookBuilder cb = (CustomEbookBuilder) session.getAttribute("cb");

    cb.removeChapter(Integer.parseInt(id));

    session.setAttribute("cb",cb);
  }
}
