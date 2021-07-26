<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<title>Mall</title>

<style type="text/css">
body{
	    background-image: url("./backImg/scale_1201.jpg");
	    background-size:cover;
	    width:100%;
		margin-top: 150px;
	}
	.container {
		width:68%;
		margin-top:300px;
	
  } 
  .person {
    border: 10px solid transparent;
    margin-bottom: 25px;
    width: 80%;
    height: 70%;
  }
  .person:hover {
    border-color: #b3243c;
  }
  .col-sm-4{
   float: left;
   width:25%;
  }
	img{
		opacity: 0.85;
	}
}

</style>
</head>
<body>

<div class="top">
 <%@include file="top.jsp" %> 
</div>
<div class="container text-center">
 
  <br>
  <div class="row">
    <div class="col-sm-4">
      <a href="./intro.jsp">
        <img src="./backImg/asd.png" class="img-circle person" alt="Random Name" width="200" height="200">
      </a>
    </div>
    <div class="col-sm-4">
      <a href="./freeboard.GGZ">
        <img src="./backImg/asd1.png" class="img-circle person" alt="Random Name" width="200" height="200">
      </a>
    </div>
    
    <div class="col-sm-4">
      <a href="./quiz.GGZ">
        <img src="./backImg/asd2.png" class="img-circle person" alt="Random Name" width="200" height="200">
      </a>
    </div>
     <div class="col-sm-4">
      <a href="./listSelect.GGZ">
        <img src="./backImg/asd3.png" class="img-circle person" alt="Random Name" width="200" height="200">
      </a>
    </div>
  </div>
</div>

<footer>
<%--  <%@include file="footer.jsp" %>  --%>
</footer>


</body>
</html>