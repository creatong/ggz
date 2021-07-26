    <%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  
<!DOCTYPE html>
<html lang="UTF-8">
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Document</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css" />
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&display=swap" rel="stylesheet">
<style>
    @font-face {
    font-family: 'twaysky';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_tway@1.0/twaysky.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}
 .aa { color:  #4f2b15; text-decoration: none;}
  .aa:link { text-decoration: none;}
  /*INNER*/
  .inner {
    width: 65%;
    margin: 0 auto;
    position: relative;
  }
header {
    width: 100%;
    position: fixed;
    top: 0;
    z-index: 9; 
    background-color:  #ffffff;
    border-bottom: 1px solid #c8c8c8;
    font-family: 'twaysky';
  }
  header > .inner {
    height: 85px;
  }

/* 로그인 */
  header .sub-menu { 
    position: absolute;
    top: 25px;
    right: 0;
    display: flex;
  }
  header .sub-menu ul.menu {
    display: flex;
  }
  header .sub-menu ul.menu li {
    position: relative;
  }
  
/*    " | "    */
  header .sub-menu ul.menu li::before {
    content: "";
    width: 1px;
    height: 30px;
    background-color: #e5e5e5;
    position: absolute;
    top: 0;
    bottom: 0;
    margin: auto;
  }
  header .sub-menu ul.menu li:first-child::before {
    display: none;
  }
  
/*   로그인 마이페이지 */
  header .sub-menu ul.menu li .aa {
    padding: 11px 18px;
    display: block;
    font-size: 12px;
    color: #656565;
  }
  header .sub-menu ul.menu li .aa:hover {
    color: #000;
  }
/*   전체메뉴 */
  header .main-menu {
    position: absolute;
    top: 6px;
    left: 0;
    z-index: 1;
    display: flex;
  }
  
/*   로고 */
    header .home {
    top: 20px;
    left: 0;
    padding: 10px 20px 34px 20px;
    font-size: 50px;
    color: #656565;
    
  }
   header .main-menu{ 
   left:220px;
    text-decoration: none;
   }
  header .main-menu .item .item__name {
    padding: 20px 20px 34px 20px;
    font-size: 13px;
     text-decoration: none;
     margin-top:10px;
  }
   header .main-menu li::before {
    content: "";
    width: 1px;
    height: 30px;
    background-color: #e5e5e5;
    position: absolute;
    top: 0;
    bottom: 0;
    margin: auto;
  }
/*    header .main-menu .item:hover p { */
/*     color: #000; */
/*   } */
</style>
</head>
<body>
    <header>
        <div class="inner">
            <div class="sub-menu">
                <ul class="menu">
                  <c:choose>       
             <c:when test="${member != null}">   
                 <li>
                 <div class="aa" style="color:#000;"> ${member.name} 님 
                 환영합니다 <br><br> <p style="text-align:right">${member.point } P</p></div>
                  <a class="aa" href="./update.GGZ"> </a>
                  </li>
                  <li>
                    <a class="aa" href="./update.GGZ">My Page</a>
                  </li>
                  <li>
                    <a class="aa" href="./cartView.GGZ">Cart(${fn:length(cart) })</a>
                  </li>
                   <li>
                    <a class="aa" href="./logout.GGZ">log out</a>
                  </li>
                  </c:when>              
                  <c:otherwise>
                    <li>
                    <a class="aa" href="./login.GGZ">log in</a>
                  </li>

                  </c:otherwise>
                  </c:choose>
                </ul>
              </div>
            <div class="home"><a class="aa" href="./index.jsp"><div style="margin-top:10px;">그그지</div></a></div>             
            <ul class="main-menu"> <li class="item">
                  <a class="aa" href="intro.jsp"><div class="item__name">소개</div></a>
              </li>
              <li class="item">
                  <a class="aa" href="./freeboard.GGZ"> <div class="item__name">자유게시판</div></a>
              </li>
              <li class="item">
               <a class="aa" href="./quiz.GGZ"> <div class="item__name">퀴즈&모의고사</div></a>
              </li>
              <li class="item">
                <a class="aa" href="listSelect.GGZ?btn=btn5&pno=1"><div class="item__name">문방구</div></a>
              </li>
            </ul>
        
        </div>
</header>
</body>
</html>