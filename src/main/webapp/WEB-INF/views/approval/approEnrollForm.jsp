<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> 
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
					<td>
						<select id="tplSelect">
							<c:forEach var="i" begin="0" end="${fn:length(tplList) - 1}" step="1">
								<option value="${tplList[i].tplTitle}"> 
									${tplList[i].tplTitle}
								</option>
							</c:forEach>
						</select>
					</td>
					<th>작성일</th>
					<td><input type="date" id="createDate" name="createDate" style="border:none" value=""></td>
				</tr>
				<tr>
					<th>작성자</th>
					<td>
						${loginUser.name}
						<input type="hidden" name="memberNo" value="${loginUser.memberNo}">
					</td>
					<th>부서</th>
					<td>${loginUser.deptName}</td>
				</tr>
			</table>
			<br>
			<div class="bText">&nbsp;결재선</div>
			<table class="table-bordered order" role="button" data-toggle="modal" data-target="#myModal">
				<tr>
					<th rowspan="3">test</th>
					<td>test</td>
					<td>test</td>
					<td>test</td>
				</tr>
				<tr style="height: 120px;">
					<td>test</td>
					<td>test</td>
					<td>test</td>
				</tr>
				<tr>
					<td>test</td>
					<td>test</td>
					<td>test</td>
				</tr>
			</table>
			<br>
			<table class="table-bordered ref" role="button" data-toggle="modal" data-target="#myModal2">
				<tr>
					<th>test</th>
					<td>test</td>
				</tr>
				<tr>
					<th>test</th>
					<td>test</td>
				</tr>
			</table>
			<br>
			<form action="insert.appro">
				<div class="bText">&nbsp;본문</div>
				<input style="width: 600px;" type="text" name="approTitle"placeholder="기안 제목을 입력해주세요.">
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
	<!-- The Modal -->
	<div class="modal" id="myModal">
	  <div class="modal-dialog">
	    <div class="modal-content">
	
	      <!-- Modal Header -->
	      <div class="modal-header">
	        <h4 class="modal-title">Modal Heading</h4>
	        <button type="button" class="close" data-dismiss="modal">&times;</button>
	      </div>
	
	      <!-- Modal body -->
	      <div class="modal-body">
	      
   			<div style="width:100%; height:350px; overflow:auto">
				<table class="list-area table" >
				    <thead>
				        <tr>
				           <th width="30px">이름</th>
				           <th width="30px">직급</th>
				           <th width="40px">부서</th>
				        </tr>
				    </thead>
				    <tbody>
				    	<c:choose>
				    		<c:when test="${empty memberList}">
		                        <tr>
		                            <td colspan="4"> 조회된 직원이 없습니다.</td>
		                        </tr>
		                    </c:when>
		                    <c:otherwise>
		                    	<c:forEach var="m" items="${memberList}">
			                        <tr>
			                        	<td>${m.name }</td>
			                        	<td>${m.jobName }</td>
			                        	<td>${m.deptName }</td>
			                        	<td><input type="checkbox" name="checkNo" value="${m.memberNo}"></td>
			                        </tr>
		                        </c:forEach>
		                   </c:otherwise>     
		                </c:choose>    	
				    </tbody>
				</table>
			</div>
			
			<br>
			
			<div class="searchBtn">
				 <select name="" id="">
					  <option value="">test</option>
					  <option value="">test1</option>
				 </select>
				 <input type="search" name="">
				 <button type="submit">검색</button>
			</div>
			
	      </div>
	
	      <!-- Modal footer -->
	      <div class="modal-footer">
	      </div>
	
	    </div>
	  </div>
	</div>


	<!-- The Modal -->
	<div class="modal" id="myModal2">
	  <div class="modal-dialog">
	    <div class="modal-content">
	
	      <!-- Modal Header -->
	      <div class="modal-header">
	        <h4 class="modal-title">Modal Heading</h4>
	        <button type="button" class="close" data-dismiss="modal">&times;</button>
	      </div>
	
	      <!-- Modal body -->
	      <div class="modal-body">
	      
   			<div style="width:100%; height:350px; overflow:auto">
				<table class="list-area table" >
				    <thead>
				        <tr>
				           <th width="30px">이름</th>
				           <th width="30px">직급</th>
				           <th width="40px">부서</th>
				        </tr>
				    </thead>
				    <tbody>
				    	<c:choose>
				    		<c:when test="${empty memberList}">
		                        <tr>
		                            <td colspan="4"> 참조 가능한 직원이 없습니다.</td>
		                        </tr>
		                    </c:when>
		                    <c:otherwise>
		                    	<c:forEach var="m" items="${memberList}">
			                        <tr>
			                        	<td>${m.name }</td>
			                        	<td>${m.jobName }</td>
			                        	<td>${m.deptName }</td>
			                        	<td><input type="checkbox" name="approNo" value="${m.memberNo}"></td>
			                        </tr>
		                        </c:forEach>
		                   </c:otherwise>     
		                </c:choose>    	
				    </tbody>
				</table>
			</div>
			
			<br>
			
			<div class="searchBtn">
				 <select name="" id="">
					  <option value="">test</option>
					  <option value="">test1</option>
				 </select>
				 <input type="search" name="">
				 <button type="submit">검색</button>
			</div>
			
	      </div>
	
	      <!-- Modal footer -->
	      <div class="modal-footer">
	      </div>
	
	    </div>
	  </div>
	</div>		
	<script>
		$(document).ready(function() {
			
			$("#tplSelect").change(function(){
			    const i = $(this).val();
			    console.log("${tplList[2].tplTitle}")
			});

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
			  
			  var HTMLstring = '<div><p>Hello, world</p><p>Summernote can insert HTML string</p></div>';
			  $('#summernote').summernote('pasteHTML', HTMLstring);

		});
	</script>
	
</body>
</html>