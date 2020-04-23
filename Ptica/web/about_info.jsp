<%-- 
    Document   : about_info
    Created on : 12-May-2019, 05:30:48
    Author     : Ingrid Farkas
    Project    : Ptica
--%>

<%@page contentType = "text/html" pageEncoding = "UTF-8"%>
<%@page import = "miscellaneous.PticaMetodi"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    <body>
        <%
            HttpSession hSession = PticaMetodi.returnSession(request);
            hSession.setAttribute("webpg_name", "about_page.jsp");
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
                </div>
                
                <!-- the Bootstrap column takes 5 columns on the large desktops and 5 columns on the medium sized desktops -->
                <div class="col-lg-5 col-md-5"> 
                    <div class="container"> <!-- adding the container to the Bootstrap grid -->
                        <div class="row"> <!-- adding a new row to the Bootstrap grid -->
                            <div class="col">
                                &nbsp; &nbsp;
                                <br/>
                                <span class="text-info">
                                    <h3>O nama</h3>
                                </span>
                                <br/>
                                <p>
                                    Lanac knjižara Ptica je osnovan 2010 u Beogradu. Knjižara ima veoma širok izbor knjiga različitih žanrova uključujući
                                    beletristiku, stručnu literaturu, popularnu nauku, umetnost, dečje knjige i sve što poželite u zavisnosti od afiniteta.
                                </p>
                                <p>  
                                    Smeštena u centru grada Ptica ima veoma toplu i prijateljsku atmosferu gde se ljubitelji knjiga sreću i uživaju
                                    u razgledanju i kupovini knjiga uz šolju kafe ili čaja. 
                                </p>
                                <p>
                                    Ptica je mesto gde se ljubitelji knjiga sreću da istražuju knjige i da razmenjuju ideje i misli. Naše ljubazno 
                                    osoblje je uvek tu da odgovori na Vaša pitanja i da pronađu knjige koje Vas zanimaju.
                                </p>
                                <p>  
                                    Ako nemate vremena ili niste u mogućnosti da posetite jednu od naših prodavnica molimo Vas posetite našu veb 
                                    sajtu, pretražite širok izbor knjiga i poručite knjige na veb sajti ili na telefonu. 
                                </p>
                                <p>
                                    Ako ste u mogućnosti da posetite jednu od naših prodavnica dođite i uživajte u prodavnici sa veoma prijatnom
                                    atmosferom koja je veoma jedinstvena gde možete naći kjnige koje su Vam potrebne ili knjige koje nisu neophodne ali koje 
                                    biste hteli da pročitate.
                                </p>
                            </div> <!-- end of class="col" -->
                        </div> <!-- end of class="row" --> 
                    </div> <!-- end of class="container" -->
                </div> <!-- end of class="col-lg-5 col-md-5" -->
            </div> <!-- end of class="row" -->
        </div> <!-- end of class="whitebckgr" -->
            
        <!-- adding a new row; class whitebckgr is for setting the background to white -->
        <div class = "whitebckgr">
            <div class = "col">
                &nbsp; &nbsp;
            </div>
        </div> 
    </body>
</html>

