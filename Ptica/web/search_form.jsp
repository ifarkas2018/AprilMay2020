<%-- 
    Document   : search_form.jsp
    Created on : 18-Sep-2018, 01:33:11
    Author     : Ingrid Farkas
    Project    : Ptica
--%>

<!-- search_form.jsp - the form on the page Search Book -->

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="miscellaneous.PticaMetodi"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Ptica - Pretraga knjiga</title>
        
        <script src="javascript/validationJS.js"></script>
        
        <script>
            NUM_FIELDS = 7; // number of the input fields on the form
            INPUT_FIELDS = 12;  
        
            // setCookie: creates cookie inputI = value in the input field ; (I - number 0..2)
            function setCookie() {           
                var i;
                var inp_names = new Array('title', 'author', 'isbn', 'price_range', 'sortby', 'categ', 'publ_year'); // names of the input fields
                
                for (i = 0; i < NUM_FIELDS; i++) {
                    document.cookie = "input" + i + "=" + document.getElementById(inp_names[i]).value + ";"; // creating a cookie
                } 
            }
            
            // setDefaults : sets the values of the cookies (input0, input1, input12) to the default and
            // writes the content of every input field to the cookie
            function setDefaults() {   
                var i;
                for (i = 0; i < INPUT_FIELDS; i++) {
                    document.cookie = "input" + i + "= "; // setting the VALUE of the cookie to EMPTY
                }
                setCookie(); // go through every input field and write its content to the cookie
            } 
            
            // on the load show the modal (id: centeredModal)
            $(window).on('load',function(){
                $('#centeredModal').modal('show');
            });
        </script>    
    </head>
    
    <body onload="setDefaults()">
        
        <%
            final String PAGE_NAME = "search_page.jsp"; // page which is loaded now
            HttpSession hSession = PticaMetodi.returnSession(request);
            hSession.setAttribute("webpg_name", "search_page.jsp");
            // reseting the sess. var to the default: if the user just did do the subscribe, the form on the NEXT web page DOESN'T NEED 
            // to show the previous values 
            hSession.setAttribute("subscribe", "false");
        %>
        
        <!-- adding a new row to the Bootstrap grid; class whitebckgr is for setting the background to white -->
        <div class="whitebckgr">
            <div class="row"> <!-- adding a new row to the Bootstrap grid -->
                <!-- the Bootstrap column takes 6 columns on the large desktops and 6 columns on the medium sized desktops -->
                <div class="col-lg-6 col-md-6"> 
                    <br /><br />
                    <div> <!-- horizontally centering the picture using center-image, img-fluid is for responsive image -->
                        <img src="images/books.png" class="img-fluid center-image" alt="slika sa knjigama" title="slika sa knjigama"> 
                    </div>
                    <br /><br />
                    <div> <!-- horizontally centering the picture using center-image, img-fluid is for responsive image -->
                        <img src="images/books.png" class="img-fluid center-image" alt="slika sa knjigam" title="slika sa knjigama"> 
                    </div>
                </div>
                       
                <!-- the Bootstrap column takes 5 columns on the large desktops and 5 columns on the medium sized desktops -->
                <div class="col-lg-5 col-md-5"> 
                    <div class="container">
                        <div class="row"> <!-- adding a new row to the Bootstrap grid -->
                            <div class="col"> <!-- adding a new column to the Bootstrap grid -->
                                &nbsp; &nbsp;
                                <br/>
                                <h3 class="text-info">Pretraga knjiga</h3>
                                <br/> 
                                Džoker znakovi  
                                <!-- adding an unordered list with two list items -->
                                <ul>
                                    <li>_ - zamenjuje jedan znak</li>
                                    <li>% - zamenjuje nijedan, jedan ili više znakova
                                </ul>
                                
                                <%  
                                    HttpSession hSession2 = PticaMetodi.returnSession(request);
                                    String input0 = ""; // read the value which was before in the 1st input field and show it again
                                    String input1 = ""; // read the value  in the 2nd input field and show it again
                                    String input2 = ""; // read the value which was before in the 3rd input field and show it again        
                                    String input3 = ""; // read the value which was before in the 1st drop down list and show it again        
                                    String input4 = ""; // read the value which was before in the 2nd drop down list and show it again        
                                    String input5 = ""; // read the value which was before in the 3rd drop down list and show it again        
                                    String input6 = ""; // read the value which was before in the 4th input field and show it again        
                                    
                                    // IDEA : fill_in variable is set in SubscrServl.java - true if some of the input session variables were set,
                                    // and they need to be added to the form here - this is true if the user BEFORE LOADED THIS PAGE and after that he entered
                                    // the email to subscribe (in the footer) and on the next page he clicked on Close
                                    if (PticaMetodi.sessVarExists(hSession2, "fill_in")) { 
                                        String fill_in = String.valueOf(hSession2.getAttribute("fill_in")); 
                                        // session variable page_name is set below. It is used if the user clicks on the Subscribe button and after that on
                                        // the page subscrres_content if the user clicks on the Close button. then this page will be shown again
                                        if (PticaMetodi.sessVarExists(hSession2, "page_name")) { 
                                            String page_name = String.valueOf(hSession2.getAttribute("page_name"));
                                            // if the user clicked on the Close button on the page subscrres_content and this page was shown before (page_name)
                                            // and if something is stored in session variables input 
                                            // then retrieve the session variable input0 (to show it in the 1st input field) 
                                            if ((page_name.equalsIgnoreCase(PAGE_NAME)) && (fill_in.equalsIgnoreCase("true"))) {
                                                if (PticaMetodi.sessVarExists(hSession2, "input0")) {
                                                    input0 = String.valueOf(hSession2.getAttribute("input0")); // the value that was in the 1st input field
                                                } 
                                                if (PticaMetodi.sessVarExists(hSession2, "input1")) {
                                                    input1 = String.valueOf(hSession2.getAttribute("input1")); // the value that was in the 2nd input field
                                                } 
                                                if (PticaMetodi.sessVarExists(hSession2, "input2")) {
                                                    input2 = String.valueOf(hSession2.getAttribute("input2")); // the value that was in the 3rd input field
                                                } 
                                                if (PticaMetodi.sessVarExists(hSession2, "input3")) {
                                                    input3 = String.valueOf(hSession2.getAttribute("input3")); // the value that was in the 1st drop down list
                                                } 
                                                if (PticaMetodi.sessVarExists(hSession2, "input4")) {
                                                    input4 = String.valueOf(hSession2.getAttribute("input4")); // the value that was in the 2nd drop down list
                                                } 
                                                if (PticaMetodi.sessVarExists(hSession2, "input5")) {
                                                    input5 = String.valueOf(hSession2.getAttribute("input5")); // the value that was in the 3rd drop down list
                                                } 
                                                if (PticaMetodi.sessVarExists(hSession2, "input6")) {
                                                    input6 = String.valueOf(hSession2.getAttribute("input6")); // the value that was in the 3rd drop down list
                                                } 
                                            } 
                                        }
                                        hSession2.setAttribute("fill_in", "false"); // the input fields don't need to be filled in
                                    } 
                                    
                                    // store on which page I am now in case the user clicks on subscribe button in the footer
                                    hSession2.setAttribute("page_name", PAGE_NAME);
                                    PticaMetodi.setToEmptyInput(hSession2 ); // setToEmpty: set the session variable values to "" for the variables named input0, input1, ...
                                %>
                                
                                <!-- after clicking on the button searchDB.jsp is shown -->
                                <form action="searchDB.jsp" name="search_book" id="search_book" method="post" onsubmit="return checkForm();">
                                    <div class="form-group"> 
                                        <label for="title">Naslov <span class="text_size text-danger">*</span></label> <!-- title label -->
                                        <!-- filling in the title is required  -->
                                        <input type="text" class="form-control form-control-sm" name="title" id="title" maxlength="60" onchange="setCookie()" onfocusout='setFocus("search_book", "title")' required value="<%= input0 %>"> 
                                    </div>
                                    
                                    <div class="form-group"> 
                                        <label for="author">Autor</label> <!-- author's name label -->
                                        <input type="text" class="form-control form-control-sm" name="author" id="author" maxlength="70" onchange="setCookie()" onfocusout="valLetters(document.search_book.author, author_message, 'fullname', true, 'false');" value="<%= input1 %>"> <!-- the input element for author -->
                                        <span id="author_message" class="text_size text-danger"></span>
                                    </div>
                
                                    <div class="form-group">
                                        <label for="isbn">Isbn</label> <!-- ISBN label -->
                                        <input type="text" class="form-control form-control-sm" name="isbn" id="isbn" maxlength="13" onchange="setCookie();" onfocusout='isNumber("search_book", "isbn", "is_isbn", "isbn_message", true, false)' value="<%= input2 %>"> <!-- the input element for ISBN -->
                                        <span id="isbn_message" class="text_size text-danger"></span>
                                    </div>
                
                                    <div class="form-group">
                                        <label for="price_range">Cena</label> <!-- price range label -->
                                        <!-- creating a drop down list; form-control-sm is used for smaller control -->
                                        <select class="form-control form-control-sm" name="price_range" id="price_range" onchange="setCookie()"> 
                                            <% if (input3.equalsIgnoreCase("all")){ %>
                                                <option value="all" selected>Sve cene</option> <!-- options shown in the drop down list -->
                                            <% } else { %>
                                                <option value="all">Sve cene</option>
                                            <% } %>
                                            
                                            <% if (input3.equalsIgnoreCase("less500")){ %>
                                                <option value="less500" selected>Cena manja od 500 RSD</option> <!-- options shown in the drop down list -->
                                            <% } else { %>
                                                <option value="less500">Cena manja od 500 RSD</option>
                                            <% } %>
                                            
                                            <% if (input3.equalsIgnoreCase("betw500-1000")){ %>
                                                <option value="betw500-1000" selected>Od 500 do 1000 RSD</option> <!-- options shown in the drop down list -->
                                            <% } else { %>
                                                <option value="betw500-1000">Od 500 do 1000 RSD</option>
                                            <% } %>
                                            
                                            <% if (input3.equalsIgnoreCase("betw1001-2000")){ %>
                                                <option value="betw1001-2000" selected>Od 1001 do 2000 RSD</option> <!-- options shown in the drop down list -->
                                            <% } else { %>
                                                <option value="betw1001-2000">Od 1001 do 2000 RSD</option>
                                            <% } %>
                                            
                                            <% if (input3.equalsIgnoreCase("betw2001-5000")){ %>
                                                <option value="betw2001-5000" selected>Od 2001 do 5000 RSD</option> <!-- options shown in the drop down list -->
                                            <% } else { %>
                                                <option value="betw2001-5000">Od 2001 do 5000 RSDD</option>
                                            <% } %>
                                            
                                            <% if (input3.equalsIgnoreCase("above5000")){ %>
                                                <option value="above5000" selected>Cena veća od 5000 RSD</option> <!-- options shown in the drop down list -->
                                            <% } else { %>
                                                <option value="above5000">Cena veća od 5000 RSD</option>
                                            <% } %>
                                        </select>
                                    </div>
                                    
                                    <div class="form-group">
                                        <label for="sortby">Sortiraj</label>
                                        <!-- creating a drop down list; form-control-sm is used for smaller control -->
                                        <select class="form-control form-control-sm" name="sortby" id="sortby" onchange="setCookie()"> 
                                            <% if (input4.equalsIgnoreCase("low")){ %>
                                                 <option value="low" selected>Po ceni - rastuća</option> <!-- options shown in the drop down list -->
                                            <% } else { %>
                                                 <option value="low">Po ceni - rastuća</option>
                                            <% } %>
                                            
                                            <% if (input4.equalsIgnoreCase("high")){ %>
                                                 <option value="high" selected>Po ceni - opadajuća</option> <!-- options shown in the drop down list -->
                                            <% } else { %>
                                                 <option value="high">Po ceni - opadajuća</option>
                                            <% } %>
                                        </select>
                                    </div>
                
                                    <div class="form-group"> 
                                        <label for="categ">Žanrovi</label> <!-- category label -->
                                        <!-- creating a drop down list; form-control-sm is used for narrower control -->
                                        <select class="form-control form-control-sm" name="categ" id="categ" onchange="setCookie()">
                                            <% if (input5.equalsIgnoreCase("all")){ %>
                                                 <option value="all" selected>Svi žanrovi</option> <!-- options shown in the drop down list -->
                                            <% } else { %>
                                                 <option value="all">Svi žanrovi</option>
                                            <% } %>
                                            
                                            <% if (input5.equalsIgnoreCase("fict")){ %>
                                                 <option value="fict" selected>Romani</option> 
                                            <% } else { %>
                                                 <option value="fict">Romani</option>   
                                            <% } %>
                                            
                                            <% if (input5.equalsIgnoreCase("bus")){ %>
                                                 <option value="bus" selected>Biznis i ekonomija</option> 
                                            <% } else { %>
                                                 <option value="bus">Biznis i ekonomija</option>      
                                            <% } %>
                                            
                                            <% if (input5.equalsIgnoreCase("comp")){ %>
                                                 <option value="comp" selected>Internet i računari</option> 
                                            <% } else { %>
                                                 <option value="comp">Internet i računari</option>  
                                            <% } %>
                                            
                                            <% if (input5.equalsIgnoreCase("edu")){ %>
                                                 <option value="edu" selected>Edukativni</option> 
                                            <% } else { %>
                                                 <option value="edu">Edukativni</option>   
                                            <% } %>
                                            
                                            <% if (input5.equalsIgnoreCase("child")){ %>
                                                 <option value="child" selected>Knjige za decu</option> 
                                            <% } else { %>
                                                 <option value="child">Knjige za decu</option>  
                                            <% } %>
                                        </select>
                                    </div>
                                        
                                    <div class="form-group">
                                        <label for="publ_year">Godina izdanja</label> <!-- publication year label -->
                                        <input type="text" class="form-control form-control-sm" id="publ_year" name="publ_year" maxlength="4" onchange="setCookie()" onfocusout='isNumber("search_book", "publ_year", "is_yrpubl", "year_message", true, false)' value="<%= input6 %>"> <!-- the input element for the publication year -->
                                        <span id="year_message" class="text_size text-danger"></span>
                                    </div>

                                    <div class="container">
                                        <div class="row">
                                            <div class="col">
                                                &nbsp; &nbsp; <!-- adding some empty space -->
                                            </div>
                                        </div>    
                                    </div>

                                    <!-- adding the Search button to the form; btn-sm is used for smaller (narrower) size of the control -->
                                    <button type="submit" class="btn btn-info btn-sm">Traži</button>

                                    <!-- adding a new container -->
                                    <div class="container">
                                        <div class="row">
                                            <div class="col">
                                                &nbsp; &nbsp; <!-- adding some empty space -->
                                            </div>
                                        </div>    
                                    </div> 
                                </form>  
                            </div> <!-- end of class="col" -->
                        </div> <!-- end of class="row" --> 
                    </div> <!-- end of class="container" -->
                </div> <!-- end of class="col-lg-5 col-md-5" -->
            </div> <!-- end of class="row" -->
        </div> <!-- end of class="whitebckgr" -->
            
        <!-- adding a new row; class whitebckgr is for setting the background to white -->
        <div class="whitebckgr">
            <div class="col">
                &nbsp; &nbsp;
            </div>
        </div> 
        
        <%
            // if the emp_adm session attribute exists retrieve it
            if (PticaMetodi.sessVarExists( hSession2, "emp_adm")) {
                String empadmS = (String)(hSession2.getAttribute("emp_adm"));
                Boolean emp = Boolean.valueOf(empadmS); 
                if (emp != true) { // show the modal if the user is loading the web site for the regular user
        %>
                    <!-- bootstrap modal -->
                    <div class="modal fade" id="centeredModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
                        <div class="modal-dialog modal-dialog-centered" role="document">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="exampleModalCenterTitle">Ptica</h5>
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                                <div class="modal-body">
                                    ********************/ptica/zaposleni je veb sajta za zaposlene i administratore
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-info" data-dismiss="modal">Close</button>
                                </div>
                            </div>
                        </div>
                    </div>
        <%
                }
            }
        %>
    </body>
</html>
