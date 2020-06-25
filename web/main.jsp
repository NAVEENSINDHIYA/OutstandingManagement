<%-- 
    Document   : main
    Created on : Jun 21, 2020, 5:41:10 PM
    Author     : SCINDIA
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<%@page language="java" import="java.util.*"%>
<%@page language="java" import="bean.Block"%>





<html>
<body>
    
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">
    <style>
.collapsible {
  background-color: #888;
  color: white;
  cursor: pointer;
  padding: 18px;
  width: 100%;
  border: none;
  text-align: left;
  outline: none;
  font-size: 15px;
}

.active, .collapsible:hover {
  background-color: #333;
}

.content {
  padding: 0 18px;
  display: none;
  overflow: hidden;
  background-color: #f1f1f1;
}
</style>
</head>


<h1>Member Master:</h1>
<button type="button" class="collapsible">Flat details</button>
<div class="content">
    <h1>Enter Details:</h1>
    <form action="./SaveServlet" method="post">
   <div class="form-group">
    <label for="FlatNumber">Flat No:</label>
    <input type="text" class="form-control" name="flatno">
  </div>
    <div class="form-group">
    <label for="name">Owner Name:</label>
    <input type="text" class="form-control" name="ownername">
  </div>
        <form action="./GetBlockServlet" method="get">
  <div class="form-group">
      <button class="btn btn-primary dropdown-toggle" type="button">Block details</button> 
      <select>
          <option selected="">Please Select</option>
             <% List<Block> list= (List)request.getAttribute("data"); 
           for(Block e:list){ %>
         <option>
             <%= e.getId()%>,
             <%= e.getBlockno()%>,
             <%= e.getBlockname()%>
         </option>
         <% } %>
       </select>
  </div>
        </form>
</div>

        
<button type="button" class="collapsible">Member Details</button>
<div class="content">
  <h1>Enter Details:</h1>
  
</div>

<button type="button" class="collapsible">Tenant Details</button>
<div class="content">
  <h1>Enter Details:</h1>
</div>

<button type="button" class="collapsible">Parking Details</button>
<div class="content">
    <h1>Enter Details:</h1>
</div>

<button type="button" class="collapsible">Charge Details</button>
<div class="content">
    <h1>Enter Details:</h1>
</div>
<script>
var coll = document.getElementsByClassName("collapsible");
var i;

for (i = 0; i < coll.length; i++) {
  coll[i].addEventListener("click", function() {
    this.classList.toggle("active");
    var content = this.nextElementSibling;
    if (content.style.display === "block") {
      content.style.display = "none";
    } else {
      content.style.display = "block";
    }
  });
}
</script>
</body>
</html>
