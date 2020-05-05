package com.ebooks;

import java.util.*;
import java.io.OutputStream;
import java.io.InputStream;
import java.io.FileInputStream;
import java.io.FileOutputStream;

import com.itextpdf.text.Document;
import com.itextpdf.text.pdf.PdfContentByte;
import com.itextpdf.text.pdf.PdfImportedPage;
import com.itextpdf.text.pdf.PdfReader;
import com.itextpdf.text.pdf.PdfWriter;

import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.DocumentBuilder;
import org.w3c.dom.*;
import java.io.File;

/**
 * This class is used to merge two or more existing pdfs.
 To RUN :
    javac -cp './jars/*:.' PDFMerger.java
    java -cp './jars/*:.' PDFMerger
 */
public class PDFMerger {

    static void mergePdfFiles(List<InputStream> inputPdfList,OutputStream outputStream) throws Exception{
        //Create document and pdfReader objects.
        com.itextpdf.text.Document document = new com.itextpdf.text.Document();
        List<PdfReader> readers = new ArrayList<PdfReader>();
        int totalPages = 0;

        //Iterator object using inputPdfList.
        Iterator<InputStream> pdfIterator = inputPdfList.iterator();

        // reader list for the input
        while (pdfIterator.hasNext()) {
                InputStream pdf = pdfIterator.next();
                PdfReader pdfReader = new PdfReader(pdf);
                readers.add(pdfReader);
                totalPages = totalPages + pdfReader.getNumberOfPages();
        }

        //writer for the outputStream
        PdfWriter writer = PdfWriter.getInstance(document, outputStream);

        //Open doc.
        document.open();

        //pdf data.
        PdfContentByte pageContentByte = writer.getDirectContent();

        PdfImportedPage pdfImportedPage;
        int currentPdfReaderPage = 1;
        Iterator<PdfReader> iteratorPDFReader = readers.iterator();

        // Iterate and process the reader list.
        while (iteratorPDFReader.hasNext()) {
                PdfReader pdfReader = iteratorPDFReader.next();
                //Create page and add content.
                while (currentPdfReaderPage <= pdfReader.getNumberOfPages()) {
                      document.newPage();
                      pdfImportedPage = writer.getImportedPage(
                              pdfReader,currentPdfReaderPage);
                      pageContentByte.addTemplate(pdfImportedPage, 0, 0);
                      currentPdfReaderPage++;
                }
                currentPdfReaderPage = 1;
        }

        //Close document
        outputStream.flush();
        document.close();
        outputStream.close();

        System.out.println("Pdf files merged successfully.");
    }

    public static String merger(org.w3c.dom.Document doc, String path){
        try{
              doc.getDocumentElement().normalize();
              // System.out.println("Root element: " + doc.getDocumentElement().getNodeName());
              List<InputStream> inputPdfList = new ArrayList<InputStream>();
              NodeList nodeList = doc.getElementsByTagName("storage_path");
              // nodeList is not iterable, so we are using for loop
              for (int itr = 0; itr < nodeList.getLength(); itr++){
                    Node node = nodeList.item(itr);
                    // System.out.println("\nNode Name :" + node.getNodeName());

                    if (node.getNodeType() == Node.ELEMENT_NODE){
                        Element eElement = (Element) node;
                        // System.out.println("Address: "+ eElement.getTextContent());
                        inputPdfList.add(new FileInputStream(eElement.getTextContent()));
                      }
              }
                //merged pdf file.
                String output = "path + File.separator + ebooks/generated.pdf";
                OutputStream outputStream = new FileOutputStream(output);
                //to merge pdf files.
                mergePdfFiles(inputPdfList, outputStream);
                return output;
            }

        catch (Exception e){
              e.printStackTrace();
              return "";
          }
    }

    public static void main(String args[]){
        // try {
        //     //list of input stream.
        //     Scanner sc= new Scanner(System.in);
        //     String filePath = sc.nextLine();
        //     String path = merger(filePath);
        //     System.out.println("Generated Book Address: "+ path);
        //
        // } catch (Exception e) {
        //     e.printStackTrace();
        // }
    }
  }
