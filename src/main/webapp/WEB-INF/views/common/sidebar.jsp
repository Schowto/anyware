<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

   <!-- CSS 사이드바 -->
    <link href="https://fonts.googleapis.com/css?family=Nanum+Gothic:400" rel="stylesheet">
 
    <!--헤더-->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://getbootstrap.com/docs/5.2/assets/css/docs.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
   
    <!-- 메신저 css -->
    <link rel="stylesheet" type="text/css" href="resources/css/messenger.css"/>

    <style>
        /* GOOGLE FONTS */
        @import url('https://fonts.googleapis.com/css?family=Nanum+Gothic:400');
        @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap');
        

/* VARIABLES CSS */
:root {
    --nav--width: 75px;

    /* Colores */
    --first-color: #ffffff34;
    --bg-color: #7291f6;
    --sub-color: #f3f2f8;
    --white-color: rgb(248, 248, 248);

    /* Fuente y tipografia */
    --body-font: 'Nanum Gothic', sans-serif;
    --normal-font-size: 1rem;
    --small-font-size: .875rem;

    /* z index */
    --z-fixed: 100;
}

/* BASE */
*, ::before, ::after {
    box-sizing: border-box;
  
}

body {
    position: relative;
    margin: 0;
    padding: 0 0 0 80px;
    font-family: var(--body-font);
    font-size: var(--normal-font-size);
    transition: .5s;
}

h1 {
    margin: 0;
}

ul {
    margin: 0;
    padding: 0;
    list-style: none;
}

a {
    text-decoration: none;
}
.nav a:hover{
	text-decoration: none;
	color:white;
}

.btn-primary{
    background-color:  #7291f6;
    border: none;
}

/* l NAV */
.l-navbar {
    position: fixed;
    top: 0;
    left: 0;
    width: var(--nav--width);
    height: 100vh;
    background-color: var(--bg-color);
    color: var(--white-color);
    padding: 1.5rem 1.1rem 2rem;
    transition: .5s;
    z-index: var(--z-fixed);
}

/* NAV */
.nav {
    height: 100%;
    display: flex;
    flex-direction: column;
    justify-content: space-between;
    overflow: hidden;
}

.nav__brand {
    display: grid;
    grid-template-columns: max-content max-content;
    justify-content: space-between;
    align-items: center;
    margin-bottom: 2rem;
}

.nav__toggle {
    font-size: 1.25rem;
    padding: .75rem;
    cursor: pointer;
}

.nav__logo {
    color: var(--white-color);
    font-weight: 600;
}

.nav__link {
    display: grid;
    grid-template-columns: max-content max-content;
    align-items: center;
    column-gap: .75rem;
    padding: .75rem;
    color: var(--white-color);
    border-radius: .5rem;
    margin-bottom: 1rem;
    transition: .3s;
    cursor: pointer;
    font-weight: 600;
}

.nav__link:hover {
    background-color: var(--first-color);
}

.nav__icon {
    font-size: 1.25rem;
}

.nav_name {
    font-size: var(--small-font-size);
}

/* Expander menu */
.expander {
    width: calc(var(--nav--width) + 8.25rem);
}

/* Add padding body*/
.body-pd {
    padding:0 0 0 13.2rem;
}

/* Active links menu */
.active {
    background-color: var(--first-color);
}



/* Rotate icon */
.rotate {
    transform: rotate(180deg);
    transition: .5s;
}

/*헤더*/
.header{
    height: 20px;
}
.header>div{
   float: right;
}
.chat{
    margin-right: 25px;
    margin-top: 20px;
}
#profile{
    margin-right: 50px;
    margin-top: 10px;
}
.drop-btn{
	border:none;
	background:white;
}

/*서브메뉴*/
.menu{
    position: fixed;
    height: 100vh;
    width: 170px;
    font-size: 14px;
    padding: 50px 20px;
    border-right: 1px solid rgb(211, 210, 210);
    font-family: 'Nanum Gothic', sans-serif;
}
.menu li{
    margin-top: 5px;
   
}
#mail-area li:hover{
    color: gray;
    cursor: pointer;
}
#adbook-area>ul>li li:hover{
    color: gray;
    cursor: pointer;
}

/*컨텐트 영역*/
.content{
    width: 80%;
    margin-left: 200px;
    margin-top: 50px;
}



    </style>
