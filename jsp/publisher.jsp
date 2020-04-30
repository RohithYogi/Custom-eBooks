<%@ page import="com.ebooks.CustomEbookBuilder, java.util.*, com.ebooks.XMLExist_1" %>


<%

%>

<link href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap-glyphicons.css" rel="stylesheet">
<div id="fh5co-core-feature">
  <div class="container">
    <div class="row">
      <div class="features">
        <div class="col-half-image-holder animate-box" data-animate-effect="fadeInRight">
          <img class="img-responsive" src="images/producer.jpg" alt="samsung">
        </div>
        <div class="col-half animate-box" data-animate-effect="fadeInLeft">
          <div class="table-c">
            <div class="desc">
              <div class="columns">
                <ul class="price">
                  <li class="header">Chapters
                  <a href="html/info.html">
                  <button id="btnAdd" type="button" class="btn btn-add" data-toggle="tooltip" data-original-title="Add more controls"><i class="glyphicon glyphicon-plus-sign"></i>&nbsp; Add&nbsp;</button></a></li>
                  <!-- <li>Chapter-1</li>
                  <li>Chapter-2</li>
                  <li>Chapter-3</li>
                  <li>Chapter-4</li>
                  <li>Chapter-5</li>
                  <li>Chapter-6</li>
                  <li>Chapter-7</li> -->
                  <div class="accordions">


                  <%
                  ArrayList<String> chapters = cb.getChapterNames();
                  for(int i = 0; i < chapters.size(); i++) {%>
                    <div class="accordion-item">
                      <div class="accordion-title" data-tab="item<%=i+1%>">
                          <h2><%out.print(chapters.get(i));%>
                            <button type="button" class="btn btn-danger remove"><i class="glyphicon glyphicon-remove-sign"></i></button>
                          </h2>

                      </div>
                      <div class="accordion-content" id="item<%=i+1%>">
                        <%
                          ArrayList sections = cb.getSectionNames(i);
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

                    <%-- <div class="accordion-item">
                      <div class="accordion-title" data-tab="item2">
                          <h2>Chapter-2 <i class="fas fa-chevron-down"></i></h2>
                      </div>
                      <div class="accordion-content" id="item2">

                      </div>
                    </div> --%>

                    <%-- <div class="accordion-item">
                      <div class="accordion-title" data-tab="item3">
                          <h2>Chapter-3 <i class="fas fa-chevron-down"></i></h2>
                      </div>
                      <div class="accordion-content" id="item3">

                      </div>
                    </div> --%>

                    <%-- <div class="accordion-item">
                      <div class="accordion-title" data-tab="item4">
                          <h2>Chapter-4 <i class="fas fa-chevron-down"></i></h2>
                      </div>
                      <div class="accordion-content" id="item4">

                      </div>
                    </div> --%>

                    <%-- <div class="accordion-item">
                      <div class="accordion-title" data-tab="item5">
                          <h2>Chapter-5 <i class="fas fa-chevron-down"></i></h2>
                      </div>
                      <div class="accordion-content" id="item5">

                      </div>
                    </div> --%>

                    <%-- <div class="accordion-item">
                      <div class="accordion-title" data-tab="item6">
                          <h2>Chapter-6 <i class="fas fa-chevron-down"></i></h2>
                      </div>
                      <div class="accordion-content" id="item6">

                      </div>
                    </div> --%>





                </div>

                  <li><a href="#" class="btn btn-lg btn-primary">Upload PDF</a></li>
                </ul>
              </div>
            </div>
          </div>
        </div>

      </div>
    </div>
  </div>
</div>
