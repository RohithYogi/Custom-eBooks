package com.ebooks;

// import Final_Scripts.CustomEbookBuilder;
import org.xmldb.api.base.*;
import org.xmldb.api.modules.*;
import org.xmldb.api.*;
import org.exist.xmldb.*;
import org.exist.xmldb.DatabaseImpl;
import org.exist.xmldb.EXistResource;


import org.xmldb.api.DatabaseManager;
import org.xmldb.api.base.Collection;
import org.xmldb.api.base.CompiledExpression;
import org.xmldb.api.base.Database;
import org.xmldb.api.base.Resource;
import org.xmldb.api.base.ResourceIterator;
import org.xmldb.api.base.ResourceSet;
import org.xmldb.api.modules.XMLResource;

import java.io.File;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerException;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.dom.DOMSource;
import javax.xml.transform.stream.StreamResult;
import javax.xml.transform.OutputKeys;
// import org.w3c.dom.Attr;
// import org.w3c.dom.Document;
// import org.w3c.dom.Element;
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


public class XMLExist_1 {

       // DatabaseImpl asma = new DatabaseImpl();

       protected static String URI = "xmldb:exist://localhost:8081/exist/xmlrpc";
       protected static String collectionPath = "/db/testing";
       protected static String DRIVER = "org.exist.xmldb.DatabaseImpl";
       protected static List<Document> storing = new ArrayList<Document>();

       public XMLExist_1(){}

	      private static Document convertStringToXMLDocument(String xmlString){
           //Parser that produces DOM object trees from XML content
           DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();

           //API to obtain DOM Document instance
           DocumentBuilder builder = null;
           try{
               //Create DocumentBuilder with default configuration
               builder = factory.newDocumentBuilder();

               //Parse the content to Document object
               Document doc = builder.parse(new InputSource(new StringReader(xmlString)));
               return doc;
           }
           catch (Exception e){
               e.printStackTrace();
           }
           return null;
       }

       public static List<Document> searchByBook(List<String> Keywords) throws Exception{

           // initialize database driver
           // Class cl = Class.forName(DRIVER);
           Database database = (Database) new DatabaseImpl();
           DatabaseManager.registerDatabase(database);

           // get the collection
           Collection col = DatabaseManager.getCollection(URI + collectionPath);

           // query for chapters
            String namspac = "declare default element namespace \"https://www.custom-ebooks.com/database-schema\";";

      			List<Document> books_doms= new ArrayList<Document>();
      			List<String> books_xmls= new ArrayList<String>();

    			  for (int i=0;i<Keywords.size();i++){
    	        String xQuery = "let $books := collection(\"xmldb:exist:///db/testing\") for $book in $books for $name in $book/book/keywords where contains($name,\'"+Keywords.get(i)+"\') return $book";
                // System.out.println(namspac+xQuery);

    	           XPathQueryService xpqs = (XPathQueryService)col.getService("XPathQueryService", "1.0");
                   xpqs.setProperty("indent", "yes");

                   ResourceSet result = xpqs.query(namspac+xQuery);
                   ResourceIterator resitr = result.getIterator();

                   while (resitr.hasMoreResources()) {
                        Resource r = resitr.nextResource();
           				     books_xmls.add((String) r.getContent());
                  }
           }

    			Set<String> set = new HashSet<String>(books_xmls);
    			books_xmls.clear();
    			books_xmls.addAll(set);

  			  for(int k=0;k<books_xmls.size();k++)
  							books_doms.add(convertStringToXMLDocument(books_xmls.get(k)));

          return books_doms;
      }



      public static List<Document> searchByChapter(List<String> Keywords) throws Exception{

          // initialize database driver
          // Class cl = Class.forName(DRIVER);
          Database database = (Database) new DatabaseImpl();
          DatabaseManager.registerDatabase(database);

          // get the collection
          Collection col = DatabaseManager.getCollection(URI + collectionPath);

          // query for chapters
           String namspac = "declare default element namespace \"https://www.custom-ebooks.com/database-schema\";";

         List<Document> chapters_doms= new ArrayList<Document>();
         List<String> chapters_xmls= new ArrayList<String>();

         for (int i=0;i<Keywords.size();i++){

               String xQuery_1 = "let $books := collection(\"xmldb:exist:///db/testing\") for $book in $books for $name in $book/book/chapters/chapter for$cha in  $name/keywords where contains($name,\'"+Keywords.get(i)+"\') return $name";
               // System.out.println(namspac+xQuery);
               String xQuery_2 = "let $books := collection(\"xmldb:exist:///db/testing\") for $book in $books for $name in $book/book/keywords where contains($name,\'"+Keywords.get(i)+"\') return $book//chapter";

               // let $books := collection("xmldb:exist:///db/testing") for $book in $books for $name in $book/book/keywords where contains($name,'db') return $book//chapter

                XPathQueryService xpqs = (XPathQueryService)col.getService("XPathQueryService", "1.0");
                  xpqs.setProperty("indent", "yes");

                  ResourceSet result = xpqs.query(namspac+xQuery_1);
                  ResourceIterator resitr = result.getIterator();

                  while (resitr.hasMoreResources()) {
                       Resource r = resitr.nextResource();
                       chapters_xmls.add((String) r.getContent());
                       // System.out.println((String) r.getContent());
                 }

                 result = xpqs.query(namspac+xQuery_2);
                 resitr = result.getIterator();

                 while (resitr.hasMoreResources()) {
                     Resource r = resitr.nextResource();
                     chapters_xmls.add((String) r.getContent());
                     // System.out.println((String) r.getContent());

                }
         }



       Set<String> set = new HashSet<String>(chapters_xmls);
       chapters_xmls.clear();
       chapters_xmls.addAll(set);

       for(int k=0;k<chapters_xmls.size();k++)
               chapters_doms.add(convertStringToXMLDocument(chapters_xmls.get(k)));



       return chapters_doms;
     }



