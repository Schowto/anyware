<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전자 결재</title>

<style>
	#square{
		height:350px;
	}
	
	 .list-area>tbody>tr:hover{
    	cursor:pointer;
    }
</style>


</head>
<body>

	<jsp:include page="../common/sidebar.jsp"></jsp:include>
	<jsp:include page="../common/appro.jsp"></jsp:include>
	
	<script>
		$(function(){
			
			$('#${cat}').css({"font-weight" : "bold",
							"background-color" : "var(--bg-color)",
							"color" : "white",
							"font-weight" : "bold"
			});
			
			if('${cat}' == "endListAll" || '${cat}' == "endListSuggest" || '${cat}' == "endListConfirm" || '${cat}' == "endListOpen"){
				$('.content b').text("문서함");
			} 
					
			
		})
	
	</script>
	
	
	<div class="content">
		<br>
		<h4><b>진행중인 문서</b></h4>
		<br>
		<div id="square">
		<table class="list-area table" >
		    <thead>
		        <tr>
		           <th width="5px">번호</th>
		           <th width="80px">제목</th>
		           <th width="20px">직급</th>
		           <th width="30px">기안자</th>
		           <th width="30px">중간결재자</th>
		           <th width="40px">중간결재여부</th>
		           <th width="30px">최종결재자</th>
		           <th width="40px">최종결재여부</th>
		           <th width="40px">기안일</th>
		           <th width="30px">구분</th>
		        </tr>
		    </thead>
		    <tbody>
		    	<c:choose>
		    		<c:when test="${empty list}">
                        <tr>
                            <td colspan="10"> 조회된 전자 결재가 없습니다.</td>
                        </tr>
                    </c:when>
                    <c:otherwise>
                    	<c:forEach var="a" items="${list}">
	                        <tr>
	                        	<td>${a.approNo}</td>
	                        	<td>${a.approTitle}</td>
	                        	<td>${a.writerJob}</td>
	                        	<td>${a.writerName}</td>
	                        	<td>${a.interName}</td>
	                        	<td>${a.interAppro}</td>
	                        	<td>${a.finalName}</td>
	                        	<td>${a.finalAppro}</td>
	                        	<td>${a.createDate}</td>
	                        	<td>${a.tplTitle}</td>
	                        </tr>
                        </c:forEach>
                   </c:otherwise>     
                </c:choose>    	
		    </tbody>
		</table>
		</div>
			
	<script>
		<!-- 결재 상세 페이지-->
		$(function(){
			$(".list-area>tbody>tr").click(function(){
				if(${cat eq 'ingListContinue'}){
					location.href ='update.appro?approNo='+$(this).children().eq(0).text();
				} else {
					location.href ='detail.appro?approNo='+$(this).children().eq(0).text();
				}
			})
		})
	</script>	
		
		
		<ul class="page pagination">
                    
                    <c:choose>
	                    <c:when test="${pi.currentPage != 1}">
	                        <li class="page-item"><a class="page-link" href="list.appro?cpage=${pi.currentPage - 1}&cat=${cat}">&lt;</a></li>
	                    </c:when>    
	                    <c:otherwise>
                        	<li class="page-item disabled"><a class="page-link " href="">&lt;</a></li>
                        </c:otherwise>
                    </c:choose>
                    
                    <c:forEach var="p" begin="${pi.startPage}" end="${pi.endPage}">
                    	<c:choose>
                    		<c:when test="${pi.currentPage eq p}">
                            	<li class="page-item active"><a class="page-link" href="list.appro?cpage=${p}&cat=${cat}">${p}</a></li>
                            </c:when>
                            <c:otherwise>
                          		<li class="page-item"><a class="page-link" href="list.appro?cpage=${p}&cat=${cat}">${p}</a></li>
                            </c:otherwise>
                    	</c:choose>
                    </c:forEach>
                    
                    <c:choose>
                    	<c:when test="${pi.currentPage != pi.maxPage }">
                        	<li class="page-item"><a class="page-link" href="list.appro?cpage=${pi.currentPage + 1}&cat=${cat}">&gt;</a></li>
                       	</c:when>
                       	<c:otherwise>
                        	<li class="page-item disabled"><a class="page-link" href="">&gt;</a></li>
                        </c:otherwise>
                    </c:choose>
                </ul>
		
		<br><br>
		
	</div>
	
</body>
</html>