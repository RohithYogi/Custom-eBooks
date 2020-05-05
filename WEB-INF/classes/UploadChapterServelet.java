import java.io.IOException;
import java.io.PrintWriter;
import java.io.File;
import java.io.InputStream;
import java.nio.file.Paths;

import javax.servlet.*;
import javax.servlet.jsp.*;
import javax.servlet.http.*;
import javax.servlet.jsp.tagext.*;
import javax.servlet.annotation.MultipartConfig;
import com.ebooks.ExistSearchUtil;
import com.ebooks.CustomEbookBuilder;
import org.w3c.dom.*;
import java.util.*;

import java.io.StringReader;
import java.util.ArrayList;
import java.util.List;
import java.util.*;

import javax.xml.parsers.DocumentBuilder;
import org.w3c.dom.Document;
import javax.xml.parsers.ParserConfigurationException;
import javax.xml.parsers.DocumentBuilderFactory;
import org.xml.sax.InputSource;

@MultipartConfig(fileSizeThreshold=1024*1024*2, // 2MB
                 maxFileSize=1024*1024*10,      // 10MB
                 maxRequestSize=1024*1024*50)
public class UploadChapterServelet extends HttpServlet {

  public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    String chapter_name = request.getParameter("chapter-name");
    String chapter_tags = request.getParameter("chapter-tags");
    Part filePart = request.getPart("chapter-file");

    String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString(); // MSIE fix.
    InputStream fileContent = filePart.getInputStream();

    String appPath = request.getServletContext().getRealPath("");
    String savePath = appPath + File.separator + "uploads";

    // creates the save directory if it does not exists
    File fileSaveDir = new File(savePath);
    if (!fileSaveDir.exists()) {
        fileSaveDir.mkdir();
    }

    filePart.write(savePath + File.separator + fileName);

    try{

          HttpSession session = request.getSession();
          int id;
          if(session.getAttribute("id")!=null)
            id = (int) session.getAttribute("id")+1;
          else 
            id = 1;
          String chapter_id = String.valueOf(id);

          DocumentBuilderFactory documentFactory = DocumentBuilderFactory.newInstance();
          DocumentBuilder documentBuilder = documentFactory.newDocumentBuilder();
          Document document = documentBuilder.newDocument();


          Element chapter = document.createElement("chapter");
          Element chaptername = document.createElement("name");
          Element chapterkeywords = document.createElement("keywords");
          Element chapterid = document.createElement("chapter_id");
          Element chapterstoragepath = document.createElement("storage_path");

          Text cname = document.createTextNode(chapter_name);
          Text ctag = document.createTextNode(chapter_tags);
          Text cid = document.createTextNode(chapter_id);
          Text csp = document.createTextNode(savePath + File.separator + fileName);


          chaptername.appendChild(cname);
          chapterid.appendChild(cid);
          chapterkeywords.appendChild(ctag);
          chapterstoragepath.appendChild(csp);

          chapter.appendChild(chaptername);
          chapter.appendChild(chapterid);
          chapter.appendChild(chapterkeywords);
          chapter.appendChild(chapterstoragepath);

          PrintWriter out = response.getWriter();

          CustomEbookBuilder cb = (CustomEbookBuilder)session.getAttribute("cb");

          cb.addChapter(chapter);
          session.setAttribute("id",id);
          session.setAttribute("cb",cb);
          response.sendRedirect("./../index.jsp");


      }catch (ParserConfigurationException pce) {
        System.out.println("DEBUG : Unable to create builder instance");
        pce.printStackTrace();
      }

  }
}