</head>
<body id="body-pd">
    
    <c:if test="${not empty alertMsg }">
		<script>
			alert('${alertMsg}');
		</script>
		<c:remove var="alertMsg" scope="session" />
	</c:if>

    <div id="side">
        <div class="l-navbar" id="navbar">
         <nav class="nav">
            <div>
                <div class="nav__brand">
                    <ion-icon name="menu-outline" class="nav__toggle" id="nav-toggle"></ion-icon>
                    <a href="main.do" class="nav__logo">ANYWARE</a>
                </div>
                <div class="nav__list">
                   
                    <a href="selectAll.me?deptName=${ loginUser.deptName }&memberNo=${loginUser.memberNo}" class="nav__link">
                        <ion-icon name="person-outline" class="nav__icon"></ion-icon>
                        <span class="nav_name">인사</span>
                    </a>

                    <a href="receivebox.em" class="nav__link">
                        <ion-icon name="mail-outline"  class="nav__icon"></ion-icon>
                        <span class="nav_name">메일</span>
                    </a>
                    
                    <a href="ingListAll.appro?cat=ingListAll" class="nav__link">
                        <ion-icon name="document-text-outline" class="nav__icon"></ion-icon>
                        <span class="nav_name">전자결재</span>
                    </a>


                    <a href="schedule.sc" class="nav__link">
                        <ion-icon name="calendar-outline" class="nav__icon"></ion-icon>
                        <span class="nav_name">일정관리</span>
                    </a>

                    
                    <a href="#" class="nav__link">
                        <ion-icon name="time-outline" class="nav__icon"></ion-icon>
                        <span class="nav_name">예약</span>
                    </a>

                    <a href="main.bo" class="nav__link">
                        <ion-icon name="people-outline" class="nav__icon"></ion-icon>
                        <span class="nav_name">게시판</span>

                    </a>

                    <a href="list.pj?category=all" class="nav__link">
                        <ion-icon name="folder-outline" class="nav__icon"></ion-icon>
                        <span class="nav_name">프로젝트</span>
					</a>

                        
                    </div>
                    <a href="list.gr" class="nav__link">
                        <ion-icon name="git-network-outline" class="nav__icon"></ion-icon>
                        <span class="nav_name">조직도</span>
                    </a>

                   
                </div>
                <a href="logout.me" class="nav__link">
                    <ion-icon name="log-out-outline" class="nav__icon"></ion-icon>
                    <span class="nav_name">Logout</span>
                </a>
            </div>
        </nav>
    </div>

    <!-- IONICONS -->
    <script src="https://unpkg.com/ionicons@5.2.3/dist/ionicons.js"></script>
    <!-- JS -->


    <script>
        /* EXPANDER MENU */
    const showMenu = (toggleId, navbarId, bodyId) => {
    const toggle = document.getElementById(toggleId),
    navbar = document.getElementById(navbarId),
    bodypadding = document.getElementById(bodyId)

    if( toggle && navbar ) {
        toggle.addEventListener('click', ()=>{
            navbar.classList.toggle('expander');

            bodypadding.classList.toggle('body-pd')
        })
    }

  
    }

    showMenu('nav-toggle', 'navbar', 'body-pd')

    /* LINK ACTIVE */
    const linkColor = document.querySelectorAll('.nav__link')
    function colorLink() {
        linkColor.forEach(l=> l.classList.remove('active'))
        this.classList.add('active')
    }
    linkColor.forEach(l=> l.addEventListener('click', colorLink))

    /* COLLAPSE MENU */
    const linkCollapse = document.getElementsByClassName('collapse__link')
    var i

    for(i=0;i<linkCollapse.length;i++) {
        linkCollapse[i].addEventListener('click', function(){
            const collapseMenu = this.nextElementSibling
            collapseMenu.classList.toggle('showCollapse')

            const rotate = collapseMenu.previousElementSibling
            rotate.classList.toggle('rotate')
        });
    }

    </script>

    <div class="header">
        <div id="profile" style="display: inline-block;">
            <button class="dropdown drop-btn" type="button" data-bs-toggle="dropdown"  aria-expanded="false">
                <img id="profileImg" src="<c:out value='${loginUser.profileUrl }' default='resources/images/profile2.jpg' />" width="55px" height="55px"  class="rounded-circle" alt="Cinque Terre" >
            </button>
           
          
            <div class="dropdown-menu dropdown-menu-sm" style="font-size: 14px;">
              <a class="dropdown-item" href="memberUpdate.me">정보수정</a>
              <a class="dropdown-item" href="attendence.me">근태관리</a>
              <a class="dropdown-item" href="leaveOff.me?memberNo=${loginUser.memberNo}&leaveOff=${loginUser.leaveOff}">연차신청</a>
              <a class="dropdown-item" href="logout.me">로그아웃</a>
            </div>
        </div>
      
        <div class="messenger-wrapper">
            <button class="messengerbtn">
                <img id="messengerImg" src="resources/images/chat/MessengerIcon.png" width="50">
            </button>
            <div id="messenger-area" class="messenger-area">
                <div class="tab active" id="chatList" onclick="showContent('chat-list', 'chatList', this)"><ion-icon name="people-outline" class="group"></ion-icon></div>
                <div class="tab" id="people" onclick="showContent('chat-address', 'people', this)"><ion-icon name="git-network-outline"></ion-icon></div>
                <input type="hidden" class="tab" id="chat">
                <div id="chat-list" class="tab-content">
                    <!-- 채팅 리스트 -->
                    <h3 class="title">메신저 목록</h2>
                    <div class="list-area">
                        <div class="list-set" onclick="showContent('chatroom', 'chat', this);">
                            <img src="${loginUser.profileUrl}" class="chatImg">
                            <div class="chat-content">
                                <div class="chat-info">
                                    <h2 class="chat-name"><img src="resources/images/chat/red.png" class="loginCheck">이름(부서/직급)</h2>
                                    <p class="chat-time">시간</p>
                                </div>
                                <div class="preview-div">
                                    <p class="chat-preview">채팅내용 한줄</p>
                                    <p class="notread">3</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div id="chat-address" class="tab-content" style="display: none;">
                    <!-- 주소록 -->
                    <h3 class="title">주소록</h3>
                    <div class="address-div">
                        <ul>
                            <li class="dept-list"><div class="member">대표이사</div></li>
                            <li class="dept-list"><div class="member">부사장</div></li>
                            <li class="dept-list">
                                <div class="dept">개발부</div>
                                <ul class="accordion">
                                    <li class="member">사원1</li>
                                    <li class="member">사원2</li>
                                    <li class="member">사원3</li>
                                    <li class="member">사원4</li>
                                </ul>
                            </li>
                        </ul>
                    </div>
                </div>

                <div class="tab-content" id="chatroom" style="display: none;">
                    <div class="chat-area">
                        <input type="hidden" class="roomNo" value="">
                        <table class='chat-message mine'>
                            <tr>
                                <td class='time-td'>
                                    <span class='sendtime'>14:20</span>
                                </td>
                                <td>
                                    <div class='send-message'>내가보낸 메세지내가보낸 메세지내가보낸 메세지내가보낸 메세지내가보낸 메세지</div>
                                </td>
                            </tr>
                        </table>

                        <table class='chat-message other'>
                            <tr>
                                <td>
                                    <div class='send-user'>이름(부서/직급)</div>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <div class='send-message'>남이보낸 메세지남이보낸 메세지남이보낸 메세지남이보낸 메세지남이보낸 메세지남이보낸 메세지</div>
                                </td>
                                <td class='time-td'>
                                    <span class='sendtime'>14:25</span>
                                </td>
                            </tr>
                        </table>

                    </div>

                    <div class="input-area">
                        <div class="form-group">
                            <textarea class="form-control" rows="3" id="message" style="resize:none"></textarea>
                        </div>
                        
                        <button type="button" class="btn btn-sm btn-secondary btn-block" onclick="sendMessage(this);">전송하기</button>
                    </div>
                </div>
            </div>
        </div>

    </div>

    <script src="https://cdn.jsdelivr.net/sockjs/1/sockjs.min.js"></script>
    <script>
        const $chatArea = $(".chat-area"); // 메세지들이 쌓이는 div요소객체
        const sock = new SockJS("${PageContext.request.contextPath}/anyware/chat"); // * 웹소켓 서버와 연결됨(== 웹소켓 접속 => ChatEchoHandler 클래스의 afterConnectionEstablished 메소드 실행)
        sock.onmessage = onMessage; // 웹소켓에서 해당 클라이언트 측으로 메세지를 보내면 자동으로 실행할 함수 정의
        sock.onclose = onClose;

        function sendMessage(e){ // 전송하기 버튼 클릭 시 실행되는 함수
            // console.log($(e).parent().prev().children(".roomNo").val());
            const roomNo = $(e).parent().prev().children(".roomNo").val();
            const msg = roomNo + "," + ${ loginUser.memberNo } + "," + $("#message").val();

            sock.send(msg); // 웹소켓으로 메세지 전달 => ChatEchoHandler 클래스의 handleMessage 메소드 실행
            $("#message").val("");
        }

        function onMessage(event){ // 나에게 온 메세지가 있을 경우 실행되는 함수
            // 전달된 메세지 형식 = 메세지내용(0),발신자번호(1),발신자이름(2),발신자부서(3),발신자직급(4),보낸날짜(5),보낸시간(6),이전날짜(7)
            const arr = event.data.split(",");
            
            let chatset = "";
            if(arr[5] != arr[7]){
                chatset += "<div class='date-div'>" + arr[5] + "</div>";
            }
            if(arr[1] == ${loginUser.memberNo}){ // 내가 쓴 메세지
                chatset += "<table class='chat-message mine'>"
                            + "<tr>"
                                + "<td class='time-td'>"
                                    + "<span class='sendtime'>" + arr[6] + "</span>"
                                + "</td>"
                                + "<td>"
                                    + "<div class='send-message'>" + arr[0] + "</div>"
                                + "</td>"
                            + "</tr>"
                        + "</table>";
            } else {
                if(arr[3] == '미정'){
                    chatset += "<div class='send-user'>" + arr[2] + "(" + arr[4] + ")</div>";
                } else {
                    chatset += "<div class='send-user'>" + arr[2] + "(" + arr[3] + "/" + arr[4] + ")</div>";
                }
                chatset += "<table class='chat-message other'>"
                            + "<tr>"
                                + "<td>"
                                    + "<div class='send-message'>" + arr[0] + "</div><div class='time-div'><span class='sendtime'>" + arr[6] + "</span></div>"
                                + "</td>"
                            + "</tr>"
                        + "</table>";
            }

            $(".chat-area").append(chatset);
            $('.chat-area').scrollTop($('.chat-area')[0].scrollHeight);
            getChattingList();
            
        }

        function onClose(){ // 웹소켓과 연결이 끊겼을 때 실행되는 함수
            // 웹소켓과의 연결 끊김 =>  ChatEchoHandler 클래스의 afterConnectionClosed 메소드 실행
            
        }

        $(document).on("click", ".messengerbtn", function(){
            // css 관련 코드들
			var dropdownContent = document.getElementById("messenger-area");
			if (dropdownContent.style.display === "block") {
				dropdownContent.style.display = "none";
			} else {
				dropdownContent.style.display = "block";
                getChattingList();

                var tabs = document.getElementsByClassName("tab");
                for (var i = 0; i < tabs.length; i++) {
                    tabs[i].classList.remove("active");
                }
                
                // 선택한 탭에 active 클래스를 추가합니다.
                document.getElementById("chatList").classList.add('active');
            }

            // 드롭다운을 열 때 항상 채팅리스트 화면이 되도록 설정
            document.getElementById("chat-list").style.display = "block";
            document.getElementById("chat-address").style.display = "none";
            document.getElementById("chatroom").style.display = "none";

		})
		
		function showContent(contentName, tabName, roomNo) {
			// 모든 내용을 숨깁니다.
			var contents = document.getElementsByClassName("tab-content");
			for (var i = 0; i < contents.length; i++) {
				contents[i].style.display = "none";
			}
			
			// 선택한 내용을 보여줍니다.
			document.getElementById(contentName).style.display = "block";
			
			// 모든 탭의 active 클래스를 제거합니다.
			var tabs = document.getElementsByClassName("tab");
			for (var i = 0; i < tabs.length; i++) {
				tabs[i].classList.remove("active");
			}
			
			// 선택한 탭에 active 클래스를 추가합니다.
			document.getElementById(tabName).classList.add('active');

            // 채팅 리스트 클릭
            if(contentName == 'chat-list'){
                getChattingList();
            }

            // 주소록 클릭
            if(contentName == 'chat-address'){
                $.ajax({
                    url:"chatAddress.ajax",
                    success:function(map){
                        let dList = map.dList;
                        let mList = map.mList;

                        let value = "<ul>";
                        
                        for(let m=0; m<mList.length; m++){
                            if(mList[m].jobName == '대표이사'){
                                value += "<li class='dept'><input type='hidden' value='" + mList[m].memberNo + "'><div class='member'><ion-icon name='person-outline'></ion-icon> 대표이사 " + mList[m].name  + "</div></li>";
                            } else if(mList[m].jobName == '부사장'){
                                value += "<li class='dept'><input type='hidden' value='" + mList[m].memberNo + "'><div class='member'><ion-icon name='person-outline'></ion-icon> 부사장 " + mList[m].name  + "</div></li>";
                            }
                        }

                        value += "<li class='dept-list'>";

                        for(let d=0; d<dList.length; d++){
                            value += "<div class='dept'><ion-icon name='document-text-outline'></ion-icon> " + dList[d].deptName + "</div>"
                                    + "<ul class='accordion'>";
                            for(let mm=0; mm<mList.length; mm++){
                                if(dList[d].deptName == mList[mm].deptName){
                                    value += "<input type='hidden' value='" + mList[mm].memberNo + "'><li class='member'>ㄴ<ion-icon name='person-outline'></ion-icon> " + mList[mm].name + "(" + mList[mm].deptName + "/" + mList[mm].jobName + ")" + "</li>";
                                }
                            }
                            value += "</ul>";
                        }
                        value += "<div class='dept'><ion-icon name='document-text-outline'></ion-icon> 기타</div>"
                                    + "<ul class='accordion'>";

                        for(let i=0; i<mList.length; i++){
                            if(mList[i].jobName != '대표이사' && mList[i].jobName != '부사장' && mList[i].deptName == '미정'){
                                value += "<input type='hidden' value='" + mList[i].memberNo + "'><li class='member'>ㄴ<ion-icon name='person-outline'></ion-icon> " + mList[i].name + "(" + mList[i].jobName + ")" + "</li>";
                            }
                        }
                            value += "</ul>"
                                + "</li>"
                            + "</ul>";

                        $(".address-div").html(value);

                    },
                    error:function(){
                        console.log("채팅 주소록 조회용 ajax 통신 실패")
                    }
                })
                
            }
            
            // 채팅방 입장
            if(contentName == 'chatroom'){
                $.ajax({
                    url:"chattingRoom.ajax",
                    data:{roomNo:roomNo
                        , myNo:${loginUser.memberNo}},
                    success:function(chList){ // sendDate, chatInfo 속성
                        // console.log(chList);
                        let value = "<input type='hidden' class='roomNo' value='" + roomNo + "'>";
                        for(let i=0; i<chList.length; i++){
                            value += "<div class='date-div'>" + chList[i].sendDate + "</div>";
                            for(let j=0; j<chList[i].chatInfo.length; j++){
                                if(chList[i].chatInfo[j].writerNo == ${loginUser.memberNo}){ // 내가 쓴 메세지
                                    value += "<table class='chat-message mine'>"
                                            + "<tr>"
                                                + "<td class='time-td'>"
                                                    + "<span class='sendtime'>" + chList[i].chatInfo[j].sendTime + "</span>"
                                                + "</td>"
                                                + "<td>"
                                                    + "<div class='send-message'>" + chList[i].chatInfo[j].content + "</div>"
                                                + "</td>"
                                            + "</tr>"
                                        + "</table>";
                                } else {
                            if(chList[i].chatInfo[j].deptName == '미정'){
                                value += "<div class='send-user'>" + chList[i].chatInfo[j].writerName + "(" + chList[i].chatInfo[j].jobName + ")</div>";
                            } else {
                                value += "<div class='send-user'>" + chList[i].chatInfo[j].writerName + "(" + chList[i].chatInfo[j].deptName + "/" + chList[i].chatInfo[j].jobName + ")</div>";
                            }
                                    value += "<table class='chat-message other'>"
                                                + "<tr>"
                                                    + "<td>"
                                                        + "<div class='send-message'>" + chList[i].chatInfo[j].content + "</div><div class='time-div'><span class='sendtime'>" + chList[i].chatInfo[j].sendTime + "</span></div>"
                                                    + "</td>"
                                                + "</tr>"
                                            + "</table>";
                                }
                            }
                        }

                        $(".chat-area").html(value);
                        $('.chat-area').scrollTop($('.chat-area')[0].scrollHeight);
                        
                    },
                    error:function(){
                        console.log("채팅방 조회용 ajax 통신 실패");
                    }
                })
            }
        }

        $(document).on("click", ".dept", function(){
            $(this).next(".accordion").slideToggle(100);
        });

        function getChattingList(){
            // 채팅리스트 불러오기
            $.ajax({
                url:"chattingList.ajax",
                type:"POST",
                data:{memberNo:${loginUser.memberNo}},
                success:function(rList){
                    
                    let value = "";
                    for(let i = 0; i<rList.length; i++){
                        value += "<div class='list-set' onclick='showContent("+ '"chatroom"' + ", " + '"chat"' + ", " + rList[i].roomNo + ");'>"
                                    + "<img src='" + rList[i].profileUrl + "' class='chatImg'>"
                                    + "<div class='chat-content'>"
                                        + "<div class='chat-info'>"
                                            + "<input type='hidden' class='roomNo' value='" + rList[i].roomNo + "'>";
                                if(rList[i].lcheck == 0){
                                    value += "<h2 class='chat-name'><img src='resources/images/chat/red.png' class='loginCheck'>";
                                } else {
                                    value += "<h2 class='chat-name'><img src='resources/images/chat/green.png' class='loginCheck'>";
                                }

                                if(rList[i].deptName == '미정'){
                                    value += rList[i].otherName + "(" + rList[i].jobName + ")</h2>";
                                } else {
                                    value += rList[i].otherName + "(" + rList[i].deptName + "/" + rList[i].jobName + ")</h2>";
                                }
                                
                                    value += "<p class='chat-time'>" + rList[i].sendDate + "</p>"
                                        + "</div>"
                                        + "<div class='preview-div'>"
                                            + "<p class='chat-preview'>" + rList[i].content + "</p>";
                                if(rList[i].notRead != 0){
                                    value += "<p class='notread'>" + rList[i].notRead + "</p>";
                                }
                                value += "</div>"
                                    + "</div>"
                                + "</div>";
                    }

                    $(".list-area").html(value);
                },
                error:function(){
                    console.log("채팅리스트 조회용 ajax 통신 실패");
                }
            })
        }

        $(document).on("click", ".member", function(){
            let otherNo = $(this).prev().val();
            let myNo = "${loginUser.memberNo}";

            if(otherNo != myNo){
                $.ajax({
                    url:"createRoom.ajax",
                    data:{writerNo:myNo
                        , otherNo:otherNo},
                    success:function(map){
                        // map : roomNo, chList
                        let chList = map.chList;
                        let value = "<input type='hidden' class='roomNo' value='" + map.roomNo + "'>";
                        if(chList != "" || chList.length != 0){ // 빈 채팅창
                            for(let i=0; i<chList.length; i++){
                                value += "<div class='date-div'>" + chList[i].sendDate + "</div>";
                                for(let j=0; j<chList[i].chatInfo.length; j++){
                                    if(chList[i].chatInfo[j].writerNo == ${loginUser.memberNo}){ // 내가 쓴 메세지
                                        value += "<table class='chat-message mine'>"
                                                + "<tr>"
                                                    + "<td class='time-td'>"
                                                        + "<span class='sendtime'>" + chList[i].chatInfo[j].sendTime + "</span>"
                                                    + "</td>"
                                                    + "<td>"
                                                        + "<div class='send-message'>" + chList[i].chatInfo[j].content + "</div>"
                                                    + "</td>"
                                                + "</tr>"
                                            + "</table>";
                                    } else {
                                if(chList[i].chatInfo[j].deptName == '미정'){
                                    value += "<div class='send-user'>" + chList[i].chatInfo[j].writerName + "(" + chList[i].chatInfo[j].jobName + ")</div>";
                                } else {
                                    value += "<div class='send-user'>" + chList[i].chatInfo[j].writerName + "(" + chList[i].chatInfo[j].deptName + "/" + chList[i].chatInfo[j].jobName + ")</div>";
                                }
                                        value += "<table class='chat-message other'>"
                                                    + "<tr>"
                                                        + "<td>"
                                                            + "<div class='send-message'>" + chList[i].chatInfo[j].content + "</div><div class='time-div'><span class='sendtime'>" + chList[i].chatInfo[j].sendTime + "</span></div>"
                                                        + "</td>"
                                                    + "</tr>"
                                                + "</table>";
                                    }
                                }
                            }
                        }

                        $(".chat-area").html(value);
                        $('.chat-area').scrollTop($('.chat-area')[0].scrollHeight);
                        showContent("chatroom", "chat", map.roomNo);
                    },
                    error:function(){
                        console.log("채팅방 생성용 ajax 통신 실패");
                    }
                })
            } else {
                alert("1인 채팅창은 만들 수 없습니다.");
            }
        })
        
    </script>

</body>
</html>
