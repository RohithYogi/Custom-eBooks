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

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import org.w3c.dom.Document;
import org.xml.sax.InputSource;


public class UploadChapterServelet extends HttpServlet {
  public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    doPost(request, response);
  }

  public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    String name = request.getParameter("name");
    String tags = request.getParameter("tags");
    // String storagepath = request.getParameter("path");
    int id = Integer.parseInt(request.getParameter("id"));

    Element chapter = document.createElement("chapter");
    Element chaptername = document.createElement("name");
    Element chapterkeywords = document.createElement("keywords");
    Element chapterid = document.createElement("chapter_id");
    // Element chapterstoragepath = document.createElement("storage_path");

    Text cname = document.createTextNode(name);
    Text ctag = document.createTextNode(tags);
    Text cid = document.createTextNode(id);
    // Text csp = document.createTextNode(storagepath);


    chaptername.appendChild(cname);
    chapterid.appendChild(cid)
    chapterkeywords.appendChild(ctag);
    // chapterstoragepath.appendChild(csp);

    chapter.appendChild(chaptername);
    chapter.appendChild(chapterid);
    chapter.appendChild(chapterkeywords);
    // chapter.appendChild(chapterkeywords);

    PrintWriter out = response.getWriter();
    HttpSession session = request.getSession();
    ExistSearchUtil ex = (ExistSearchUtil)session.getAttribute("ex");
    CustomEbookBuilder cb = (CustomEbookBuilder)session.getAttribute("cb");

    Element chapter = ex.ChapterAtIndex(Integer.parseInt(id));
    cb.addChapter(chapter);

    session.setAttribute("cb",cb);
    session.setAttribute("ex",ex);
  }
}
