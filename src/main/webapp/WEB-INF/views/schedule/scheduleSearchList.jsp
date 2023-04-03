<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <title>Insert title here</title>

    <!-- fullcalendar CDN -->
    <script src='https://cdn.jsdelivr.net/npm/fullcalendar@6.1.4/index.global.min.js'></script>
    <style>

    
    /*컨텐트 영역*/
    .content {
        /* border: 1px solid rgb(129, 129, 252); */
        width: 80%;
        margin-left: 200px;
        margin-top: 50px;
        position: relative;
    }

    .main-left {
        /* border: 1px solid rgb(129, 129, 252); */
        width: 25%;
        height: 700px;
    }

    .main-right {
        /* border: 1px solid rgb(129, 129, 252); */
        width: 75%;
        height: 700px;
        position: absolute;
        right: 0px;
        top: 0px;
    }

    .main-left-1 {
        /* border: 1px solid pink; */
        height: 5%;
        width: 90%;
        margin: auto;
    }

    .main-left-1 button {
        height: 100%;
        width: 100%;
        line-height: 20px;
    }

    .main-right-1 {
        /* border: 1px solid pink; */
        height: 35px;
        width: 250px;
        position: absolute;
        right: 20px;
    }

    .main-left-2 {
        /* border: 1px solid pink; */
        height: 280px;
        width: 90%;
        margin: auto;
        margin-top: 25px;
    }

    .calendar {
        /* border: 1px solid lightpink; */
        height: 300px;
        width: 300px;
        margin: auto;
        margin-top: 22px;
    }

    .main-left-3 {
        /* border: 1px solid pink; */
        width: 90%;
        margin: auto;
        margin-top: 28px;
        position:relative;
        
    }

    .mycalendarButton {
        position: absolute;
        right:0%;
        font-weight: 600;
        font-size: 20px;
        background-color: transparent;
        color: black;
        border: none;
        line-height: 20px;
    }

    .main-left-3 > span {
        font-weight: 600;
    }

    /* 캘린더 부분 */
    .main-right-2 {
        /* border: 1px solid rgb(129, 129, 252); */
        height: 95%;
        width: 100%;
        position: absolute;
        top: 35px;
        padding: 20px;
    }

    .ppaging {
        /* border: 1px solid rgb(129, 129, 252); */
        width:27%;
        margin-left:340px;
    }

    /* 모달 */
    /* 새 일정 추가 모달 AddScheduleModal / 드래그 새 일정 추가 모달  */
    #calendarNo, #startDate, #startTime, #endDate, #endTime, #scTitle, #scContent {
        width: 100%;
    }

    #startTime, #endTime {
        height: 28px;
    }
    /* 드래그시 새 일정 추가 모달 */
    #dragCalendarNo, #dragStartDate, #dragStartTime, #dragEndDate, #dragEndTime, #dragScTitle, #dragScContent {
    	width: 100%;
    }

    #dragStartTime, #dragEndTime {
        height: 28px;
    }
    /*  클릭시 상세 보기 모달 */
    #clickCalendarNo, #clickStartDate, #clickStartTime, #clickEndDate, #clickEndTime, #clickScTitle, #clickScContent {
    	width: 100%;
    }

    #clickStartTime, #clickEndTime {
        height: 28px;
    }
    /*  클릭시 상세 보기 수정 모달 */
    #cccc, #modifyStartDate, #modifyStartTime, #modifyEndDate, #modifyEndTime, #modifyScTitle, #modifyScContent {
    	width: 100%;
    }

    #modifyStartTime, #modifyEndTime {
        height: 28px;
    }

    /* 내 캘린더 추가 체크박스 */
    .mycalenderCheckbox input[type="checkbox"] {
        width:17px;
        height:17px;
        display: none;
    }

    input[type=checkbox] + label {
        cursor: pointer;
    }

    label{
        width: 17px;
        height: 17px;
        margin-top: 10px;
        margin-right: 6px;
        border-radius: 0.3em;
        vertical-align:middle;
        color: white;
        font-size: 17px;
        text-align: center;
        position:relative;
    }
    
    .ck {
        position:absolute; 
        right:0px; 
        top:0px;
        width:17px;
        height:17px;
        border:2px solid rgb(66, 66, 66);
        border-radius: 0.3em;
    }

    /* 내 캘린더 목록 */
    #myCalendars {
        /* border: 1px solid pink; */
        padding: 5px;
        position:relative;
        height: 300px;
        /* overflow: auto; */
    }

    #myCalendars input[type=checkbox] {
        width:17px;
        height:17px;
        border-radius: 0.3em;
        appearance: none;
        cursor: pointer;
        transition: background 0.2s;
        background:transparent;
        /* border: 1.5px solid rgb(77, 77, 77); */
    }

    #myCalendars input[type="checkbox"]:checked {
        
        /* background:transparent !important; */
        border:2px solid rgb(77, 77, 77);

    }
    
    #myCalendars>div {
        width:90%;
        float:left;
    } 

    #myCalendars button {position:absolute; right:0px;}

    .myCalendars img {position:absolute; right:0px;}

    /* 수정하기 버튼 */
    /* #modifyImg:hover {display:block;} */

    /* 리스트 */
    #navbarSupportedContent {position:relative;}
    #navbarSupportedContent li{
        font-size: 15px;
        color:black;
        font-weight: 600;
        margin-left:130px;
    }
    /* .nav-a {position:absolute; left:5px;} */
    .nav-b {position:absolute; left:300px;}
    .nav-c {position:absolute; left:620px;}

    .table tr:hover{
	    background-color: rgb(250, 249, 249);
        cursor: pointer;
    }
        

    </style>
