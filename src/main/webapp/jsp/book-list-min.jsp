<%@ page import="com.ebooks.CustomEbookBuilder, java.util.*, com.ebooks.ExistSearchUtil" %>


<%
  CustomEbookBuilder cb = (CustomEbookBuilder)session.getAttribute("cb");
%>
<div class="accordions">
  <%
  ArrayList<String> chapters = cb.getChapterNames();
  for(int i = 0; i < chapters.size(); i++) {%>
    <div class="accordion-item">
      <div class="accordion-title" data-tab="item1">
          <h2><%out.print(chapters.get(i));%>
            <%-- <button type="button" class="btn btn-danger remove"><i class="glyphicon glyphicon-remove-sign"></i></button> --%>
          </h2>
      </div>
      <div class="accordion-content" id="item1">

      </div>
    </div>
    <%}%>

</div>
