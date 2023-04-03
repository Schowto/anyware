<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	/*서브메뉴*/
	.menu{
	    position: fixed;
	    height: 100vh;
	    width: 170px;
	    font-size: 14px;
	    padding: 40px 20px;
	    border-right: 1px solid rgb(211, 210, 210);
	    font-family: 'Nanum Gothic', sans-serif;
	}
	.menu li{
	    margin-top: 5px;
	}
	#chat-area li a:hover{
	    color: gray;
	    cursor: pointer;
	    text-decoration: none;
	}
	#schedule-area a{
	  color: inherit;
	  text-decoration:none;
	}

</style>
</head>
<body>

	 <div class="menu">
        <span style="font-weight: 600; font-size: 15px;">일정</span><br><br>
        <!-- <button class="btn btn-primary" style="font-size: 13px; width: 100px;">일정추가</button> -->
        <!-- <br><br> -->
        <div id="schedule-area">
           	<ul>
                <li><a href="schedule.sc">캘린더</a></li> 
                <!-- <li><a>내 캘린더 관리</a></li> -->
            </ul>
        </div>
    </div>
    
</body>
</html>