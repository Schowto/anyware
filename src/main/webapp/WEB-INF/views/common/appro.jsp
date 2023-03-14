<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- include summernote css/js -->
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
<script src=" https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.18/lang/summernote-ko-KR.min.js"></script>

<style>

    .list-area{
        text-align: center;
        font-size: 80%;
    }
    
    .list-area>tbody>tr:hover{
    	background:gray;
    	
    }
    
	.page{ 
		float:right;
	}
	
	 #mail-area li:hover{
    	background:rgb(221, 242, 255);
    	cursor:pointer;
    }
	
</style>

</head>
<body>

	<div class="menu">
        <span style="font-weight: 600; font-size: 15px;">전자 결재</span><br><br>
        <button class="btn btn-primary" onclick="location.href='enroll.appro';" style="font-size: 13px; width: 100px;">작성하기</button>
        <br><br>

        <div id="mail-area">
            
            <ul>
                <span style="font-weight: 600;">진행중인 문서</span><br><br>
                <li id="ingListAll" onclick='location.href="ingListAll.appro?cat=ingListAll";'>&nbsp;&nbsp;전체</li>
                <li id="ingListContinue" onclick='location.href="ingListContinue.appro?cat=ingListContinue"'>&nbsp;&nbsp;진행</li>
                <li id="ingListWait" onclick='location.href="ingListWait.appro?cat=ingListWait"'>&nbsp;&nbsp;대기</li>
                <li id="ingListExpected" onclick='location.href="ingListExpected.appro?cat=ingListExpected"'>&nbsp;&nbsp;예정</li>
                <li id="ingListRef" onclick='location.href="ingListRef.appro?cat=ingListRef"'>&nbsp;&nbsp;확인</li>
                <li>
            </ul>

            <br><br>

            <ul>
                <span style="font-weight: 600;">문서함</span><br><br>
                <li id=endListAll onclick='location.href="endListAll.appro?cat=endListAll"'>&nbsp;&nbsp;전체</li>
                <li id="endListSuggest" onclick='location.href="endListSuggest.appro?cat=endListSuggest"'>&nbsp;&nbsp;기안</li>
                <li id="endListConfirm" onclick='location.href="endListConfirm.appro?cat=endListConfirm"'>&nbsp;&nbsp;결재</li>
                <li id="endListOpen" onclick='location.href="endListOpen.appro?cat=endListOpen"'>&nbsp;&nbsp;열람</li>
                <li>
            </ul>
            
            <c:if test="${loginUser.deptName eq '총무부'}">
	             <br><br>
	             <ul>
	                <span style="font-weight: 600;">서식 관리</span><br><br>
	                <li id=endListAll onclick='location.href="endListAll.appro?cat=endListAll"'>&nbsp;&nbsp;서식 등록</li>
	            </ul>
            </c:if>

        </div>
 
    </div>


</body>
</html>