<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    /* 캘린더 전체 */
    #calendar {width:100%; height: 600px;}

    /* 캘린더 상단 */
    /* 화살표 왼 */
    .fc .fc-button .fc-icon {
        color: black;
    }

    .fc .fc-button .fc-icon:hover {
        color: white;
    }

    .fc-direction-ltr .fc-button-group > .fc-button:not(:last-child) {
        border: none;
        background-color: transparent;
    }

    .fc-direction-ltr .fc-button-group > .fc-button:not(:last-child):hover {
        background-color: rgb(255, 205, 214);
    }

    /* 화살표 오 */
    .fc-icon-chevron-right:before {
        color: black;
    }

    .fc-icon-chevron-right:before:hover {
        color: white;
    }

    .fc-direction-ltr .fc-button-group > .fc-button:not(:first-child) {
        border: none;
        background-color: transparent;
    }

    .fc-direction-ltr .fc-button-group > .fc-button:not(:first-child):hover {
        background-color: rgb(255, 205, 214);
    }

    /* today버튼 */
    .fc-direction-ltr .fc-toolbar > * > :not(:first-child) {
        color: black;
        font-weight: 700;
    }

    .fc-direction-ltr .fc-toolbar > * > :not(:first-child) {
        border: none;
        background-color: transparent;
    }

    .fc-direction-ltr .fc-toolbar > * > :not(:first-child):hover {
        background-color: rgb(255, 205, 214);
        color: white;
    }

    /* month, week, day버튼 */
    .fc-direction-ltr .fc-button-group > .fc-button:not(:last-child) {
        color: black;
        font-weight: 700;
    }

    .fc-direction-ltr .fc-button-group > .fc-button:not(:first-child) {
        color: black;
        font-weight: 700;
    }

    .fc-direction-ltr .fc-button-group > .fc-button:not(:first-child):hover {
        background-color: rgb(255, 205, 214);
        color: white;
    }

    .fc-direction-ltr .fc-button-group > .fc-button:not(:last-child):hover {
        background-color: rgb(255, 205, 214);
        color: white;
    }

    /* 타이틀 잘림방지 */
    .fc-event-title.fc-sticky{
        white-space: normal;
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
                <div id='calendar'></div>
            </div>

            <!-- FullCalendar -->
            <script>
                $(function () {
                    calendarList();
                });
            
                document.addEventListener('DOMContentLoaded',function () {
                    var calendarEl = document.getElementById('calendar');
                    let html = '';
            
                    var calendar = new FullCalendar.Calendar(
                        calendarEl,
                        {
                            headerToolbar: {
                                left: 'prev,next today',
                                center: 'title',
                                right: 'dayGridMonth,timeGridWeek,timeGridDay'
                            },
                            initialDate: '2023-03-29',
                            navLinks: true, // can click day/week names to navig0ate views
                            selectable: true,
                            selectMirror: true,
                            // 이벤트명 : function(){} : 각 날짜에 대한 이벤트를 통해 처리할 내용..
                            select: function (arg) {

                                insertModalOpen(arg);	// 일자 클릭시 일정 추가 모달 호출

                            },
                            initialDate: '2023-03-20', // 처음 보여주는 캘린더 화면의 날짜
                            editable: true,
                            selectable: true,
                            businessHours: true,
                            dayMaxEvents: true, // 일정이 많으면 + more
                            events: function(info, successCallback, failureCallback) { // 캘린더 화면에 뿌리기
                                $.ajax({
                                    url: 'scheduleList.sc',
                                    type: 'POST',
                                    success: function(param) {  

                                        //console.log(param);
                                        //let birthday = new Date(2023,12-1,12);
                                        //console.log(birthday);

                                        var events = [];                     
                                        $.each(param, function(index, data){
                                            //console.log(data.endDate);

                                            let endDate = data.endDate;
                                            let year = endDate.substring(0,4);
                                            let month = endDate.substring(5,7) -1;
                                            let date = endDate.substring(8,10);

                                            // console.log(endDate);
                                            // console.log(year);
                                            // console.log(month);
                                            // console.log(date);
                
                                            let cDate = new Date(year, month, date);

                                            //console.log(cDate);

                                            function dateFormat(ddate) {
                                                let dateFormat = ddate.getFullYear() + '-' + ( (ddate.getMonth()+1) < 9 ? "0" + (ddate.getMonth()+1) : (ddate.getMonth()+1) ) 
                                                + '-' + ((ddate.getDate())<9 ? "0" + (ddate.getDate()+1) : (ddate.getDate()+1));
                                                return dateFormat;
                                            }

                                            let endDate2 = dateFormat(new Date(cDate));
                                            //cDate.setDate(cDate.getDate()+1)

                                            //console.log(endDate2);

                                            // let changeDate = cDate.getYear() + "-" + cDate.getMonth() + "-" + cDate.getDate();
                                            // console.log(cDate);
                                            // console.log(changeDate);
                                         
                                            events.push({
                                                
                                                title : data.scTitle,
                                                start : data.startDate,
                                                end: endDate2,
                                                color: data.scColor,
                                                scheduleNo : data.scheduleNo,
                                                
                                                })
                                            
                                                
                                        }) 
                                        
                                        successCallback(events);
                                    }
                                }) 
                                
                            },

                            eventClick: function (arg) {

                                detailModal(arg); // 일정 클릭시 상세보기 모달 호출
                                
                            },

                        });
            
                    calendar.render();
                });
                
                
            
            </script>
        </div>
    </div>

    <!------------------------------------------------ 모달 -------------------------------------------->

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

    <!-- 드래그시 새 일정 모달  -->
    <div class="modal" id="DragAddScheduleModal">
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
                                    <select name="calendarNo" id="dragCalendarNo">
                                        <!-- <option value="1">프로젝트</option>
                                        <option value="2">프로젝트1</option>
                                        <option value="3">프로젝트2</option> -->
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <th>일정시작</th>
                                <td><input type="date" id="dragStartDate" name="startDate" value=""></td>
                                <td>
                                    <select id="dragStartTime" name="startTime">
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
                                    <input type="checkbox" id="dragallday" name="allday" value="Y"
                                        style="width:17px; height:17px; margin-top:10px;">
                                    <span style="position:absolute; top:6px; right:25px;">종일</span>
                                </td>
                            </tr>
                            <tr>
                                <th>일정종료</th>
                                <td><input type="date" id="dragEndDate" name="endDate"></td>
                                <td>
                                    <select id="dragEndTime" name="endTime">
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
                                    <input type="text" id="dragScTitle" name="scTitle"/>
                                </td>
                            </tr>
                            <tr>
                                <th>일정내용</th>
                                <td colspan="3">
                                    <textarea id="dragScContent" name="scContent"
                                            style="width:100%;height:200px;resize: none;"></textarea>
                                </td>
                            </tr>
                        </table>

                        <div class="modal-footer" style="border:none;">
                            <button type="button" class="btn btn-primary btn-sm" onClick="DragAddScheduleModal();" data-dismiss="modal">저장</button>
                            <button type="button" class="btn btn-secondary btn-sm" onclick="dragCloseModalBtn();" data-dismiss="modal">취소</button>
                        </div>
                        
                    </form>
                </div>

            </div>
        </div>
    </div>

    <!-- 일정 클릭시 상세보기 모달 -->
    <div class="modal" id="DetailScheduleModal">
        <div class="modal-dialog">
            <div class="modal-content">

                <!-- Modal body -->
                <div class="modal-body">
                    <span style="font-size:20px; font-weight:600;">상세보기</span>
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
                                    <div class="mycalenderCheckbox">
                                        <!-- <input type="checkbox" name="scColor" value="pink" id="pink" class="scColor">
                                        <label for="pink" class="check-label"></label> -->
                                        <div style="width:17px; height:17px; background: black; border-radius:5px; display:inline-block;" id="scColorBox"></div>
                                        <span id="xxx" readonly>&nbsp;&nbsp;캘린더 이름~~~</span>
                                    </div>
                                    
                                </td>
                            </tr>
                            <tr>
                                <th>일정시작</th>
                                <td><input type="date" id="clickStartDate" name="startDate" value="" readonly></td>
                                <td>
                                    <select id="clickStartTime" name="startTime" readonly>
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
                                    <input type="checkbox" id="clickallday" name="allday" value="Y"
                                        style="width:17px; height:17px; margin-top:10px;" disabled>
                                    <span style="position:absolute; top:6px; right:25px;">종일</span>
                                </td>
                            </tr>
                            <tr>
                                <th>일정종료</th>
                                <td><input type="date" id="clickEndDate" name="endDate" readonly></td>
                                <td>
                                    <select id="clickEndTime" name="endTime">
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
                                    <input type="text" id="clickScTitle" name="scTitle" value="" readonly />
                                </td>
                            </tr>
                            <tr>
                                <th>일정내용</th>
                                <td colspan="3">
                                    <textarea id="clickScContent" name="scContent"
                                            style="width:100%;height:200px;resize: none;" readonly></textarea>
                                </td>
                            </tr>
                        </table>

                        <div class="modal-footer" style="border:none;">
                            <button type="button" class="btn btn-primary btn-sm" id="qwer" data-toggle="modal" data-target="#ModifySchedulModal">수정</button> <!-- 수정 -->
                            <button type="button" class="btn btn-primary btn-sm" onClick="deleteScheduleModal();">삭제</button> <!-- 삭제 -->
                            <button type="button" class="btn btn-secondary btn-sm" onclick="DetailCloseModalBtn();" data-dismiss="modal">확인</button>
                        </div>
                        
                    </form>
                </div>

            </div>
        </div>
    </div>

    <!-- 일정 수정하기 모달 -->
    <div class="modal" id="ModifySchedulModal">
        <div class="modal-dialog">
            <div class="modal-content">

                <!-- Modal body -->
                <div class="modal-body">
                    <span style="font-size:20px; font-weight:600;">수정하기</span>
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
                                    <select name="calendarNo" id="cccc">
                                        <!-- <option value="1">프로젝트</option>
                                        <option value="2">프로젝트1</option>
                                        <option value="3">프로젝트2</option> -->
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <th>일정시작</th>
                                <td><input type="date" id="modifyStartDate" name="startDate" value=""></td>
                                <td>
                                    <select id="modifyStartTime" name="startTime">
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
                                    <input type="checkbox" id="modifyallday" name="allday" value="Y"
                                        style="width:17px; height:17px; margin-top:10px;">
                                    <span style="position:absolute; top:6px; right:25px;">종일</span>
                                </td>
                            </tr>
                            <tr>
                                <th>일정종료</th>
                                <td><input type="date" id="modifyEndDate" name="endDate"></td>
                                <td>
                                    <select id="modifyEndTime" name="endTime">
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
                                    <input type="text" id="modifyScTitle" name="scTitle"/>
                                </td>
                            </tr>
                            <tr>
                                <th>일정내용</th>
                                <td colspan="3">
                                    <textarea id="modifyScContent" name="scContent"
                                            style="width:100%;height:200px;resize: none;"></textarea>
                                </td>
                            </tr>
                        </table>

                        <div class="modal-footer" style="border:none;">
                            <button type="button" class="btn btn-primary btn-sm" onclick="modifyAddScheduleModal();" data-dismiss="modal">수정</button> 
                            <button type="button" class="btn btn-secondary btn-sm" onclick="DetailCloseModalBtn();" data-dismiss="modal">취소</button>
                        </div>
                        
                    </form>
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
        
        // 드래그시 새 일정 모달 오픈                                    
        function insertModalOpen(arg) {
        	
            //console.log("드래그시 새 일정 모달오픈");
            //console.log(arg);
            //console.log(arg.startStr);
            //console.log(arg.endStr);
            // 모달 버튼에 이벤트를 검
            $('#DragAddScheduleModal').modal('show');

            // var endStr = arg.endStr;
            // console.log(endStr);
            // var arr = endStr.split('-');
            // console.log(arr);
            // var endDate = new Date(arr[0], arr[1], arr[2]);
            // document.write(endDate.getFullYear() + "-" + endDate.getMonth() + "-" + endDate.getDate()-1 );
            
             
            // endStr = new Date(endStr);
            // endStr.setDate(endStr.getDate()-1);

            $('input[name=startDate]').attr("value", arg.startStr);
            $('input[name=endDate]').attr("value", arg.endStr);

            $("#dragallday").click(function() {
                
                if(this.checked) {
                    
                    $("#dragStartTime").prop("disabled", true);
                    $("#dragEndTime").prop("disabled", true);
                } else {
                    
                    $("#dragStartTime").prop("disabled", false);
                    $("#dragEndTime").prop("disabled", false);
                }

            })
            
        }

        // 드래그시 새 일정 추가 
        function DragAddScheduleModal() {
            
            let calendarNo = document.querySelector("#dragCalendarNo").value
	        let startDate = document.querySelector("#dragStartDate").value
	        let startTime = document.querySelector("#dragStartTime").value
	        let endDate = document.querySelector("#dragEndDate").value
	        let endTime = document.querySelector("#dragEndTime").value
	        let allday = document.querySelector("#dragallday").value
	        let scTitle = document.querySelector("#dragScTitle").value
	        let scContent = document.querySelector("#dragScContent").value
            
            console.log(calendarNo);
            console.log(startDate);
            console.log(startTime);
            console.log(endDate);
            console.log(endTime);
            console.log(allday);
            console.log(scTitle);
            console.log(scContent);



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
	
	        console.log(reqData);
	
	        $.ajax({
	            url: "addScheduleModal.sc",
	            data: reqData,
	            success: function (resData) {
	                //console.log(resData)
	
	                if (resData == "success") {
	                    alert("새 일정을 등록했습니다.");
                        closeModalBtn();

                        document.getElementById('dragScContent').value = '';
                        document.getElementById('dragScTitle').value = '';
                        
	                } else {
	                    alert("새 일정등록을 실패했습니다.");
	                }
	            },
	            error: function () {
	                 console.log("일정 등록 실패");
	            }
	
	        })

    	}

        // 드래그시 모달 안의 취소 버튼
        function dragCloseModalBtn() {
            $('#DragAddScheduleModal').modal('hide');
        }
        
        let efef; // scheduleNo
        let fdfd; // calendarNo
        // 일정 클릭시 상세보기 모달 오픈
        function detailModal(arg) {
            $('#DetailScheduleModal').modal('show');

            //console.log(arg);
            //console.log(arg.event.extendedProps.scheduleNo);

            const calendarNo = arg.event.extendedProps.calendarNo;
            const scheduleNo = arg.event.extendedProps.scheduleNo;
        
            fdfd = calendarNo;
            efef = scheduleNo;
            //console.log(scheduleNo);

            $.ajax({
	            url: "detailScheduleModal.sc",
	            data: {scheduleNo},
	            success: function (resData) {
	                //console.log(resData);
                    //console.log(resData[i].scColor);
                    //console.log(resData[0].scColor);
                    //console.log(resData[i].startTime);

                    // 색상
                    $('#scColorBox').css("background", resData[0].scColor);

                    // 캘린더 이름
                    $('.mycalenderCheckbox span').html(resData[0].myCalendar);
                    
                    // 제목
                    $('#clickScTitle').attr("value", resData[0].scTitle);

                    // 내용
                    $('#clickScContent').html(resData[0].scContent);

                    $('#clickStartDate').attr("value", resData[0].startDate); // 시작날짜
                    $('#clickEndDate').attr("value", resData[0].endDate);   // 날짜종료 

                    // 시작시간
                    $(function(){
                        let box = document.getElementById('clickStartTime');
                        let startTime = resData[0].startTime;
                        //console.log(box);
                        //console.log(startTime);
                        for(let i=0; i<box.length; i++) {
                            if(box[i].value == startTime) {
                                box[i].selected = true;
                            } 
                        }
                        $("#clickStartTime").attr('onFocus', 'this.initialSelect = this.selectedIndex;');
                        $("#clickStartTime").attr('onChange', 'this.selectedIndex = this.initialSelect;');
                    }); 

                    // 종료시간
                    $(function(){
                        let box2 = document.getElementById('clickEndTime');
                        let endTime = resData[0].endTime;
                        //console.log(box2);
                        //console.log(endTime);
                        for(let i=0; i<box2.length; i++) {
                            if(box2[i].value == endTime) {
                                box2[i].selected = true;
                            } 
                        }
                        $("#clickEndTime").attr('onFocus', 'this.initialSelect = this.selectedIndex;');
                        $("#clickEndTime").attr('onChange', 'this.selectedIndex = this.initialSelect;');
                    }); 

                   
                    //종일 
                    $(function(){
                        if($('#clickEndTime').val() == '00:00' && $('#clickStartTime').val() == '00:00') {
                            $("input:checkbox[id='clickallday']").prop("checked", true);
                            $("#clickStartTime").prop("disabled", true);
                            $("#clickEndTime").prop("disabled", true);
                        } else {
                            $("input:checkbox[id='clickallday']").prop("checked", false);
                            $("#clickStartTime").prop("disabled", false);
                            $("#clickEndTime").prop("disabled", false);
                        }
                        
                    }); 

                    $("input:checkbox[id='clickallday']").click(function(){
                        if($("input:checkbox[id='clickallday']").is(":checked")) {
                            $('#clickStartTime').val("00:00");
                            $('#clickEndTime').val("00:00");
                            $("#clickStartTime").prop("disabled", true);
                            $("#clickEndTime").prop("disabled", true);
                        } else {
                            $("#clickStartTime").prop("disabled", false);
                            $("#clickEndTime").prop("disabled", false);
                        }
                    });
	            },
	            error: function () {
	                 console.log("상세 조회 실패");
	            }
	
	        })


            
        }

        // 일정 클릭시 모달 안의 취소 버튼
        function DetailCloseModalBtn() {
            $("input:checkbox[id='clickallday']").prop("checked", false);
            $('#DetailScheduleModal').modal('hide');

        }

        // 상세보기 모달 수정버튼 클릭시 수정 모달 오픈
        document.querySelector("#qwer").addEventListener("click",function(){
            DetailCloseModalBtn()   // 이중모달은 사용하면 안됨 input텍스트 안써짐

            // 캘린더 이름
            $(function(){
                for(let i=0; i < document.querySelector("#cccc").length; i++) {
                    if(document.querySelector("#cccc")[i].text == document.querySelector("#xxx").textContent) {
                        document.querySelector("#cccc")[i].selected = document.querySelector("#xxx").textContent
                    } 
                }
            }); 

            // 제목/내용
            document.querySelector("#modifyScTitle").setAttribute('value', document.querySelector("#clickScTitle").value);
            document.querySelector("#modifyScContent").value = document.querySelector("#clickScContent").value;


            // 날짜
            document.querySelector("#modifyStartDate").value = document.querySelector("#clickStartDate").value;
            document.querySelector("#modifyEndDate").value = document.querySelector("#clickEndDate").value;

            // 시작시간
            $(function(){
                let box = document.getElementById('modifyStartTime');
                let startTime = document.querySelector("#clickStartTime").value;
                for(let i=0; i<box.length; i++) {
                    if(box[i].value == startTime) {
                        box[i].selected = true;
                    } 
                }
            }); 
            // 종료시간
            $(function(){
                let box2 = document.getElementById('modifyEndTime');
                let endTime = document.querySelector("#clickEndTime").value;
                for(let i=0; i<box2.length; i++) {
                    if(box2[i].value == endTime) {
                        box2[i].selected = true;
                    } 

                }
            }); 

            
            //종일 
            $(function(){
                if($('#modifyEndTime').val() == '00:00' && $('#modifyStartTime').val() == '00:00') {
                    $("input:checkbox[id='modifyallday']").prop("checked", true);
                    $("#modifyStartTime").prop("disabled", true);
                    $("#modifyEndTime").prop("disabled", true);
                } else {
                    $("input:checkbox[id='modifyallday']").prop("checked", false);
                    $("#modifyStartTime").prop("disabled", false);
                    $("#modifyEndTime").prop("disabled", false);
                }

                
            }); 

            $("input:checkbox[id='modifyallday']").click(function(){
                if($("input:checkbox[id='modifyallday']").is(":checked")) {
                    $('#modifyStartTime').val("00:00");
                    $('#modifyEndTime').val("00:00");
                    $("#modifyStartTime").prop("disabled", true);
                    $("#modifyEndTime").prop("disabled", true);
                } else {
                    $("#modifyStartTime").prop("disabled", false);
                    $("#modifyEndTime").prop("disabled", false);
                }
            });

            });

        // 일정 상세보기 수정
        function modifyAddScheduleModal() {

            let calendarNo = document.querySelector("#cccc").value
	        let startDate = document.querySelector("#modifyStartDate").value
	        let startTime = document.querySelector("#modifyStartTime").value
	        let endDate = document.querySelector("#modifyEndDate").value
	        let endTime = document.querySelector("#modifyEndTime").value
	        let allday = document.querySelector("#modifyallday").value
	        let scTitle = document.querySelector("#modifyScTitle").value
	        let scContent = document.querySelector("#modifyScContent").value
             //console.log(calendarNo);
            // console.log(startDate);
            // console.log(startTime);
            // console.log(endDate);
            // console.log(endTime);
            // console.log(allday);
            // console.log(scTitle);
            // console.log(scContent);

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
                scheduleNo : efef,
	            calendarNo: calendarNo,
	            startDate: startDate,
	            startTime: startTime,
	            endDate: endDate,
	            endTime: endTime,
	            allday: allday,
	            scTitle: scTitle,
	            scContent: scContent
	        }

            $.ajax({
	            url: "updateScheduleModal.sc",
	            data: reqData,
	            success: function (resData) {
	                //console.log(resData)
	
	                if (resData == "success") {
	                    alert("일정이 수정되었습니다.")  ;
	                } else {
	                    alert("일정 수정을 실패했습니다.");
	                }
	            },
	            error: function () {
	                 console.log("일정 수정 실패");
	            }
	
	        })




        }

        // 일정 삭제
        function deleteScheduleModal() {
            let calendarNo = fdfd
            let scheduleNo = efef
            //let calendarNo = document.querySelector("#xxx").value
	        let startDate = document.querySelector("#clickStartDate").value
	        let startTime = document.querySelector("#clickStartTime").value
	        let endDate = document.querySelector("#clickEndDate").value
	        let endTime = document.querySelector("#clickEndTime").value
	        let allday = document.querySelector("#clickallday").value
	        let scTitle = document.querySelector("#clickScTitle").value
	        let scContent = document.querySelector("#clickScContent").value

            //console.log(calendarNo);
            //console.log(scheduleNo);
            // console.log(startDate);
            // console.log(startTime);
            // console.log(endDate);
            // console.log(endTime);
            // console.log(allday);
            // console.log(scTitle);
            // console.log(scContent);

            const reqData = {
                calendarNo : calendarNo,
                scheduleNo : scheduleNo,
                startDate : startDate,
                startTime : startTime,
                endDate : endDate,
                endTime : endTime,
                allday : allday,
                scTitle : scTitle,
                scContent : scContent
            }

            //console.log(reqData);

            
            $.ajax({
                url: "deleteSchedule.sc",
                data: reqData,
                success: function (resData) {
                    //console.log(resData)
                    if (resData == "success") {
                        alert("일정을 삭제했습니다.");
                        $("#myCalendars").empty();
                        calendarList();
                    } else {
                        alert("일정 삭제를 실패했습니다.");
                    }
                },
                error: function () {
                    console.log("일정 삭제 실패");
                }
            });
            
        


        }
        
        // 체크된 일정만 가져오기

        // 체크된 캘린더 조회하기 위한

        // selectScheduleList();


        // //체크되어있는 캘린더 번호
        // check=[];
        // $(".cName").each(function(){
        //     if($(this).is(":checked") == true){
        //         check.push($(this).next().val());
        //     }
        // })
        // console.log(check);


        // //체크 이벤트 발생시 캘린더 번호 arr로
        // $(document).on("click", ".checkSchGroup", function(){
        //     check=[];
        //     $(".checkSchGroup").each(function(){
        //         if($(this).is(":checked") == true){
        //             check.push($(this).next().val());
        //         }
        //     })
        //     console.log(check);

        //     let eventArr = [];

        //     for(let i=0; i<check.length; i++){
        //         for(let j=0; j<schedules.length; j++){
        //             if(check[i] == schedules[j].groupNo){
        //                 let eventObj = {
        //                     groupId: schedules[j].schNo,
        //                     title: schedules[j].schTitle,
        //                     start: schedules[j].schBegin,
        //                     end: schedules[j].schEnd,
        //                     color: schedules[j].groupColor
        //                 }
        //                 eventArr.push(eventObj);
        //             }
        //         }
        //     }
        //     calendarRendering(eventArr);
        // })

        // let schedules;
        // function selectScheduleList(){
        //     $.ajax({
        //         url:"selectSchedule.emp",
        //         dataType:"JSON",
        //         type:"post",
        //         success:function(sList){

        //             console.log(sList);

        //             schedules = sList;
        //             let eventArr = [];
        //             for(let c=0; c<check.length; c++){
        //                 // check[c] = > groupNo
        //                 for(let i=0; i<sList.length; i++){
        //                     //sList[i].groupNo => groupNo  // groupNo 조회해오기!!!!!
        //                     if(check[i] == sList[i].groupNo){
        //                         let eventObj = {
        //                             groupId: sList[i].schNo,
        //                             title: sList[i].schTitle,
        //                             start: sList[i].schBegin,
        //                             end: sList[i].schEnd,
        //                             color: sList[i].groupColor
        //                         }
        //                         eventArr.push(eventObj);
        //                     }   
        //                 }
        //             }

        //             calendarRendering(eventArr);   
        //         }, error: function(){
        //             console.log("일정조회 ajax 통신실패")
        //         }   
        //     })
        // }

        








    </script>



</body>
</html>