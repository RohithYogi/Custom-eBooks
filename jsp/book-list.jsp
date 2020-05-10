<%@ page import="com.ebooks.CustomEbookBuilder, java.util.*, com.ebooks.ExistSearchUtil" %>


<%
CustomEbookBuilder cb1 = (CustomEbookBuilder)session.getAttribute("cb");
%>
<%
ArrayList<String> chapters = cb1.getChapterNames();
for(int i = 0; i < chapters.size(); i++) {%>
  <div class="accordion-item">
    <div class="accordion-title chapter-block" data-tab="item<%=i+1%>">
      <h2><%out.print(chapters.get(i));%>
        <button id="<%=i%>" type="button" class="btn btn-danger remove removeChapter"><i class="glyphicon glyphicon-remove-sign"></i></button>
      </h2>

    </div>
    <div class="accordion-content" id="item<%=i+1%>">
      <%
        ArrayList sections = cb1.getSectionNames(i);
        for(int j = 0; j < sections.size(); j++) {
      %>
        <div class="accordions">
        <div class="accordion-item">
          <div class="accordion-title" data-tab="item<%=i+1%><%=j+1%>">
              <h2><%out.print(sections.get(j));%></h2>
          </div>
          <div class="accordion-content" id="item<%=i+1%><%=j+1%>">

          </div>
        </div>

      </div>
      <%}%>
    </div>
  </div>
<%}%>