</head>
<body>
<!-- 사이드 바  -->
<jsp:include page="../common/sidebar.jsp"></jsp:include>

<!-- 스케줄 메뉴바 -->
<jsp:include page="../common/schedulemenu.jsp"></jsp:include>

<!-- 내용 -->
<div class="content">
    
    <div class="main-left">
        <div class="main-left-1">
            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#AddScheduleModal">+ 일정 추가</button>
        </div>
        <!-- <div class="main-left-2">
            <div class="calendar"></div>
        </div> -->
        <div class="main-left-3">
            &nbsp;<img src="resources/images/arrow_right.png" alt="arrow_right" width="18px;" height="18px;">
            <span>&nbsp;&nbsp;내&nbsp;&nbsp;캘린더</span>
            <button type="button" class="mycalendarButton" data-toggle="modal" data-target="#AddCalendarModal">+</button>
            <div id="myCalendars">
                <!-- <div class="mycalenderCheckbox"> -->
                    <!-- <div class="cName"></div><input type="checkbox" name="scColor" value="" >
                    &nbsp;&nbsp;내 일정</div>
                    <button type="button" style="background-color:transparent; border:none;" data-toggle="modal" data-target="#myCalendarModifyModal" onclick="calendarModifyModal('+resData[i].calendarNo+');">
                        <img src="resources/images/modification.png" style="width:17px; height:17px;"></button><br> -->
                <!-- </div> -->
            </div>
        </div>
    </div>

    <div class="main-right">
        <div class="main-right-1">
            <form action="scheduleSearchList.sc" method="get" class="d-flex" role="search" >
                <input class="form-control form-control-sm me-2" type="search"
                       placeholder="검색어를 입력하세요" aria-label="Search" name="keyword" style="width: 250px;">
                <button class="btn" type="submit"
                        style="font-size: 13px; color: #ffffff; background-color: rgb(192, 192, 192);">
                    <b>Search</b></button>
            </form>
        </div>

        <div class="main-right-2">
            <div>

                <nav class="navbar navbar-expand-lg bg-light">
                    <div class="container-fluid">
                      <div class="collapse navbar-collapse" id="navbarSupportedContent">
                        <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                            <li class="nav-a">일자</li>
                            <li class="nav-b">캘린더</li>
                            <li class="nav-c">제목</li>
                        </ul>
                      </div>
                    </div>
                  </nav>

                <table class="table">
                    <c:choose>
                	    <c:when test="${ empty list }">
                            <tr align="center">
                                <td colspan="7">검색결과가 없습니다.</td>
                            </tr>
                        </c:when>
                        <c:otherwise>
                            <c:forEach var="l" items="${ list }">
                                <tr style="text-align:center;">
                                    <td width="30%;">${l.startDate} ~ ${l.endDate}</td>
                                    <td width="30%;">${l.myCalendar}</td>
                                    <td width="30%;">${l.scTitle}</td>
                                </tr>
                            </c:forEach> 
                        </c:otherwise>
                    </c:choose>
                </table>
                <br><br><br><br>

                <!-- 페이징 -->
                <div class="ppaging">
                <ul class="pagination pagination-sm">

                    <c:choose>
                        <c:when test="${ pi.currentPage eq 1 }">
                            <li class="page-item disabled"><a class="page-link" href="#">Previous</a></li>
                        </c:when>
                        <c:otherwise>
                            <li class="page-item"><a class="page-link" href="scheduleSearchList.sc?cpage=${ pi.currentPage-1}">Previous</a></li>
                        </c:otherwise>
                    </c:choose>
                    
                    <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
                        <li class="page-item"><a class="page-link" href="scheduleSearchList.sc?cpage=${ p }">${ p }</a></li>
                    </c:forEach>

                    <c:choose>
                        <c:when test="${ pi.currentPage eq pi.maxPage }">
                            <li class="page-item disabled"><a class="page-link" href="#">Next</a></li>
                        </c:when>
                        <c:otherwise>
                            <li class="page-item"><a class="page-link" href="scheduleSearchList.sc?cpage=${ pi.currentPage+1}">Next</a></li>
                        </c:otherwise>
                    </c:choose>
                </ul>
                </div>

            </div>
        </div>

        
    </div>
