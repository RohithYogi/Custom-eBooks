<%@ page import="com.ebooks.ExistSearchUtil, java.util.*,java.util.Map ,java.util.List, org.w3c.dom.Document" %>


<%

    String recevied_keywords = (String) session.getAttribute("chapter_search_keywords");
    if ( recevied_keywords == null ) recevied_keywords = " ";

    ExistSearchUtil ex = (ExistSearchUtil) session.getAttribute("ex");

    List<String> keys = Arrays.asList(recevied_keywords.split(" "));
    List<Document> chapter_doms = ex.searchByChapter(keys);
    List<String> chapternameIndexs = ex.returnChapterNames(chapter_doms);

%>

<!--
<div class="container">
	<div class="row">
    <% for(int i = 0; i < chapternameIndexs.size(); i+=1) { %>
    <div class="col-md-4 bookblock" id = "<%= i %>" >
			<div class="project-grid" style="background-image:url(../images/bk-1.png);">
				<div class="desc">
					<h3><a href="#"><%=chapternameIndexs.get(i)%></a></h3>
        </div>
			</div>
		</div>
  <% } %>
	</div>
</div>
-->
    <div class="carousel-wrap">
        <div class="owl-carousel owl-theme">
            <% for(int i = 0; i < chapternameIndexs.size(); i+=1) { %>
            <div class="item bookblock" id = "<%= i %>">
                <div class="project-grid" style="background-image:url(../images/bk-2.png);">
                    <div class="desc" style="cursor: pointer;">
                        <h3><a><%=chapternameIndexs.get(i)%></a></h3>
                    </div>
                </div>
            </div>
            <%}%>
        </div>
    </div>
