<%-- 
    Document   : add_form.jsp
    Created on : 08-Nov-2018, 13:02:11
    Author     : Ingrid Farkas
    Project    : Ptica
--%>

<!-- add_form.jsp - adds the form on the page Add Book -->
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="miscellaneous.PticaMetodi"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Ptica - Nova knjiga</title>
        
        <script src="javascript/validationJS.js"></script>
        
        <script>
            NUM_FIELDS = 9; // number of the input fields on the form  
            INPUT_FIELDS = 11;
            
            // setCookie: creates cookie inputI = value in the input field ; (I - number 0..9)
            function setCookie() {           
                var i;
                var inp_names = new Array('title', 'author', 'isbn', 'price', 'pages', 'category', 'descr', 'publisher', 'yrpublished'); // names of the input fields
                
                for (i = 0; i < NUM_FIELDS; i++) {
                    if (i === 3) { // creating the cookie that containes the price
                        strWithDot = document.getElementById(inp_names[i]).value; 
                        strWithDot = strWithDot.replace('.','!');
                        strWithDot = strWithDot.replace(',','.');
                        document.cookie = "input" + i + "=" + strWithDot + ";"; // creating a cookie
                    } else {
                        document.cookie = "input" + i + "=" + document.getElementById(inp_names[i]).value + ";"; // creating a cookie
                    }    
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
            
        </script>
    </head>
    
    <body onload="setDefaults()">
        <%
            final String PAGE_NAME = "add_page.jsp"; // page which is loaded now 
            HttpSession hSession = PticaMetodi.returnSession(request);
            hSession.setAttribute("webpg_name", "add_page.jsp");
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
                    <div> 
                        <!-- horizontally centering the picture using center-image, img-fluid is for responsive image -->
                        <img src="images/books.png" class="img-fluid center-image" alt="slika sa knjigama" title="slika sa knjigama"> 
                    </div>
                    <br /><br />
                    <div> 
                        <!-- horizontally centering the picture using center-image, img-fluid is for responsive image -->
                        <img src="images/books.png" class="img-fluid center-image" alt="slika sa knjigama" title="slika sa knjigama"> 
                    </div>
                </div>
                
                <!-- the Bootstrap column takes 5 columns on the large desktops and 5 columns on the medium sized desktops -->
                <div class="col-lg-5 col-md-5"> 
                    <div class="container"> <!-- adding the container to the Bootstrap grid -->
                        <div class="row"> <!-- adding a new row to the Bootstrap grid -->
                            <div class="col">
                                &nbsp; &nbsp;
                                <br/>
                                <h3 class="text-info">Nova knjiga</h3>
                                <br/> 
                                <%  
                                    HttpSession hSession2 = PticaMetodi.returnSession(request);
                                    
                                    String input0 = ""; // read the value which was before in the input field and show it again
                                    String input1 = ""; 
                                    String input2 = ""; 
                                    String input3 = "";
                                    String input4 = "";
                                    String input5 = "";
                                    String input6 = ""; // read the value which was before selected in the drop down list and show it again
                                    String input7 = ""; // read the value which was before in the text area and show it again
                                    String input8 = "";
                                                                        
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
                                            if (( page_name.equalsIgnoreCase(PAGE_NAME)) && (fill_in.equalsIgnoreCase("true"))) {
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
                                                    input3 = String.valueOf(hSession2.getAttribute("input3")); 
                                                } 
                                                if (PticaMetodi.sessVarExists(hSession2, "input4")) {
                                                    input4 = String.valueOf(hSession2.getAttribute("input4")); 
                                                } 
                                                if (PticaMetodi.sessVarExists(hSession2, "input5")) {
                                                    input5 = String.valueOf(hSession2.getAttribute("input5")); 
                                                } 
                                                if (PticaMetodi.sessVarExists(hSession2, "input6")) {
                                                    input6 = String.valueOf(hSession2.getAttribute("input6")); 
                                                } 
                                                if (PticaMetodi.sessVarExists(hSession2, "input7")) {
                                                    input7 = String.valueOf(hSession2.getAttribute("input7")); 
                                                } 
                                                if (PticaMetodi.sessVarExists(hSession2, "input8")) {
                                                    input8 = String.valueOf(hSession2.getAttribute("input8")); 
                                                } 
                                            } 
                                        }
                                        hSession2.setAttribute("fill_in", "false"); // the input fields don't need to be filled in
                                    } 
                                    
                                    // store on which page I am now in case the user clicks on subscribe button in the footer
                                    hSession2.setAttribute("page_name", PAGE_NAME);
                                    PticaMetodi.setToEmptyInput(hSession2); // setToEmpty: set the session variable values to "" for the variables named input0, input1, ...
                                %>
                                
                                <!-- after clicking on the button AddServlet is shown -->
                                <form id="add_book" name="add_book" action="AddServlet" method="post" onsubmit="return checkForm();">
                                    <!-- creating the input element for the title -->
                                    <div class="form-group">
                                        <label for="title">Naslov <span class="text_size text-danger">*</span></label> <!-- title label -->
                                        <!-- filling in the title is required -->
                                        <input type="text" class="form-control form-control-sm" name="title" id="title" maxlength="60" onchange="setCookie()" onfocusout='setFocus("add_book", "title")' required value="<%= input0 %>"> 
                                    </div>
                                        
                                    <!-- creating the input element for the author -->
                                    <div class="form-group">
                                        <label for="author">Autor <span class="text_size text-danger">*</span></label> <!-- author's name label -->
                                        <!-- filling in the author is required -->
                                        <input type="text" class="form-control form-control-sm" name="author" id="author" maxlength="70" onchange="setCookie()" onfocusout="valLetters(document.add_book.author, author_message, 'fullname', false, 'true');" required value="<%= input1 %>"> 
                                    </div>
                
                                    <!-- creating the input element for the ISBN -->
                                    <div class="form-group">
                                        <label for="isbn">Isbn</label> <!-- ISBN label -->
                                        <input type="text" class="form-control form-control-sm" name="isbn" id="isbn" maxlength="13" onchange="setCookie()" onfocusout='isNumber("add_book", "isbn", "is_isbn", "isbn_message", false, false)' value="<%= input2 %>"> 
                                        <span id="isbn_message" class="text_size text-danger"></span>
                                    </div>
                                        
                                    <!-- creating the input element for price -->
                                    <div class="form-group">
                                        <% if (!input3.equalsIgnoreCase("")) {
                                            input3 = input3.replace('.', ','); // in the cookie instead of , appears .
                                            input3 = input3.replace('!','.');
                                           }
                                        %>
                                        <label for="price">Cena</label> <!-- Price label -->
                                        <input type="text" class="form-control form-control-sm" name="price" id="price" maxlength="9" onchange="setCookie()" onfocusout='daLiJeCena("add_book", "price", "is_price", "price_message")' value="<%= input3 %>"> 
                                        <span id="price_message" class="text_size text-danger"></span>
                                    </div>
                                        
                                    <!-- creating the input element for number of pages -->
                                    <div class="form-group">
                                        <label for="pages">Broj strana</label> <!-- Pages label -->
                                        <input type="text" class="form-control form-control-sm" name="pages" id="pages" maxlength="4" onchange="setCookie()" onfocusout='isNumber("add_book", "pages", "is_pages", "pages_message", false, false)' value="<%= input4 %>"> 
                                        <span id="pages_message" class="text_size text-danger"></span>
                                    </div>
                                        
                                    <!-- creating the drop down list for the Category -->
                                    <div class="form-group"> 
                                        <label for="category">Žanrovi</label> <!-- category label -->
                                        <!-- creating a drop down list; form-control-sm is used for narrower control -->
                                        <select class="form-control form-control-sm" name="category" id="category" onchange="setCookie()">
                                            <% if (input5.equalsIgnoreCase("all")) { %>
                                                   <option value="all" selected>Svi žanrovi</option> <!-- options shown in the drop down list -->
                                            <% } else { %>
                                                   <option value="all">Svi žanrovi</option>
                                            <% } %>
                                            
                                            <% if (input5.equalsIgnoreCase("fict")) { %>
                                                   <option value="fict" selected>Romani</option> 
                                            <% } else { %>
                                                   <option value="fict">Romani</option>   
                                            <% } %>
                                            
                                            <% if (input5.equalsIgnoreCase("bus")) { %>
                                                   <option value="bus" selected>Biznis i ekonomija</option> 
                                            <% } else { %>
                                                   <option value="bus">Biznis i ekonomija</option>      
                                            <% } %>
                                            
                                            <% if (input5.equalsIgnoreCase("comp")) { %>
                                                   <option value="comp" selected>Internet i računari</option> 
                                            <% } else { %>
                                                   <option value="comp">Internet i računari</option>  
                                            <% } %>
                                            
                                            <% if (input5.equalsIgnoreCase("edu")) { %>
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
                                        
                                    <!-- creating the textarea for the book description -->
                                    <div class="form-group">
                                        <label for="descr">Opis</label> <!-- Description label --> 
                                        <textarea class="form-control" name="descr" id="descr" rows="7" onchange="setCookie()"><%= input6 %></textarea>
                                    </div>
                                        
                                    <!-- creating the input element for the publisher -->
                                    <div class="form-group">
                                        <label for="publisher">Izdavač <span class="text_size text-danger">*</span></label> <!-- publisher label -->
                                        <!-- filling in the publisher is required -->
                                        <input type="text" class="form-control form-control-sm" name="publisher" maxlength="40" id="publisher" onchange="setCookie()" onfocusout='setFocus("add_book", "publisher")' required value="<%= input7 %>"> 
                                    </div>
                                        
                                    <!-- creating the input element for the publisher -->
                                    <div class="form-group">
                                        <label for="yrpublished">Godina izdanja</label> <!-- publisher label -->
                                        <!-- filling in the publisher is required -->
                                        <input type="text" class="form-control form-control-sm" name="yrpublished" id="yrpublished" maxlength="4" onchange="setCookie()" onfocusout='isNumber("add_book", "yrpublished", "is_yrpubl", "yrpubl_message", false, false)' value="<%= input8 %>"> 
                                        <span id="yrpubl_message" class="text_size text-danger"></span>
                                    </div>
                                        
                                    <div class="container">
                                        <div class="row">
                                            <div class="col">
                                                &nbsp; &nbsp; <!-- adding some empty space -->
                                            </div>
                                        </div>    
                                    </div>
                                        
                                    <!-- adding the Search button to the form; btn-sm is used for smaller (narrower) size of the control -->
                                    <button type="submit" id="btnSubmit" class="btn btn-info btn-sm">Dodajte knjigu</button>
                                    <!-- adding a new container -->
                                    <div class="container">
                                        <div class="row">
                                            <div class="col">
                                                &nbsp; &nbsp; <!-- adding some empty space -->
                                            </div>
                                        </div>    
                                    </div>
                                </form>  
                            </div> <!-- end of class = "col" -->
                        </div> <!-- end of class = "row" --> 
                    </div> <!-- end of class = "container" -->
                </div> <!-- end of class = "col-lg-5 col-md-5" -->
            </div> <!-- end of class = "row" -->
        </div> <!-- end of class = "whitebckgr" -->
            
        <!-- adding a new row; class whitebckgr is for setting the background to white -->
        <div class="whitebckgr">
            <div class="col">
                &nbsp; &nbsp;
            </div>
        </div> 
    </body>
</html>