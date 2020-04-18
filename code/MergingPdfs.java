import org.apache.pdfbox.multipdf.PDFMergerUtility; 
import org.apache.pdfbox.pdmodel.PDDocument;  

import java.io.File; 
import java.io.IOException;  

public class MergingPdfs { 
   public static void main(String[] args) throws IOException { 
       
      File file1 = new File("./../ebooks/at_your_age.pdf"); 
      PDDocument doc1 = PDDocument.load(file1); 

      File file2 = new File("./../ebooks/can_such_things_be.pdf"); 
      PDDocument doc2 = PDDocument.load(file2); 

      PDFMergerUtility PDFmerger = new PDFMergerUtility();       

      PDFmerger.setDestinationFileName("./../ebooks/merged_pdf.pdf"); 

      PDFmerger.addSource(file1); 
      PDFmerger.addSource(file2); 

      PDFmerger.mergeDocuments(); 
      System.out.println("Documents merged"); 
      
      doc1.close(); 
      doc2.close();           
   } 
}