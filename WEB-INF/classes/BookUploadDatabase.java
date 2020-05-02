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
import java.io.File;
import java.io.InputStream;
import java.nio.file.Paths;



import java.io.StringReader;
import java.util.ArrayList;
import java.util.List;
import java.util.*;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import org.w3c.dom.Document;
import org.xml.sax.InputSource;
import java.nio.file.Files;
import java.io.*;


public class BookUploadDatabase extends HttpServlet {
  public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    doPost(request, response);
  }

  public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

      HttpSession session = request.getSession();
      ExistSearchUtil ex = (ExistSearchUtil)session.getAttribute("ex");
      CustomEbookBuilder cb = (CustomEbookBuilder)session.getAttribute("cb");

      String appPath = request.getServletContext().getRealPath("");
      String savePath = appPath + File.separator + "uploads";

      // creates the save directory if it does not exists
      File fileSaveDir = new File(savePath);
      if (!fileSaveDir.exists()) {
          fileSaveDir.mkdir();
      }

      File file = new File(savePath+File.separator+"example.xml");
      if(file.delete()){
            System.out.println("File deleted");
        }else System.out.println("File doesn't exist");

      try{
          cb.saveAsXML(savePath+File.separator+"example.xml");
          ex.StoreIntoCollection(savePath+File.separator+"example.xml");
          session.setAttribute("cb",cb);
          session.setAttribute("ex",ex);

    }catch(Exception e){
      e.printStackTrace();
    }


  }
}
