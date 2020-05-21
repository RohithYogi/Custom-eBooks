# Custom e-books 
## Group number: 11 

### Group members 

1. IMT2016072 - Nomula Rohith Yogi 
2. IMT2016091 - Bukka Nikhil Sai 
3. IMT2016110 - Soumith Kumar Dachepalli 
4. IMT2016108 - Arunaav Reddy


### Problem Definition  

This project sets out to solve the problem of generating e-books based on preferences associated with the user. More and more people are preferring ebooks to a hard copy. But the trend has been towards treating them like normal books in terms of their contents (fixed content). 

The idea is that unlike with hard copies, we can have a lot of flexibility with ebooks. One such ability is to customize them the way we want. This is similar to taking selected pages from different hard cover books and binding them together. To be more precise, we can have the ability to create ebooks which are composable with smaller components, and the ability to select and assemble parts of many books to create them. Also, the process should be simple on the 
user side. 


### Solution  

The proposed solution includes two interfaces for publishers and customers. The publisher interface will allow them to upload books. The customer view allows the customer to define a structure to the book, search for various topics and create a custom book.  The books will be stored in a native XML database. Representing data using XML conforms to the way books are structured using hierarchies as chapters and sections. Hence, using XML as a primary storage mechanism makes it easier to work with and to avoid mapping. The solution provides three levels of customization to the users in terms of the book, chapter, and section. 

Customized e-books are generated from the content provided by the publisher. The customer can search for the topic and add the content which he requires to the cart. At the time of checkout, we assemble all the different topics that are selected and arrange them in a user-defined order and let the customer define the structure.  
 
  

### Primary Deliverables: 
- Module that maps the pdf based content to XML format and stores them in the database. 
- XML database schema that can accomodate three levels of book content mentioned above and a native XML database compiled with this schema. 
- XQuery scripts which help in navigating through the content in an efficient way. 
- Module that generates pdfs based on components and structure selected by the user. Secondary Deliverables 
- A minimalistic website where a publisher uploads the content (books or chapters). And also provide information about the level of the hierarchy.  
-This website alse lets users search through the different types of content (books or chapters) and select the content of the e-book.  
- A decent way to stitch the content according to user preferences allowing them to design  
- the structure of the e-book using structure alignment options. Finally generating a combined pdf file of the customized e-book.

### Using DevOps Tools: 
- Jenkins - Continuous Integration
- Maven - Build
- Docker - DockerHub
- Rundeck - Continuous Delivery
- Selenium - Continuous Testing
- ELK Stack - Continuous Monitoring

### Benefits  

- Firstly, the idea of custom assembled books changes the notion of how we look at books. This gives users a lot of flexibility in terms of being able to choose what should be in the custom book they are creating. 
- Sticking to a three level hierarchy of book, chapter and section will let us provide a uniform interface since most books will have at least this level of structure. 
- This will allow publishers to easily add more content. On the customer side, allowing the customer to define the structure of the custom book using the three levels mentioned above will help them better understand the process and makes more sense from a content point of view. 
- This will make it easier for users to search for different components (sections, chapters) to put the custom book together. Since we are avoiding mapping by using XML throughout the application, we are able to preserve the semantics of book hierarchy.  
