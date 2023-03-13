<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
	.basic{
		width: 500px;
		height: 70px;
		text-align: center;
	}

	.basic th{
		width: 100px;
	}

	.order{
		width: 420px;
		height: 250px;
		text-align: center;
	}
	
	.order td{
		width: 120px;	
	}
	
	.editor{
		height:500px;
	}

	.ref th{
		text-align: center;
		width: 60px;
	}

	.ref td{
		width: 800px;		
	}
	
	.btn-center {
		text-align:center;
	}
	
	th{
		background-color: rgba(95, 95, 251, 0.056);
	}

	h4{
		font-weight:900;
	}
	
	.bText{
		height:50px;
		font-size: x-large;
		font-weight:900;
	}

	.searchBtn{
		text-align:center;
	}
	
	#sign{
    	cursor:pointer;
	}



</style>

</head>

<body>
	
	<jsp:include page="../common/sidebar.jsp"></jsp:include>
	<jsp:include page="../common/appro.jsp"></jsp:include>
	
	<div class="content">
		<div class="bText">&nbsp;기본 설정</div>
	
		<table class="table-bordered basic">
			<tr>
				<th>문서종류</th>
				<td>${appro.tplTitle}</td>
				<th>작성일</th>
				<td>${appro.createDate}</td>
			</tr>
			<tr>
				<th>작성자</th>
				<td>${appro.writerName}</td>
				<th>부서</th>
				<td>${appro.writerDept}</td>
			</tr>
		</table>
		<br>
		<div class="bText">&nbsp;결재선</div>
		<table class="table-bordered order">
			<tr>
				<th rowspan="3">결재</th>
				<td>${appro.writerJob}</td>
				<td>${appro.interJob}</td>
				<td>${appro.finalJob}</td>
			</tr>
			<tr style="height: 120px;" id="sign">
				<td><img src="resources/images/appro/appro.png"></td>
				<td><img src="resources/images/appro/wait.png"></td>
				<td><img src="resources/images/appro/wait.png"></td>
			</tr>
			<tr>
				<td>${appro.writerName}</td>
				<td>${appro.interName}</td>
				<td>${appro.finalName}</td>
			</tr>
		</table>
		<br>
		<table class="table-bordered ref" role="button" data-toggle="modal" data-target="#myModal2">
			<tr>
				<th>참조</th>
				<td>
					&nbsp;
					<c:forEach var='r' items='${ref}'>
					&nbsp;${r}  
					</c:forEach>
				</td>
			</tr>
			<tr>
				<th>열람</th>
				<td>
					&nbsp;
					<c:forEach var='o' items='${open}'>
					&nbsp;${o}  
					</c:forEach>
				</td>
			</tr>
		</table>
		<br>
		<form action="insert.appro">
			<div class="bText">&nbsp;본문</div>
			<input style="width: 600px;" type="text" name="approTitle" value="${appro.approTitle}" readonly>
			<br><br>
			<textarea id="summernote" class="editor" name="approContent"></textarea>
			<br>
			<div class="btn-center">
				<button type="submit" class="btn btn-primary">등록</button>
				<button type="reset" class="btn btn-danger">취소</button>
			</div>
			<br><br><br>
		</form>
	</div>

	<script>
		$(document).ready(function() {
			
			if('${appro.interAppro}' == '반려'){
				$('#sign img').eq(1).attr("src","resources/images/appro/deny.png");
			}else if('${appro.interAppro}' == '결재'){ 
				$('#sign img').eq(1).attr("src","resources/images/appro/appro.png");

			}
			
			if('${appro.finalAppro}' == '반려'){
				$('#sign img').eq(2).attr("src","resources/images/appro/deny.png");
			}else if('${appro.finalAppro}' == '결재'){ 
				$('#sign img').eq(2).attr("src","resources/images/appro/appro.png");
			}
			

			$('#summernote').summernote({
				lang: 'ko-KR',
				height:600,
				maxHeight: 600,
				minHeight: 600,
				  
				toolbar: [
				    ['fontname', ['fontname']],
				    ['style', ['bold', 'italic', 'underline', 'clear']],
				    ['font', ['strikethrough', 'superscript', 'subscript']],
				    ['fontsize', ['fontsize']],
				    ['color', ['color']],
				    ['para', ['ul', 'ol', 'paragraph']],
				    ['height', ['height']],
				    ['table', ['table']],
				],
				fontNames: ['Courier New','맑은 고딕','궁서','굴림']
				
			});
			  
		    $('#summernote').summernote('pasteHTML', "${appro.approContent}");
			  
		    $('#summernote').summernote('disable');

		});
	</script>
	
</body>
</html>