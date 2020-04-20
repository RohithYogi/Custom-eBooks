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

/**
 * This class is used to merge two or more existing pdfs.
 To RUN : 
    javac -cp './jars/*:.' PDFMerger.java
    java -cp './jars/*:.' PDFMerger
 */
public class PDFMerger {

    static void mergePdfFiles(List<InputStream> inputPdfList,OutputStream outputStream) throws Exception{
        //Create document and pdfReader objects.
        Document document = new Document();
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

    public static void main(String args[]){
        try {
            //list of input stream.
            List<InputStream> inputPdfList = new ArrayList<InputStream>();
            inputPdfList.add(new FileInputStream("./../ebooks/at_your_age.pdf"));
            inputPdfList.add(new FileInputStream("./../ebooks/can_such_things_be.pdf"));


            //merged pdf file.
            OutputStream outputStream = new FileOutputStream("./../ebooks/at_your_age_can_such_things_be.pdf");

            //to merge pdf files.
            mergePdfFiles(inputPdfList, outputStream);     
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}

