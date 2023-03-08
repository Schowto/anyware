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
	
</style>

</head>
<body>

	<div class="menu">
        <span style="font-weight: 600; font-size: 15px;">전자결재</span><br><br>
        <button class="btn btn-primary" style="font-size: 13px; width: 100px;">작성하기</button>
        <br><br>

        <div id="mail-area">
            
            <ul>
                <span style="font-weight: 600;">진행중인 문서</span><br><br>
                <li id="c1"><a>&nbsp;&nbsp;전체</a></li>
                <li id="c2"><a>&nbsp;&nbsp;진행</a></li>
                <li id="c3"><a>&nbsp;&nbsp;대기</a></li>
                <li id="c4"><a>&nbsp;&nbsp;예정</a></li>
                <li id="c5"><a>&nbsp;&nbsp;확인</a></li>
                <li>
            </ul>

            <br><br>

            <ul>
                <span style="font-weight: 600;">문서함</span><br><br>
                <li id="c5"><a>&nbsp;&nbsp;전체</a></li>
                <li id="c6"><a>&nbsp;&nbsp;기안</a></li>
                <li id="c7"><a>&nbsp;&nbsp;결재</a></li>
                <li id="c8"><a>&nbsp;&nbsp;열람</a></li>
                <li>
            </ul>

        </div>
 
    </div>


</body>
</html>