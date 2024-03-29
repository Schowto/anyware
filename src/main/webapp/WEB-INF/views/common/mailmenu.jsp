<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>      
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>Insert title here</title>

<script src="https://kit.fontawesome.com/6f4b87b4ed.js" crossorigin="anonymous"></script>
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
    /* overflow: auto; */
    z-index: 1;
    
}
.menu li{
    margin-top: 5px;
   
}


#mail-area li a:hover{
    color: gray;
    cursor: pointer;
    text-decoration: none;
    
}
#adbook-area>ul>li a:hover{
    color: gray;
    cursor: pointer;
    text-decoration: none;
}

/* 노멀라이징 */

a{
  color: inherit;
  text-decoration:none;
}


/*주소록 그룹*/

.group{
   /*  padding: 0px 10px; */
    font-size: 13px;
}

#check-btn { display: none;}
#check-btn:checked ~ .menubars { display: block; } 
.menubars { display: none; }

#check-btn2 { display: none;}
#check-btn2:checked ~ .menubars2 { display: block; } 
.menubars2 { display: none; }

.label{margin-top:10px}



/* ======== 개인 주소록 수정 ======== */
#plus-tag{
    margin-left: 10px;
    color:gray;
    cursor:pointer;
}
#plus-tag:hover{
    color:lightgrey;
  
}

.tag-delete{
    padding-top: 6px;
    margin-left:70px;
}
#adbook-area a:hover{
	text-decoration:none;
	 color: gray;
}

#adbook-area .dropdown-item{
	font-size:13px;
	font-weight: bold; 
}

.insertAddress span, .updateAddress span{
    width: 70%;
}

.insertAddress input[type=text], .updateAddress input[type=text], #select-addressBook{
    width:90%;
    height: 25px;
}

.update-addBtn span, .update-addBtn a, .update-addBtn a:hover{
    color:black;
    cursor: pointer;
    margin-right:10px;
    
}

#adbook-area input[type=text]{
    width:120px;
    border: 1px solid rgb(206, 206, 206);
    border-radius : 5px;
}
.insertAddBook {
    margin-bottom: 10px;
    display:none;
}

.insertAddress, .update-addBtn{
 	/*  display:flex; */
 	text-align:right;
} 

.insertAddress span, .updateAddress span{
    width: 70%;
}

.insertAddress input[type=text], .updateAddress input[type=text], #select-addressBook{
    width:100%;
    height: 25px;
}

.update-addBtn span, .update-addBtn a, .update-addBtn a:hover{
    cursor: pointer;
    margin-right:5px;
    text-decoration:none;
     
}

#adbook-area .dropdown{
	 color: lightgray;
 	 display:inline-block;
 	 float:right;
 	 height:15px;
 	 border:none;
 	 background-color:white;
 	
 	 
}
#adbook-area .dropdown:hover{
	background-color:rgba(233, 233, 233, 0.811);
	border-radius:50px;
}
.fa-check{color:green;}
.fa-times{color:red;}

.menu *{
font-size : small
}
.content *{
font-size : small
}


