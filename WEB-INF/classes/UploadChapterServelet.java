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
    response.sendRedirect("./info.html");

    // String name = request.getParameter("name");
    // String tags = request.getParameter("tags");
    // // String storagepath = request.getParameter("path");
    // String id = request.getParameter("id");
    //
    //
    // try{
    //     DocumentBuilderFactory documentFactory = DocumentBuilderFactory.newInstance();
    //     DocumentBuilder documentBuilder = documentFactory.newDocumentBuilder();
    //     Document document = documentBuilder.newDocument();
    //     Element chapter = document.createElement("chapter");
    //     Element chaptername = document.createElement("name");
    //     Element chapterkeywords = document.createElement("keywords");
    //     Element chapterid = document.createElement("chapter_id");
    //     // Element chapterstoragepath = document.createElement("storage_path");
    //
    //     Text cname = document.createTextNode(name);
    //     Text ctag = document.createTextNode(tags);
    //     Text cid = document.createTextNode(id);
    //     // Text csp = document.createTextNode(storagepath);
    //
    //
    //     chaptername.appendChild(cname);
    //     chapterid.appendChild(cid);
    //     chapterkeywords.appendChild(ctag);
    //     // chapterstoragepath.appendChild(csp);
    //
    //     chapter.appendChild(chaptername);
    //     chapter.appendChild(chapterid);
    //     chapter.appendChild(chapterkeywords);
    //     // chapter.appendChild(chapterkeywords);
    //
    //     PrintWriter out = response.getWriter();
    //     HttpSession session = request.getSession();
    //     ExistSearchUtil ex = (ExistSearchUtil)session.getAttribute("ex");
    //     CustomEbookBuilder cb = (CustomEbookBuilder)session.getAttribute("cb");
    //
    //     cb.addChapter(chapter);
    //
    //     session.setAttribute("cb",cb);
    //     session.setAttribute("ex",ex);
    //
    //
    //
    // }catch (ParserConfigurationException pce) {
    //   System.out.println("DEBUG : Unable to create builder instance");
    //   pce.printStackTrace();
    // }


  }
}