     public static List<Document> searchBySection(List<String> Keywords) throws Exception{

               // initialize database driver
               // Class cl = Class.forName(DRIVER;

               Database database = (Database) new DatabaseImpl();
               DatabaseManager.registerDatabase(database);

               // get the collection
               Collection col = DatabaseManager.getCollection(URI + collectionPath);

               // query for chapters
                String namspac = "declare default element namespace \"https://www.custom-ebooks.com/database-schema\";";

              List<Document> sections_doms= new ArrayList<Document>();
              List<String> sections_xmls= new ArrayList<String>();

              for (int i=0;i<Keywords.size();i++){

                  String xQuery_1 = "let $books := collection(\"xmldb:exist:///db/testing\") for $book in $books for $sec in $book/book/chapters/chapter/sections/section for $key in  $sec/keywords where contains($key,\'"+Keywords.get(i)+"\') return $sec";


                  String xQuery_2 = "let $books := collection(\"xmldb:exist:///db/testing\") for $book in $books for $name in $book/book/chapters/chapter for$cha in  $name/keywords where contains($name,\'"+Keywords.get(i)+"\') return $name/sections/section";
                    // System.out.println(namspac+xQuery);
                    String xQuery_3 = "let $books := collection(\"xmldb:exist:///db/testing\") for $book in $books for $name in $book/book/keywords where contains($name,\'"+Keywords.get(i)+"\') return $book//section";


                     XPathQueryService xpqs = (XPathQueryService)col.getService("XPathQueryService", "1.0");
                       xpqs.setProperty("indent", "yes");

                       ResourceSet result = xpqs.query(namspac+xQuery_1);
                       ResourceIterator resitr = result.getIterator();

                       while (resitr.hasMoreResources()) {
                            Resource r = resitr.nextResource();
                           sections_xmls.add((String) r.getContent());
                      }

                      result = xpqs.query(namspac+xQuery_2);
                      resitr = result.getIterator();

                      while (resitr.hasMoreResources()) {
                          Resource r = resitr.nextResource();
                          sections_xmls.add((String) r.getContent());
                     }
                    result = xpqs.query(namspac+xQuery_3);
                    resitr = result.getIterator();

                     while (resitr.hasMoreResources()) {
                          Resource r = resitr.nextResource();
                         sections_xmls.add((String) r.getContent());
                    }

              }


            Set<String> set = new HashSet<String>(sections_xmls);
            sections_xmls.clear();
            sections_xmls.addAll(set);

            for(int k=0;k<sections_xmls.size();k++)
                    sections_doms.add(convertStringToXMLDocument(sections_xmls.get(k)));


            return sections_doms;
          }

    public static Map<Integer,String> returnChapterNames(List<Document>chapter_doms){

          storing.clear();
          storing.addAll(chapter_doms);

          Map<Integer,String> nameIndexs = new HashMap<Integer,String>();

          for(int i = 0; i < chapter_doms.size(); i+=1) {
            nameIndexs.put(i,chapter_doms.get(i).getElementsByTagName("name").item(0).getTextContent());
          }

          return nameIndexs;
        }

    public static Element ChapterAtIndex(int id){
      Element new_cha_dom = storing.get(id).getDocumentElement();
      return new_cha_dom;

    }



    public static void main(String[] args) throws Exception {

      System.out.println("Hai");

      CustomEbookBuilder cb = new CustomEbookBuilder("Database Systems");



      List<String> keys = new ArrayList<String>();

      keys.add("base");
      // keys.add("dbch1");
      // keys.add("data");

      List<Document> final_results = searchByChapter(keys);


      // keys.clear();
      // keys.add("dbch2sec1");
      // List<Document> final_results_1 = searchBySection(keys);
      //

      Element ch1 = (Element) final_results.get(0).getDocumentElement();
      Element ch2 = (Element) final_results.get(1).getDocumentElement();
      // Element sec1 = (Element) final_results_1.get(0).getDocumentElement();

      cb.addChapter(ch1);
      // cb.addSection(0,sec1);
      cb.saveAsXML("test.xml");

  }
}