</style>
</head>
<body>
	 <div class="menu">
            <span style="font-weight: 600; font-size: 19px;">메일</span><br><br>
            
            
            <a class="btn btn-primary" href="sendForm.em"style="font-size: 13px; font-weight:600; width: 120px;">메일쓰기</a>
            <br><br>
            <div id="mail-area">
              <!--  <a href="test.do">테스트</a> -->
            <ul>
                <li><a href="receivebox.em">받은메일함 &nbsp;&nbsp;&nbsp;</a><span class="count badge text-bg-primary" style="font-size:12px;"></span></li>
                <li><a href="sendbox.em">보낸메일함</a> <!-- <button class="btn2">수신확인</button> --> </li> 
                <li><a href="important.em">중요메일함</a></li>         
                <li><a href="sendToMebox.em">내게쓴메일함</a></li>
                <li><a href="storage.em">임시보관함</a></li>
               <!--  <li>
                    <a>스팸메일함&nbsp;&nbsp;&nbsp;&nbsp; </a>
                    <a href="#" title="비우기" data-toggle="popover" data-trigger="hover" data-content="Some content">
                        <img src="resources/images/bin.png"  width="14px"alt="">
                    </a>
                
                </li> -->
                <li>
                    <a href="trash.em">휴지통 </a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <a onclick="trashEmpty();" title="비우기" data-toggle="popover" data-trigger="hover" data-content="Some content">
                        <img src="resources/images/bin.png"  width="14px"alt="">
                    </a>
                </li>
               <!--  
                 <div class="chat position-relative" style="display: inline-block">
		      		 <button class="dropdown drop-btn" type="button" data-bs-toggle="dropdown"  aria-expanded="false">
		                <img id="profileImg" src="resources/images/bell.png" width="38px" height="38px"  >
		                <span class="position-absolute top-15 start-100 translate-middle badge rounded-pill bg-danger">1</span>
		            </button>
		            <div class="dropdown-menu dropdown-menu-sm" style="font-size: 13px;">
		             <h4 class="dropdown-header" style="font-size:14px;">
		                      알람내역
		                  </h4>
		                  <div id="alert-area">
		                  알람 뿌려지는 영역
		               
		               	
		                  </div>
		            </div>
		  
		        </div>
		         -->
	
			 </ul>
			            
            
            <script>
            	$(function(){
            		unreadCount();
            	})
            		function unreadCount(){
                   		$.ajax({
                   		    url: "unreadcount.em",
                   		    data: { memId : '${loginUser.memberId}' },
                   		    success: function (count){
                   		    	console.log(count);
                   		    	var value="";
                   		    	if(count != 0 ){
                   		    		value = count;
                   		    	}else{
                   		    		value = 0;
                   		    		
                   		    	}
                   		            
                   		          $(".count").html(value);
                   		       
                   		    	
                   		    },error: function () {
                     		      console.log("안읽은메일조회용 ajax 통신실패");
                   		    }
                   		  });
                   		     
            	}
            
            
            </script>
            
            <script>
           		 function trashEmpty(){
            		if(confirm("휴지통을 비우시겠습니까? \n휴지통의 모든 메일은 영구 삭제되어 복구할 수 없습니다.")){
            		
            			$.ajax({
            				url:"trashEmpty.em",
            				data:{
         							memId: '${loginUser.memberId}',
         							
         					  },
            				success:function(result){
            					alert("휴지통 비우기가 완료되었습니다. ");
            				},
            				error: function(){
            					console.log("ajax 휴지통비우기 실패")
            				}
            			})
             	}
            }
            </script>

            </div>
            <br><br>
            <div id="adbook-area">
                <span style="font-weight: 600; font-size: 15px;" >주소록</span><br>

   					<input id="check-btn" type="checkbox" checked/> 
   					<label for="check-btn" class="label">
   					<ion-icon name="chevron-down-outline"></ion-icon><a href="personal.ad"> 개인주소록</a></label>
   					
   					 <ul class="group menubars" id="personal">
                     	 <li id="all"><a href="personal.ad">전체 </a></li>
                     	 
                     	 
                    </ul>

			<!--========== 주소록 그룹 추가==========-->
			<div class="insider insertAddBook">
				<div class="insertAddress">
					<span><input type="text" name="addName" id="addName"></span>

					<div class="update-addBtn">
						<a id="insertAddIndiv" onclick="insertAddGroup();"><i class="fas fa-check"></i></a>
						 <a onclick="dismissInsertAdd();"><i class="fas fa-times"></i></a>
					</div>
				</div>
			</div>


			<div id="plus-tag" onclick="return insertAddBook();"
				style="color: rgb(139, 139, 139)">+ 그룹 추가</div>


			<!-- <script>
	            	function postFormSubmit(url){
	            		$("#post").attr("action", url).submit();
	            	}
	        </script> -->

			<script>
               	 $(function(){
               		selectGroupList();
               	 })
               
				function selectGroupList() {
               		$.ajax({
               		    url: "glist.ad",
               		    data: { no: ${loginUser.memberNo} },
               		    success: function (list) {
               		      var all = "<li id='all'><a href='personal.ad'>전체 </a></li>"	
               		      var li = all;
               		      for (let i = 0; i < list.length; i++) {
               		        li += "<li class='glist' id='addTitle"
               		           + list[i].groupNo +"'>" 
               		           +"<a class='addTitle' href='searchPer.ad?keyword=&memNo="+ ${loginUser.memberNo} + "&groupNo=" + list[i].groupNo + "'>" + list[i].groupName + "</a>" 
               		           +"</li>";
               		      }
               		     
               		      $(".menubars").html(li);

               		      $(".menubars li.glist").each(function () {
               		        var dropdown = $("<div>").addClass("dropdown");
               		        var dropdownButton = $("<button>").addClass("btn-default").addClass("dropdown").attr("type", "button").attr("id", "dropdownMenuButton").attr("data-toggle", "dropdown").attr("aria-haspopup", "true").attr("aria-expanded", "false").html("<i class='fas fa-ellipsis-v'>");
               		        var dropdownMenu = $("<div>").addClass("dropdown-menu").attr("aria-labelledby", "dropdownMenuButton");
               		        var dropdownItem1 = $("<a>").addClass("dropdown-item").attr("href", "#").text("수정하기").click(function() {
               		          var listItem = $(this).closest(".glist");
               		          var groupNo = listItem.attr("id").substring("addTitle".length);
               		          var groupName = listItem.find(".addTitle").text();

               		          updateAddBook(groupNo,groupName);
               		        
               		        })
               		
               		        var dropdownItem2 = $("<a>").addClass("dropdown-item").attr("href", "#").text("삭제하기").click(function() {
                 		          var listItem = $(this).closest(".glist");
                   		          var groupNo = listItem.attr("id").substring("addTitle".length);

                   		         deleteAddBook(groupNo);
                   		        
                   		        })
                   		

               		        dropdownButton.appendTo(dropdown);
               		        dropdownItem1.appendTo(dropdownMenu);
               		        dropdownItem2.appendTo(dropdownMenu);
               		        dropdownMenu.appendTo(dropdown);
               		        dropdown.appendTo(this);

               		        $(this).find(".dropdown-toggle").on("click", function (e) {
               		          e.preventDefault();
               		          $(this).closest(".dropdown").toggleClass("show");
               		        });
               		
               		      });
               		    },
               		    error: function () {
               		      console.log("그룹조회용 ajax 통신실패");
               		    },
               		  });
               		}
       
               </script>
        
                <script>
                

                /*  // 해당 주소록 그룹으로 이동 처리하는 함수	
    				function postSubmit(url, groupNo) {
    					$("#post").children("#groupNo").val(groupNo); // hidden값에 반복되는 addNo요소 중 클릭된 요소만 value값에 넣기
    					$("#post").attr("action", url).submit();
    				} */

    				// 개인 주소록 수정 클릭시 실행하는 함수
    				function updateAddBook(groupNo,groupName) {
    				// 해당 주소록 번호만 들어간 요소 hide, show 이벤트 부여
    				$("#addTitle"+groupNo).hide();
    					
    				var updateDiv = $("<div>").addClass("insider updateAddBook").attr("id", "update"+groupNo );
    			    var updateAddressDiv = $("<div>").addClass("updateAddress");
    			    var groupNameInput = $("<input>").attr("type", "text").attr("id", "groupName"+groupNo).attr("name", "groupName").attr("value", groupName);
    			    var updateAddBtnDiv = $("<div>").addClass("update-addBtn");
    			    var updateBtnSpan = $("<span>").click(function() {updateAddGroup(groupNo);}).html("<i class='fas fa-check'></i>");
    			    var dismissBtnSpan = $("<span>").click(function() {dismissUpdateAdd(groupNo);}).html("<i class='fas fa-times'></i>");

    			    groupNameInput.appendTo(updateAddressDiv);
    			    updateBtnSpan.appendTo(updateAddBtnDiv);
    			    dismissBtnSpan.appendTo(updateAddBtnDiv);
    			    updateAddressDiv.appendTo(updateDiv);
    			    updateAddBtnDiv.appendTo(updateDiv);
    			    
    			    $("#addTitle"+groupNo).after(updateDiv);
    				
    				}
    				
    				// 개인 주소록 수정 처리
    				function updateAddGroup(groupNo){
    					
    					let name = $("#groupName" + groupNo).val();
    					//console.log($("#groupName" + groupNo).val());
    					
    					
    					$.ajax({
    						url : "updateGroup.ad",
    						data : {
    							memNo : '${loginUser.memberNo}',
    							groupNo : groupNo,
    							groupName : name
    						},
    						success : function(result){
    							if(result == 'success'){
    								selectGroupList();
    							}
    						},
    						error : function(){
    							console.log("주소록 그룹명 수정 실패");
    						}
    					})
    					
    				}

    				// 개인 주소록 삭제 처리
    				function deleteAddBook(groupNo) {
    					let answer = confirm("주소록을 삭제하면 안에 있는 연락처가 모두 삭제됩니다.\n주소록을 삭제하시겠습니까?");
    					
    					// 삭제 '확정'시 실행
    				 	if(answer == true){
    				 		
    				 		$.ajax({
    				 			url : "deleteGroup.ad",
    				 			data : {
    				 				memNo : ${loginUser.memberNo},
    				 				groupNo : groupNo
    				 			},
    				 			success : function(result){
    				 				//console.log(result);
    				 				if(result == 'success'){
    					 				alert("주소록을 삭제했습니다.");
    					 				selectGroupList();
    					 				
    					 				window.location.href = "personal.ad";
    				 				}

    				 			},
    				 			error : function(){
    				 				console.log("실패");
    				 			}
    				 		})
    				 		
    				 	}
    				}

    				// 주소록 그룹명 수정 '취소'시 처리하는 함수
    				function dismissUpdateAdd(groupNo) {
    					$("#update"+groupNo).hide();
    					$("#addTitle"+groupNo).show();
    				}

    				
                   
                 // 주소록 추가 클릭시 처리하는 함수
    				function insertAddBook() {
    					$(".insertAddBook").show();
    					
    				}
                 // 주소록 그룹 '추가'시 실행하는 ajax
    				function insertAddGroup(){

    					if ($("#addName").val().trim() != 0) {
    						$.ajax({
    							url : "insertAddGroup.ad",
    							data : {
    								memNo : '${loginUser.memberNo}',
    								groupName : $("#addName").val()
    							},
    							success:function(result) {
										//console.log(adg);
										selectGroupList();
    									$(".insertAddBook").hide();
    						
    									groupList();
    							},
    							error: function(){
    								console.log("주소록 추가 ajax 통신실패");
    							}

    						})
    					} else {
    						alert("그룹명을 입력해주세요.");
    						return false;
    					}

    				}

    				// 주소록 추가 '취소'시 처리하는 함수
    				function dismissInsertAdd() {
    					$(".insertAddBook").hide();
    					$("#addName").val("");
    				}

                    </script>

                    
                <br>
               
                    <input id="check-btn2" type="checkbox" /> 
    					<label for="check-btn2">
    					<a><ion-icon name="chevron-down-outline" ></ion-icon></a><a href="company.ad"> 사내주소록</a>
                   		</label>
                    <ul class="group menubars2">
                        <li><a href="company.ad"> 전체</a></li>          
                        <li><a href="#">인사부</a></li>
                        <li><a href="#">개발부</a></li>
                        <li><a href="#">총무부</a></li>
                        <li><a href="#">디자인부</a></li>
                    </ul>

			<script>
        	$(function(){
        		$(".menubars2 a").click(function(){
        			location.href = "dept.ad?&deptName="+ $(this).eq(0).text();
        	
        		})
        		
        	})

         </script>
         
         
         
         <!-- 알람 -->
         	<!-- sockJS -->
			 <script src="https://cdn.jsdelivr.net/sockjs/1/sockjs.min.js"></script>
			<script>
			// 전역변수 설정
			var socket  = null;
			$(document).ready(function(){
			    // 웹소켓 연결
			    var sock = new SockJS("${pageContext.request.contextPath}/alarm");
			    socket = sock;
			
			    // 데이터를 전달 받았을때 
			    sock.onmessage = onMessage; // toast 생성
			    sock.onclose = onClose;
			
			});
			 
		   	
		   	 
			// toast생성 및 추가
			function onMessage(evt){
			    var data = evt.data;
			    // toast
			    let toast = "<div class='toast' role='alert' aria-live='assertive' aria-atomic='true'>";
			    toast += "<div class='toast-header'><i class='fas fa-bell mr-2'></i><strong class='mr-auto'>알림</strong>";
			    toast += "<small class='text-muted'>just now</small><button type='button' class='ml-2 mb-1 close' data-dismiss='toast' aria-label='Close'>";
			    toast += "<span aria-hidden='true'>&times;</span></button>";
			    toast += "</div> <div class='toast-body'>" + data + "</div></div>";
			    $("#msgStack").append(toast);   // msgStack div에 생성한 toast 추가
			    $(".toast").toast({"animation": true, "autohide": false});
			    $('.toast').toast('show');
			};	
			
			
			function onClose(){ // 퇴장하기 클릭시 실행되는 함수 
		   		   location.href="${pageContext.request.contextPath}"; // contextpath ("/spring")
		   		   // * 웹소켓과의 통신도 끊기게됨 => ChatEchoHandler클래스의 afterConnectionClosed메소드 실행됨 
		   	   }
		   	
			
			
			
			</script>
			
			
			
         
         
         
         
         
         
         
         
         
         
         
         
         
         


		</div>
            
			
			 
    </div>
	
</body>
</html>