</div>

<!------------------------------------------------ 모달 ------------------------------------------ -->

       <!-- 새 일정 추가 모달 -->
    <div class="modal" id="AddScheduleModal">
        <div class="modal-dialog">
            <div class="modal-content">

                <!-- Modal body -->
                <div class="modal-body">
                    <span style="font-size:20px; font-weight:600;">일정추가</span>
                    <br><br>

                    <form action="">
                        <table style="width:100%; border-spacing: 10px; border-collapse: separate;">
                            <colgroup>
                                <col style="width: 20%;"/>
                                <col style="width: 35%;"/>
                                <col style="width: 25%;"/>
                                <col style="width: 20%;"/>
                            </colgroup>
                            <tr>
                                <th>캘린더</th>
                                <td colspan="3">
                                    <select name="calendarNo" id="calendarNo">
                                        <!-- <option value="1">프로젝트</option>
                                        <option value="2">프로젝트1</option>
                                        <option value="3">프로젝트2</option> -->
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <th>일정시작</th>
                                <td><input type="date" id="startDate" name="startDate"></td>
                                <td>
                                    <select id="startTime" name="startTime">
                                        <option value="00:00">00:00</option>
                                        <option value="00:30">00:30</option>
                                        <option value="01:00">01:00</option>
                                        <option value="01:30">01:30</option>
                                        <option value="02:00">02:00</option>
                                        <option value="02:30">02:30</option>
                                        <option value="03:00">03:00</option>
                                        <option value="03:30">03:30</option>
                                        <option value="04:00">04:00</option>
                                        <option value="04:30">04:30</option>
                                        <option value="05:00">05:00</option>
                                        <option value="05:30">05:30</option>
                                        <option value="06:00">06:00</option>
                                        <option value="06:30">06:30</option>
                                        <option value="07:00">07:00</option>
                                        <option value="07:30">07:30</option>
                                        <option value="08:00">08:00</option>
                                        <option value="08:30">08:30</option>
                                        <option value="09:00">09:00</option>
                                        <option value="09:30">09:30</option>
                                        <option value="10:00">10:00</option>
                                        <option value="10:30">10:30</option>
                                        <option value="11:00">11:00</option>
                                        <option value="11:30">11:30</option>
                                        <option value="12:00">12:00</option>
                                        <option value="12:30">12:30</option>
                                        <option value="13:00">13:00</option>
                                        <option value="13:30">13:30</option>
                                        <option value="14:00">14:00</option>
                                        <option value="14:30">14:30</option>
                                        <option value="15:00">15:00</option>
                                        <option value="15:30">15:30</option>
                                        <option value="16:00">16:00</option>
                                        <option value="16:30">16:30</option>
                                        <option value="17:00">17:00</option>
                                        <option value="17:30">17:30</option>
                                        <option value="18:00">18:00</option>
                                        <option value="18:30">18:30</option>
                                        <option value="19:00">19:00</option>
                                        <option value="19:30">19:30</option>
                                        <option value="20:00">20:00</option>
                                        <option value="20:30">20:30</option>
                                        <option value="21:00">21:00</option>
                                        <option value="21:30">21:30</option>
                                        <option value="22:00">22:00</option>
                                        <option value="22:30">22:30</option>
                                        <option value="23:00">23:00</option>
                                        <option value="23:30">23:30</option>
                                        <option value="24:00">24:00</option>
                                    </select>
                                </td>
                                <td id="alldayCheck" style="position:relative;">
                                    <input type="checkbox" id="allday" name="allday" value="Y"
                                        style="width:17px; height:17px; margin-top:10px;">
                                    <span style="position:absolute; top:6px; right:25px;">종일</span>
                                </td>
                            </tr>
                            <tr>
                                <th>일정종료</th>
                                <td><input type="date" id="endDate" name="endDate"></td>
                                <td>
                                    <select id="endTime" name="endTime">
                                        <option value="00:00">00:00</option>
                                        <option value="00:30">00:30</option>
                                        <option value="01:00">01:00</option>
                                        <option value="01:30">01:30</option>
                                        <option value="02:00">02:00</option>
                                        <option value="02:30">02:30</option>
                                        <option value="03:00">03:00</option>
                                        <option value="03:30">03:30</option>
                                        <option value="04:00">04:00</option>
                                        <option value="04:30">04:30</option>
                                        <option value="05:00">05:00</option>
                                        <option value="05:30">05:30</option>
                                        <option value="06:00">06:00</option>
                                        <option value="06:30">06:30</option>
                                        <option value="07:00">07:00</option>
                                        <option value="07:30">07:30</option>
                                        <option value="08:00">08:00</option>
                                        <option value="08:30">08:30</option>
                                        <option value="09:00">09:00</option>
                                        <option value="09:30">09:30</option>
                                        <option value="10:00">10:00</option>
                                        <option value="10:30">10:30</option>
                                        <option value="11:00">11:00</option>
                                        <option value="11:30">11:30</option>
                                        <option value="12:00">12:00</option>
                                        <option value="12:30">12:30</option>
                                        <option value="13:00">13:00</option>
                                        <option value="13:30">13:30</option>
                                        <option value="14:00">14:00</option>
                                        <option value="14:30">14:30</option>
                                        <option value="15:00">15:00</option>
                                        <option value="15:30">15:30</option>
                                        <option value="16:00">16:00</option>
                                        <option value="16:30">16:30</option>
                                        <option value="17:00">17:00</option>
                                        <option value="17:30">17:30</option>
                                        <option value="18:00">18:00</option>
                                        <option value="18:30">18:30</option>
                                        <option value="19:00">19:00</option>
                                        <option value="19:30">19:30</option>
                                        <option value="20:00">20:00</option>
                                        <option value="20:30">20:30</option>
                                        <option value="21:00">21:00</option>
                                        <option value="21:30">21:30</option>
                                        <option value="22:00">22:00</option>
                                        <option value="22:30">22:30</option>
                                        <option value="23:00">23:00</option>
                                        <option value="23:30">23:30</option>
                                        <option value="24:00">24:00</option>
                                    </select>

                                </td>
                                <td></td>
                            </tr>
                            <tr>
                                <th>일정제목</th>
                                <td colspan="3">
                                    <input type="text" id="scTitle" name="scTitle"/>
                                </td>
                            </tr>
                            <tr>
                                <th>일정내용</th>
                                <td colspan="3">
                                    <textarea id="scContent" name="scContent"
                                            style="width:100%;height:200px;resize: none;"></textarea>
                                </td>
                            </tr>
                        </table>

                        <div class="modal-footer" style="border:none;">
                            <button type="button" class="btn btn-primary btn-sm" onClick="AddScheduleModal();" data-dismiss="modal">저장</button>
                            <button type="button" class="btn btn-secondary btn-sm" data-dismiss="modal">취소</button>
                        </div>
                        
                    </form>
                </div>

            </div>
        </div>
    </div>

    <!-- 내 캘린더 추가 모달-->
    <div class="modal" id="AddCalendarModal">
        <div class="modal-dialog">
            <div class="modal-content">

                <div class="modal-body">
                    <span style="font-size:20px; font-weight:600;">캘린더 추가</span>
                    <br><br>
                    <form action="">
                        <table style="width:100%; border-spacing: 10px; border-collapse: separate;">
                            <colgroup>
                                <col style="width:30%;"/>
                                <col style="width:70%;"/>
                            </colgroup>
                            <tr>
                                <th style="text-align:center">내 캘린더 이름</th>
                                <td><input type="text" id="myCalendar" name="myCalendar" style="width:87%;">
                                </td>
                            </tr>
                            <tr>
                                <th style="text-align:center">내 캘린더 색상</th>
                                <td>
                                    <div class="mycalenderCheckbox">
                                        <input type="checkbox" name="scColor" value="rgb(255, 206, 214)" id="pink" onclick="checkOnlyOne(this);">
                                        <label for="pink" class="check-label"></label>
                                        <input type="checkbox" name="scColor" value="rgb(255, 50, 50)" id="red" onclick="checkOnlyOne(this);">
                                        <label for="red" class="check-label"></label>
                                        <input type="checkbox" name="scColor" value="rgb(255, 177, 33)" id="orange" onclick="checkOnlyOne(this);">
                                        <label for="orange" class="check-label"></label>
                                        <input type="checkbox" name="scColor" value="rgb(255, 243, 21)" id="yellow" onclick="checkOnlyOne(this);">
                                        <label for="yellow" class="check-label"></label>
                                        <input type="checkbox" name="scColor" value="rgb(184, 235, 82)" id="lightgreen" onclick="checkOnlyOne(this);">
                                        <label for="lightgreen" class="check-label"></label>
                                        <input type="checkbox" name="scColor" value="rgb(38, 189, 38)" id="green" onclick="checkOnlyOne(this);">
                                        <label for="green" class="check-label"></label>
                                        <input type="checkbox" name="scColor" value="rgb(186, 230, 245)" id="lightblue" onclick="checkOnlyOne(this);">
                                        <label for="lightblue" class="check-label"></label>
                                        <input type="checkbox" name="scColor" value="rgb(30, 66, 248)" id="blue" onclick="checkOnlyOne(this);">
                                        <label for="blue" class="check-label"></label>
                                        <input type="checkbox" name="scColor" value="rgb(206, 101, 229)" id="purple" onclick="checkOnlyOne(this);">
                                        <label for="purple" class="check-label"></label>
                                        <input type="checkbox" name="scColor" value="rgb(77, 76, 76)" id="black" onclick="checkOnlyOne(this);">
                                        <label for="black" class="check-label"></label>
                                    </div>
                                </td>
                            </tr>
                        </table>

                        <div class="modal-footer" style="border:none;">
                            <button type="button" class="btn btn-primary btn-sm" onClick="AddCalendarModal();" data-dismiss="modal">저장</button>
                            <button type="button" class="btn btn-secondary btn-sm" data-dismiss="modal">취소</button>
                        </div>

                    </form>

                    <script>
                        // 캘린더 추가 체크박스
                        // 컬러
                        $(function(){
                            const label = document.querySelectorAll("label");
                            
                            label.forEach(function(lb){
                                // lb.style.background = lb.getAttribute("for");
                                lb.style.background = document.getElementById(lb.getAttribute("for")).value;
                                //console.log(lb);
                            })
                        })
                        
                        // 체크 한개만 / 선택표시
                        function checkOnlyOne(element) {
                            const checkbox = document.getElementsByName("scColor");
                            const label = document.querySelectorAll("label");
                            
                            checkbox.forEach(function(cb){
                                cb.checked = false;
                                
                            })

                            label.forEach(function(lb){
                                lb.innerText = "";
                            })
                            
                            element.checked = true;
                            element.nextElementSibling.innerHTML = "<div class='ck'></div>";
                        }

                    </script>

                </div>

            </div>
        </div>
    </div>

    <!-- 내 캘린더 수정/삭제 모달 -->
    <div class="modal" id="ModifymyCalendarModal">
        <div class="modal-dialog">
            <div class="modal-content">

                <div class="modal-body" id="mod-myCalendar">
                    <span style="font-size:20px; font-weight:600;">캘린더 수정</span>
                    <br><br>
                    
                        <table style="width:100%; border-spacing: 10px; border-collapse: separate;">
                            <colgroup>
                                <col style="width:30%;"/>
                                <col style="width:70%;"/>
                            </colgroup>
                            <tr>
                                <th style="text-align:center">내 캘린더 이름</th>
                                <td><input type="text" id="myCalendarTitle" name="myCalendar" value="" style="width:87%;">
                                </td>
                            </tr>
                            <tr>
                                <th style="text-align:center">내 캘린더 색상</th>
                                <td>
                                    <div class="mycalenderCheckbox">
                                        <label for="pink" class="check-label">
                                        <input type="checkbox" name="scColor" value="rgb(255, 206, 214)" id="pink" class="scColor" onclick="checkOnlyOne(this);">
                                        </label>
                                        <label for="red" class="check-label">
                                        <input type="checkbox" name="scColor" value="rgb(255, 50, 50)" id="red" class="scColor" onclick="checkOnlyOne(this);">
                                        </label>
                                        <label for="orange" class="check-label">
                                        <input type="checkbox" name="scColor" value="rgb(255, 177, 33)" id="orange" class="scColor" onclick="checkOnlyOne(this);">
                                        </label>
                                        <label for="yellow" class="check-label">
                                        <input type="checkbox" name="scColor" value="rgb(255, 243, 21)" id="yellow" class="scColor" onclick="checkOnlyOne(this);">
                                        </label>
                                        <label for="lightgreen" class="check-label">
                                        <input type="checkbox" name="scColor" value="rgb(184, 235, 82)" id="lightgreen" class="scColor" onclick="checkOnlyOne(this);">
                                        </label>
                                        <label for="green" class="check-label">
                                        <input type="checkbox" name="scColor" value="rgb(38, 189, 38)" id="green" class="scColor" onclick="checkOnlyOne(this);">
                                        </label>
                                        <label for="lightblue" class="check-label">
                                        <input type="checkbox" name="scColor" value="rgb(186, 230, 245)" id="lightblue" class="scColor" onclick="checkOnlyOne(this);">
                                        </label>
                                        <label for="blue" class="check-label">
                                        <input type="checkbox" name="scColor" value="rgb(30, 66, 248)" id="blue" class="scColor" onclick="checkOnlyOne(this);">
                                        </label>
                                        <label for="purple" class="check-label">
                                        <input type="checkbox" name="scColor" value="rgb(206, 101, 229)" id="purple" class="scColor" onclick="checkOnlyOne(this);">
                                        </label>
                                        <label for="black" class="check-label">
                                        <input type="checkbox" name="scColor" value="rgb(77, 76, 76)" id="black" class="scColor" onclick="checkOnlyOne(this);">
                                        </label>
                                    </div>
                                </td>
                            </tr>
                        </table>

                        <div class="modal-footer" style="border:none;">
                            <button type="button" class="btn btn-primary btn-sm" onClick="calendarModalupdate();" data-dismiss="modal">수정</button>
                            <button type="button" class="btn btn-primary btn-sm" onClick="calendarModaldelete();" data-dismiss="modal" >삭제</button>
                            <button type="button" class="btn btn-secondary btn-sm" onClick="calendarCloseModalBtn();"data-dismiss="modal" >취소</button>
                        </div>

                    <script>
                    
                    let scColorCheckboxModal = '';
                    
                        // 캘린더 추가 체크박스
                        // 컬러
                        $(function(){
                            const label = document.querySelectorAll("label");
                            
                            label.forEach(function(lb){
                                // lb.style.background = lb.getAttribute("for");
                                lb.style.background = document.getElementById(lb.getAttribute("for")).value;
                                //console.log(lb);
                            })
                        })
                        
                        // 체크 한개만 / 선택표시
                        function checkOnlyOne(element) {
                        	scColorCheckboxModal = element.value;
                            const checkbox = document.getElementsByName("scColor");
                            const label = document.querySelectorAll("label");
                            
                            checkbox.forEach(function(cb){
                                cb.checked = false;
                                
                            })

                            label.forEach(function(lb){
                                lb.innerText = "";
                            })
                            
                            element.checked = true;
                            element.nextElementSibling.innerHTML = "<div class='ck'></div>";
                        }

                    </script>
                    
                </div>
            </div>
        </div>
    </div>

