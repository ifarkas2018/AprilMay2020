<%-- 
    Document   : error_succ.jsp
    Created on : 19-Nov-2018, 02:31:59
    Author     : Ingrid Farkas
    Project    : Ptica
--%>

<!-- error_succ.jsp adds the error or success message to the web page -->
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="miscellaneous.PticaMetodi"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%
            HttpSession hSession = PticaMetodi.returnSession(request);
            // the name of the page to return to if the user enters the email (subscribe) 
            hSession.setAttribute("webpg_name", "error_succ.jsp");
            // reseting the sess. var to the default: if the user just did do the subscribe, the form on the NEXT web page DOESN'T NEED 
            // to show the previous values 
            hSession.setAttribute("subscribe", "false");
            
            // title - the title passed from one web page to the other
            String sTitle = (String)hSession.getAttribute("title");
             
            String sSource = (String)hSession.getAttribute("source_name");
            // set the title of this web page depending on the task the user is doing 
            if (sSource.equalsIgnoreCase("Nova knjiga")) {
                out.print("<title>Ptica - Nova knjiga</title>"); 
            } else if (sSource.equalsIgnoreCase("Novi naslovi")) {
                out.print("<title>Ptica - Novi naslovi</title>"); 
            } else if (sSource.equalsIgnoreCase("Pretraga knjiga")) {
                out.print("<title>Ptica - Pretraga knjiga</title>"); 
            } else if (sSource.equalsIgnoreCase("Ažuriranje knjige")) {
                out.print("<title>Ptica - Ažuriranje knjige</title>"); 
            } else if (sSource.equalsIgnoreCase("Brisanje knjige")) {
                out.print("<title>Ptica - Brisanje knjige</title>"); 
            } else if (sSource.equalsIgnoreCase("Prijava")){
                out.print("<title>Ptica - Prijava</title>");
            } else if (sSource.equalsIgnoreCase("Odjava")){
                out.print("<title>Ptica - Odjava</title>");    
            } else if (sSource.equalsIgnoreCase("Novi nalog")){
                out.print("<title>Ptica - Novi nalog</title>");
            }
        %>    
        
        <!-- link to the external stylesheet -->
        <link href="css/templatecss.css" rel="stylesheet" type="text/css">
        
        <!-- including the file header.jsp into this file -->
        <!-- header.jsp contains - company logo, company name and the navigation bar -->
        <%@ include file="header.jsp"%>
    </head>
    
    <body>
        <div class="whitebckgr">
            <div class="row"> <!-- adding a new row to the Bootstrap grid -->
                <!-- the Bootstrap column takes 6 columns on the large desktops and 6 columns on the medium sized desktops -->
                <div class="col-lg-6 col-md-6"> 
                    <br /><br />
                    <div> 
                        <!-- horizontally centering the picture using center-image, img-fluid is for responsive image -->
                        <img src="images/books.png" class="img-fluid center-image" alt="picture of books" title="picture of books"> 
                    </div>
                </div>
                
                <!-- the Bootstrap column takes 5 columns on the large screens and 5 columns on the medium sized screens -->
                <div class="col-lg-5 col-md-5"> 
                    <div class="container">
                        <div class="row"> <!-- adding a new row to the Bootstrap grid -->
                            <div class="col">
                                &nbsp; &nbsp;
                                <br />
                                <br /><br /><br />
                                <%
                                    // title, source_name, message - the information passed from the other JSP (searchDB.jsp or updateDB.jsp)
                                    // sSource - the text shown on the button and for setting the action in the form tag
                                    
                                    // message - attribute passed from the other web   used to determine the message on the web page
                                    String sMessage = (String)hSession.getAttribute("message");
                                    
                                    // changing the color of error messages to red
                                    String errStart = "<span class=\"text-warning\">";
                                    String errEnd = "</span>";
                                    
                                    out.print("<br />");
                                    out.print("<h3 class=\"text-info\">" + sTitle + "</h3><br /><br />");
                                    if (sMessage.equalsIgnoreCase("ERR_DB")) {
                                        out.print(errStart + "Došlo je do greške" + errEnd + " prilikom pristupa bazi podataka!"); 
                                    } else if (sMessage.equalsIgnoreCase("ERR_LOGIN")) {   
                                        out.print("Korisničko ime ili lozinka " + errStart + "ne postoje!" + errEnd );
                                    } else if (sMessage.equalsIgnoreCase("ERR_USER_EXISTS")) {
                                        out.print("Uneto korisničko ime " + errStart + "već postoji i korisnik nije unesen" + errEnd + " u bazu podataka!");
                                    } else if (sMessage.equalsIgnoreCase("ERR_SIGN_UP")) {
                                        out.print(errStart + "Došlo je do greške " + errEnd + "prilikom dodavanja novog korisnika i korisnik nije dodat u bazu podataka!"); 
                                    } else if (sMessage.equalsIgnoreCase("ERR_SEARCH")) {
                                        out.print(errStart + "Došlo je do greške" + errEnd + " prilikom pretraživanja!"); 
                                    } else if (sMessage.equalsIgnoreCase("ERR_NO_BOOKID")) {
                                        out.print("Knjiga sa tim naslovom, autorom i Isbn-om " + errStart + "ne postoji!" + errEnd); 
                                    } else if (sMessage.equalsIgnoreCase("ERR_NO_AUTHID")) {
                                        out.print("Knjiga od tog autora " + errStart + "ne postoji!" + errEnd); 
                                    } else if (sMessage.equalsIgnoreCase("ERR_ADD")) {
                                        out.print(errStart + "Došlo je do greške" + errEnd + " prilikom dodavanja knjige i knjiga nije uspešno dodata u bazu podataka!"); 
                                    } else if (sMessage.equalsIgnoreCase("ERR_UPDATE")) {
                                        out.print(errStart + "Došlo je do greške" + errEnd + " prilikom ažuriranja podataka o knjizi!"); 
                                    } else if (sMessage.equalsIgnoreCase("ERR_DELETE")) {
                                        out.print(errStart + "Došlo je do greške" + errEnd + " prilikom brisanja knjige!");
                                    } else if (sMessage.equalsIgnoreCase("DEL_NO_BOOK")) {
                                        out.print("Knjiga ne postoji i zbog toga" + errStart + " nije obrisana iz baze podataka!" + errEnd);
                                    } else if (sMessage.equalsIgnoreCase("ERR_ADD_EXISTS")) {
                                        out.print("Knjiga sa tim Isbn-om već postoji i" + errStart + " knjiga nije dodata u bazu podataka!" + errEnd);  
                                    } else if (sMessage.equalsIgnoreCase("SUCC_ADD")) {
                                        out.print("Podaci o knjizi su uspešno uneti u bazu podataka!");       
                                    } else if (sMessage.equalsIgnoreCase("SUCC_UPDATE")) {
                                        out.print("Podaci o knjizi su uspešno promenjeni u bazi podataka!");  
                                    } else if (sMessage.equalsIgnoreCase("SUCC_DELETE")) {
                                        out.print("Knjiga je uspešno obrisana iz baze podataka!");  
                                    } else if (sMessage.equalsIgnoreCase("SUCC_SIGN_UP")) {
                                        out.print("Novi korisnik je uspešno registrovan!"); 
                                    } else if (sMessage.equalsIgnoreCase("SUCC_LOGOUT")) {
                                        out.print("Uspešno ste se odjavili!");
                                    }
                                    
                                    // sSource used for setting the action attribute of the form tag (the page that is loaded when the user clicks the button)
                                    if (sSource.equalsIgnoreCase("Nova knjiga")) {
                                %>
                                        <form action="add_page.jsp" method="post">
                                <%
                                    } else if (sSource.equalsIgnoreCase("Novi naslovi")) {
                                %>
                                        <form action="index.jsp" method="post">
                                <%
                                    } else if (sSource.equalsIgnoreCase("Pretraga knjiga")) {
                                %>
                                        <form action="search_page.jsp" method="post">  
                                <%
                                    } else if (sSource.equalsIgnoreCase("Ažuriranje knjige")) {                            
                                %>
                                        <form action="update_prev.jsp" method="post"> 
                                <%
                                    } else if (sSource.equalsIgnoreCase("Brisanje knjige")) { 
                                %>
                                        <form action="delete_title.jsp" method="post">
                                <%
                                    } else if (sSource.equalsIgnoreCase("Prijava")) {
                                %>
                                        <form action="login_page.jsp" method="post">
                                <%
                                    } else if (sSource.equalsIgnoreCase("Odjava")) {
                                %>
                                        <form action="index.jsp" method="post">
                                <%
                                    } else if (sSource.equalsIgnoreCase("Novi nalog")) {
                                %>
                                        <form action="signup_page.jsp" method="post">
                                <%
                                    }
                                %>
                                <% if (sSource.equals("Odjava")) {
                                       sSource = "Ptica"; // show on the button text Ptica
                                   }
                                %>
                                    <br /><br /><br />
                                    <!-- adding the To button to the form; btn-sm is used for smaller (narrower) size of the control -->
                                    <button type="submit" class="btn btn-info btn-sm"> <%= sSource %></button>
                                </form>
                                
                            </div> <!-- end of class = "col" -->
                        </div> <!-- end of class = "row" --> 
                    </div> <!-- end of class = "container" -->
                </div> <!-- end of class = "col-lg-5 col-md-5" -->
            </div> <!-- end of class = "row" -->
        </div> <!-- end of class = "whitebckgr" -->
            
        <!-- adding a new row to the Bootstrap grid; class whitebckgr is for setting the background to white -->
        <div class="whitebckgr">
            <div class="col">
                &nbsp; &nbsp;
            </div>
        </div> 
        <!-- including the file footer.jsp into this file -->
        <!-- footer.jsp contains the footer of the web page --> 
        <%@ include file="footer.jsp"%> 
    </body>
</html>
