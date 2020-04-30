root@rohith-Lenovo-ideapad-500-15ISK:/opt/tomcat/webapps/Custom-eBooks/WEB-INF/classes/run this/code# ls
itextpdf-5.5.0.jar  PDFMerger.java
root@rohith-Lenovo-ideapad-500-15ISK:/opt/tomcat/webapps/Custom-eBooks/WEB-INF/classes/run this/code# javac -cp './itextpdf-5.5.0.jar:.' PDFMerger.java 
root@rohith-Lenovo-ideapad-500-15ISK:/opt/tomcat/webapps/Custom-eBooks/WEB-INF/classes/run this/code# java -cp './itextpdf-5.5.0.jar:.' PDFMerger 
./../ebooks/example_ebook_1.xml
Root element: book

Node Name :storage_path
Address: ./../ebooks/at_your_age.pdf

Node Name :storage_path
Address: ./../ebooks/can_such_things_be.pdf
Pdf files merged successfully.
Generated Book Address: ./../ebooks/generated.pdf
root@rohith-Lenovo-ideapad-500-15ISK:/opt/tomcat/webapps/Custom-eBooks/WEB-INF/classes/run this/code# 