<!-------------------------------------- 스크립트 ----------------------------------------->
<script>
    
    let selectCalendarNoModal = ''; // 내 캘린더 수정

    

    // 새 일정 추가 스크립트 
    function AddScheduleModal() {
        let calendarNo = document.querySelector("#calendarNo").value
        let startDate = document.querySelector("#startDate").value
        let startTime = document.querySelector("#startTime").value
        let endDate = document.querySelector("#endDate").value
        let endTime = document.querySelector("#endTime").value
        let allday = document.querySelector("#allday").value
        let scTitle = document.querySelector("#scTitle").value
        let scContent = document.querySelector("#scContent").value

        if (startDate.length == 0) {
            alert("시작날짜를 입력해 주세요");
            return false;
        }
        if (endDate.length == 0) {
            alert("종료날짜를 입력해 주세요");
            return false;
        }
        if (scTitle.length == 0) {
            alert("제목을 입력해 주세요");
            return false;
        }
        if (scContent.length == 0) {
            alert("내용을 입력해 주세요");
            return false;
        }

        const reqData = {
            calendarNo: calendarNo,
            startDate: startDate,
            startTime: startTime,
            endDate: endDate,
            endTime: endTime,
            allday: allday,
            scTitle: scTitle,
            scContent: scContent
        }

        // console.log(reqData);

        $.ajax({
            url: "addScheduleModal.sc",
            data: reqData,
            success: function (resData) {
                //console.log(resData)

                if (resData == "success") {
                    alert("새 일정을 등록했습니다.")  ;
                } else {
                    alert("새 일정등록을 실패했습니다.");
                }
            },
            error: function () {
                 console.log("일정 등록 실패");
            }

        })

    }

    // 종일
    $(document).ready(function(){
        $("#allday").click(function() {

            if(this.checked) {
                $("#startTime").prop("disabled", true);
                $("#endTime").prop("disabled", true);
            } else {
                $("#startTime").prop("disabled", false);
                $("#endTime").prop("disabled", false);
            }

        })

    });

    // 내 캘린더 추가 
    function AddCalendarModal() {
        // console.log("내 캘린더 추가")
        const myCalendar = document.querySelector("#myCalendar").value
        const scColor = $('input[name=scColor]:checked').val();
        
        if (myCalendar == undefined || myCalendar == null || myCalendar == '') {
            alert("내 캘린더 이름을 입력해주세요.")
            return false;
        }

        if (scColor == undefined || scColor == null || scColor == '') {
            alert("내 캘린더 색상을 선택해 주세요.")
            return false;
        }
        
        const reqData = {
            scColor: scColor,
            myCalendar: myCalendar
        }

        // console.log(reqData);

        $.ajax({
            url: "addCalendarModal.sc",
            data: reqData,
            success: function (resData) {
                // console.log(resData)
                if (resData == "success") {
                    $("#myCalendars").empty();
                    calendarList();
                    $("#AddCalendarModal input").val("");
                    $("#AddCalendarModal input[type=checkbox]").each(function(){
                        $(this).prop("checked", false);
                        $(".ck").removeClass("ck");
                    })
                    alert("내 캘린더를 추가했습니다.");
                } else {
                    alert("내 캘린더 추가를 실패했습니다.");
                }
            },
            error: function () {
                console.log("내 캘린더 추가 실패");
            }

        })

    }

    // 내 캘린더 목록 / 일정 추가 카테고리
    function calendarList() {
        //console.log("calendarList")
        $.ajax({
            url: "calendarList.sc",
            data: {},
            success: function (resData) {
                // console.log(resData[i].scColor)
                //console.log(resData.length)
                let html = '';
                let html2 = '';
                if (resData.length == 0) {
                //     html += '<input type="checkbox"><span>&nbsp;&nbsp;&nbsp;' + "내 일정" + '</span>';
                } else {
                    
                    for (let i = 0; i < resData.length; i++) {
                        //console.log(resData[i].scColor)
                        html += '<div class="cName"><input type="checkbox" id="cScColor" name="scColor" class="scColor" style="background:' + resData[i].scColor + '">'
                             + '&nbsp;&nbsp;&nbsp;' + resData[i].myCalendar + '</div>'
                             + '<button type="button" style="background-color:transparent; border:none;" data-toggle="modal" data-target="#ModifymyCalendarModal" onclick="ModifymyCalendarModal('+ resData[i].calendarNo +');"><img id="modifyImg" src="resources/images/modification.png" style="width:17px; height:17px;"></button><br>';
                        html2 += '<option value="' + resData[i].calendarNo + '">' + resData[i].myCalendar + '</option>'
                        }
                        //console.log(resData[i].myCalendar);

                    $("#myCalendars").append(html);
                    $("#calendarNo").html(html2);
                    $("#dragCalendarNo").html(html2);
                    $("#cccc").html(html2);

                    



                    // if($("input:checkbox[id='cScColor']").prop("checked", true)) {
                    //     $(this).css({
                    //         background: 'black',
                    //         border: '1px solid green'
                    //     });
                        
                    // }

                    
                }
            },
            error: function () {
                console.log("내 캘린더목록");
            }
        });

    }

    // 내 캘린더 수정 모달 화면
    function ModifymyCalendarModal(calendarNo) {
        
        let html = '';
        selectCalendarNoModal = calendarNo;
        const reqData = {
            calendarNo : calendarNo,
            //myCalendar : myCalenderTitle,
            //scColor : scColorCheckboxModal
        }
        
        //console.log(reqData)

        $.ajax({
            url: "selectCalendar.sc",
            data: reqData,
            success: function (resData) {

                //console.log(resData)
    
                $('input[name=myCalendar]').attr("value", resData.myCalendar);

                //$(":checkbox[name='scColor'][value='" + resData.scColor + "']").attr('checked', true);
                
                $(":checkbox[name='scColor'][value='" + resData.scColor + "']").attr('checked', true).after("<div class='ck'></div>");




            },
            error: function () {
                //console.log("내 캘린더목록");
            }
        });
    }

    // 내 캘린더 모달 취소 버튼
    function calendarCloseModalBtn() {
        $("#ModifymyCalendarModal input[type=checkbox]").each(function(){
            $(this).prop("checked", false);
            $(".ck").removeClass("ck");
        })

    }

    // 내 캘린더 수정 
    function calendarModalupdate() {
        let title = document.querySelector("#myCalendarTitle").value;
        let color = $("input[name='scColor']:checked").val();
        
        if (title == undefined || title == null || title == '') {
            alert("내 캘린더 이름을 입력해주세요.")
            return false;
        }

        if (color == undefined || color == null || color == '') {
            alert("내 캘린더 색상을 선택해 주세요.")
            return false;
        }
        
        const reqData = {
            calendarNo : selectCalendarNoModal,
            myCalendar : title,
            scColor : color
        }

        console.log(reqData)

        
        $.ajax({
            url: "updateCalendar.sc",
            data: reqData,
            success: function (resData) {
                //console.log(resData)
                if (resData == "success") {
                    alert("내 캘린더를 수정했습니다.");
                    $("#myCalendars").empty();
                    calendarList();
                } else {
                    alert("수정실패");
                }
            },
            error: function () {
                console.log("내 캘린더 수정 실패");
            }
        });
        
    }

    // 내캘린더 삭제
    function calendarModaldelete() {
        let title = document.querySelector("#myCalendarTitle").value;
        let color = $("input[name='scColor']:checked").val();
        
        if (title == undefined || title == null || title == '') {
            alert("내 캘린더 이름을 입력해주세요.")
            return false;
        }

        if (color == undefined || color == null || color == '') {
            alert("내 캘린더 색상을 선택해 주세요.")
            return false;
        }
        
        const reqData = {
            calendarNo : selectCalendarNoModal,
            myCalendar : title,
            scColor : color
        }

        //console.log(reqData)

        
        $.ajax({
            url: "deleteCalendar.sc",
            data: reqData,
            success: function (resData) {
                console.log(resData)
                if (resData == "success") {
                    alert("내 캘린더를 삭제했습니다.");
                    $("#myCalendars").empty();
                    calendarList();
                } else {
                    alert("삭제실패");
                }
            },
            error: function () {
                console.log("내 캘린더 삭제 실패");
            }
        });
        
    }
    
    

</script>



</body>
</html>