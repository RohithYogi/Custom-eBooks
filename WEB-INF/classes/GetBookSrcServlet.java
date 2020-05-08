import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.*;
import javax.servlet.jsp.*;
import javax.servlet.http.*;
import javax.servlet.jsp.tagext.*;
import com.ebooks.ExistSearchUtil;
import com.ebooks.CustomEbookBuilder;
import org.w3c.dom.*;
import java.util.*;

import java.io.StringReader;
import java.util.ArrayList;
import java.util.List;
import java.util.*;
import java.nio.file.Paths;
import java.nio.file.Path;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import org.w3c.dom.Document;
import org.xml.sax.InputSource;




public class GetBookSrcServlet extends HttpServlet {

  public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    String id = request.getParameter("name");
    PrintWriter out = response.getWriter();
    HttpSession session = request.getSession();
    ExistSearchUtil ex = (ExistSearchUtil)session.getAttribute("ex");
    CustomEbookBuilder cb = (CustomEbookBuilder)session.getAttribute("cb");
    String ret = ex.PdfLocationAtIndex(Integer.parseInt(id));
    String absPath = "./../uploads/";
    Path path = Paths.get(ret);
    ret = path.getFileName().toString();
     // "../GIS_Project_Proposal.pdf";
    // get source of pdf into ret
    out.println(absPath + ret);
    session.setAttribute("ex",ex);
  }
}
