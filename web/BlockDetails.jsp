<%-- 
    Document   : BlockDetails
    Created on : Jun 12, 2020, 7:17:27 PM
    Author     : SCINDIA
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
.content {
  padding: 0 18px;
  display: none;
  overflow: hidden;
  background-color: #f1f1f1;
}
</style>
    </head>
    <body>
       <h1>Enter Block Details:</h1>

       <div>   
    <form action="./BlockServlet" method="post">
   <div class="form-group">
    <label for="BlockNumber">Id:</label>
    <input type="text" class="form-control" name="id">
  </div>
    <div class="form-group">
    <label for="name">Block No:</label>
    <input type="text" class="form-control" name="blockno">
  </div>
     <div class="form-group">
    <label for="name">Block name:</label>
    <input type="text" class="form-control" name="blockname">
  </div>
        <button type="submit" class="btn btn-default">Submit</button>
    </form>
           
</div>
   </body>
</html>
