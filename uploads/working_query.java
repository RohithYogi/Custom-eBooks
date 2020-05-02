
// import org.exist.xmldb.XQueryService;
import org.xmldb.api.DatabaseManager;
import org.xmldb.api.base.Collection;
import org.xmldb.api.base.CompiledExpression;
import org.xmldb.api.base.Database;
import org.xmldb.api.base.Resource;
import org.xmldb.api.base.ResourceIterator;
import org.xmldb.api.base.ResourceSet;
import org.xmldb.api.modules.XMLResource;

import org.xmldb.api.base.*;
import org.xmldb.api.modules.*;
import org.xmldb.api.*;
import org.exist.xmldb.EXistResource;

public class Testing {
       protected static String DRIVER = "org.exist.xmldb.DatabaseImpl";
       protected static String URI = "xmldb:exist://localhost:8081/exist/xmlrpc";
       protected static String collectionPath = "/db/Testing/";
       protected static String resourceName = "movies.xml";

       public static void main(String[] args) throws Exception {

               // initialize database driver
               Class cl = Class.forName(DRIVER);
               Database database = (Database) cl.newInstance();
               DatabaseManager.registerDatabase(database);

               // get the collection
               Collection col = DatabaseManager.getCollection(URI + collectionPath);

               // query a document

       String a = "declare default element namespace \"https://www.custom-ebooks.com/database-schema\";";
       String xQuery = "let $a := collection(\"xmldb:exist:///db/Testing\") for $name in $a/book/keywords where contains($name,\'data base\') return $a\n " ;
//                String xQuery = "for $x in doc(’" + resourceName + "’)//title "
//                                + "return data($x)";
               System.out.println("Execute xQuery = " + a +xQuery);

               // Instantiate a XQuery service
         XPathQueryService xpqs = (XPathQueryService)col.getService("XPathQueryService", "1.0");
             xpqs.setProperty("indent", "yes");

               // Execute the query, print the result
               ResourceSet result = xpqs.query(xQuery);
               ResourceIterator i = result.getIterator();
               while (i.hasMoreResources()) {
                       Resource r = i.nextResource();
                       System.out.println((String) r.getContent());
               }
       }
       }
