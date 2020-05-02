<%@ page import="com.ebooks.ExistSearchUtil, java.util.*,java.util.Map ,java.util.List, org.w3c.dom.Document" %>


<%

    String recevied_keywords = (String) session.getAttribute("chapter_search_keywords");
    if ( recevied_keywords == null ) recevied_keywords = " ";

    ExistSearchUtil ex = (ExistSearchUtil) session.getAttribute("ex");

    List<String> keys = Arrays.asList(recevied_keywords.split(" "));
    List<Document> chapter_doms = ex.searchByChapter(keys);
    List<String> chapternameIndexs = ex.returnChapterNames(chapter_doms);

%>


<div class="container">
	<div class="row">
    <% for(int i = 0; i < chapternameIndexs.size(); i+=1) { %>
    <div class="col-md-4 animate-box bookblock" id = "<%= i %>" >
    <%-- <div class="col-md-4 animate-box"> --%>
			<div class="project-grid" style="background-image:url(../images/bk-1.png);">
				<div class="desc">
					<%-- <span>Application</span> --%>
					<h3><a href="#"><%=chapternameIndexs.get(i)%></a></h3>
        </div>
			</div>
		</div>
  <% } %>
	</div>
</div>
