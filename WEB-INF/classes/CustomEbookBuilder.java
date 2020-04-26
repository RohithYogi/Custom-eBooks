// package com.ebooks;

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

/*
CustomEbookBuilder API
  - Constructor initializes an empty book
  - createEmptyBook : overwrite the current state. Create a fresh book.
  NOTE : Constructor internally calls createEmptyBook
  - createChapter : creates an empty chapter
  - addChapter(Element chapter) : appends chapter to the book
  - addSection(int chapter_id, Element section) : appends section to the
    chapter. chapter is choosen by chapter_id. Which is simply the index
    of the chapter.
  - saveAsXML(fileName) : writes into an xml document

  TODO - final additions : should be validated withe the same schema - done.
*/

public class CustomEbookBuilder {

  public DocumentBuilderFactory documentFactory;
  public DocumentBuilder documentBuilder;
  Document document;
  Element book;
  ArrayList<Element> chaptersList;

  public static void main(String[] args){

    CustomEbookBuilder cb = new CustomEbookBuilder("Database Systems");
    Element ch1 = cb.createChapter("Introduction");
    Element ch2 = cb.createChapter("Transaction management");
    cb.addChapter(ch1);
    cb.addChapter(ch2);
    cb.saveAsXML("test.xml");

  }
  public CustomEbookBuilder(String name){
    try{
      documentFactory = DocumentBuilderFactory.newInstance();
      documentBuilder = documentFactory.newDocumentBuilder();
      book = null;
      chaptersList = new ArrayList<Element>();
      createEmptyBook(name);
    } catch (ParserConfigurationException pce) {
      System.out.println("DEBUG : Unable to create builder instance");
      pce.printStackTrace();
    }

    //Testing code
    Element ch1 = createChapter("Introduction");
    Element ch2 = createChapter("Transaction management");
    addChapter(ch1);
    addChapter(ch2);
  }

  public void createEmptyBook(String bookName){
    document = documentBuilder.newDocument();
    book = document.createElement("book");
    document.appendChild(book);

    Attr attr1 = document.createAttribute("xmlns");
    attr1.setValue("https://www.custom-ebooks.com/database-schema");
    book.setAttributeNode(attr1);

    Attr attr2 = document.createAttribute("xmlns:xsi");
    attr2.setValue("http://www.w3.org/2001/XMLSchema-instance");
    book.setAttributeNode(attr2);

    Attr attr3 = document.createAttribute("xsi:schemaLocation");
    attr3.setValue("https://www.custom-ebooks.com/database-schema custom_ebooks_schema.xsd");
    book.setAttributeNode(attr3);

    Element name = document.createElement("name");
    Text text = document.createTextNode(bookName);
    name.appendChild(text);
    book.appendChild(name);

    Element chapters = document.createElement("chapters");
    book.appendChild(chapters);

  }

  public void addChapter(Element chapter){
    Node copiedNode = document.importNode(chapter, true);
    chaptersList.add((Element) copiedNode);
    Node chapters = book.getElementsByTagName("chapters").item(0);
    chapters.appendChild(copiedNode);
  }

  // Chapter id is just the index of the chapter (starts at 0)
  public void addSection(int chapter_id, Element section){
    Node copiedNode = document.importNode(section, true);
    Node sections = chaptersList.get(chapter_id).getElementsByTagName("sections").item(0);
    sections.appendChild(copiedNode);
  }

  public Element createChapter(String chapterName, String chapterID){

    Element chapter = document.createElement("chapter");
    Element name = document.createElement("name");
    Text text = document.createTextNode(chapterName);
    name.appendChild(text);
    chapter.appendChild(name);

    Element name2 = document.createElement("chapter_id");
    Text text2 = document.createTextNode(chapterID);
    name.appendChild(text2);
    chapter.appendChild(name2);

    Element sections = document.createElement("sections");
    chapter.appendChild(sections);

    return chapter;

  }

  public Element createChapter(String chapterName){
    return createChapter(chapterName, "");
  }

  public ArrayList<String> getChapterNames(){
    ArrayList<String> res = new ArrayList<String>();
    NodeList nl = book.getElementsByTagName("chapter");
    for(int i = 0; i < nl.getLength(); i++){
      res.add(nl.item(i).getFirstChild().getTextContent());
    }
    return res;
  }

  public ArrayList<String> getSectionNames(int chapter_id) {
    ArrayList<String> res = new ArrayList<String>();
    NodeList nl = chaptersList.get(chapter_id).getElementsByTagName("section");
    for(int i = 0; i < nl.getLength(); i++){
      res.add(nl.item(i).getFirstChild().getTextContent());
    }
    return res;
  }

  public void saveAsXML(String fileName){
    try {
      TransformerFactory transformerFactory = TransformerFactory.newInstance();
      Transformer transformer = transformerFactory.newTransformer();
      transformer.setOutputProperty(OutputKeys.INDENT, "yes");
      DOMSource domSource = new DOMSource(document);
      StreamResult streamResult = new StreamResult(new File(fileName));

      // Using
      // StreamResult result = new StreamResult(System.out);
      // the output will be pushed to the standard output
      // Useful for debugging.

      transformer.transform(domSource, streamResult);
      System.out.println("Saved as " + fileName);
    } catch (TransformerException tfe) {
      System.out.println("DEBUG : Unable to create transform instance");
      tfe.printStackTrace();
    }
  }
}
