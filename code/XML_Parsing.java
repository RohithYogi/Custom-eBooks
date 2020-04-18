import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.DocumentBuilder;
import org.w3c.dom.Document;
import org.w3c.dom.NodeList;
import org.w3c.dom.Node;
import org.w3c.dom.Element;
import java.io.File;

//code doubts : Nikhil sai

public class XML_Parsing
{
    public static void main(String argv[]){
        try{
              //creating a constructor of file class and parsing an XML file
              File file = new File("./../ebooks/example_ebook_1.xml");
              //an instance of factory that gives a document builder
              DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();
              //an instance of builder to parse the specified xml file
              DocumentBuilder db = dbf.newDocumentBuilder();
              Document doc = db.parse(file);
              doc.getDocumentElement().normalize();
              System.out.println("Root element: " + doc.getDocumentElement().getNodeName());

              NodeList nodeList = doc.getElementsByTagName("storage_path");
              // nodeList is not iterable, so we are using for loop
              for (int itr = 0; itr < nodeList.getLength(); itr++){
                    Node node = nodeList.item(itr);
                    System.out.println("\nNode Name :" + node.getNodeName());

                    if (node.getNodeType() == Node.ELEMENT_NODE){
                        Element eElement = (Element) node;
                        System.out.println("Address: "+ eElement.getTextContent());
                      }
              }
            }

        catch (Exception e){
              e.printStackTrace();}

    }
}