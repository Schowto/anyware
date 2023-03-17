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
		width: 150px;
	}
	.basic td{
		width: 250px;
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
							<option>선택</option>
							<c:forEach var="i" begin="0" end="${fn:length(tplList) - 1}" step="1">
								<c:choose>
									<c:when test="${tplList[i].tplTitle eq appro.tplTitle }">
										<option value="${tplList[i].tplTitle}" selected> 
											${tplList[i].tplTitle}
										</option>
									</c:when>
									<c:otherwise>
										<option value="${tplList[i].tplTitle}"> 
											${tplList[i].tplTitle}
										</option>
									</c:otherwise>
								</c:choose>
							</c:forEach>
						</select>
					</td>
					<th>직급</th>
					<td>${loginUser.jobName}</td>
				</tr>
				<tr>
					<th>작성자</th>
					<td>
						${loginUser.name}
					</td>
					<th>부서</th>
					<td>${loginUser.deptName}</td>
				</tr>
			</table>
			<br>
			<div class="bText">&nbsp;결재선</div>
			<table class="table-bordered order" role="button" data-toggle="modal" data-target="#myModal">
				<tr id='jobName'>
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
				<tr id='name'>
					<td>${appro.writerName}</td>
					<td>${appro.interName}</td>
					<td>${appro.finalName}</td>
				</tr>
			</table>
			<br>
			<table class="table-bordered ref" role="button" data-toggle="modal" data-target="#myModal2">
				<tr>
					<th>참조</th>
					<td id="ref">
					&nbsp;
					<c:forEach var='r' items='${ref}'>
					&nbsp;${r}  
					</c:forEach>
					</td>
				</tr>
			</table>
			<br>
			<table class="table-bordered ref" role="button" data-toggle="modal" data-target="#myModal3">
				<tr>
					<th>열람</th>
					<td id="open">
					&nbsp;
					<c:forEach var='o' items='${open}'>
					&nbsp;${o}  
					</c:forEach>
					</td>
				</tr>
			</table>
			<br>
			<form action="insert.appro" method="post">
				<div class="bText">&nbsp;본문</div>
				<input style="width: 600px;" type="text" name="approTitle" value="${appro.approTitle}">
				<br><br>
				<textarea id="summernote" class="editor" name="approContent"></textarea>
				<br>
				
				<input type="hidden" name="writerNo" value="${loginUser.memberNo}">
				<input type="hidden" name="interNo" value="${appro.interNo }">
				<input type="hidden" name="finalNo" value="${appro.finalNo }">
				<input type="hidden" name="tplNo" value="${appro.tplNo }">
				<input type="hidden" name="refNo" value="${ref }">
				<input type="hidden" name="openNo" value="${open }">
				
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
	        <h3 class="modal-title">결재선 선택</h3>
	        <button type="button" class="close" data-dismiss="modal">&times;</button>
	      </div>
	
	      <!-- Modal body -->
	      <div class="modal-body">
	      
   			<div style="width:100%; height:350px; overflow:auto">
				<table class="list-area table" id="memberList" >
				    <thead>
				        <tr>
				           <th width="30px">이름</th>
				           <th width="30px">직급</th>
				           <th width="40px">부서</th>
				           <th width="5px"></th>
				        </tr>
				    </thead>
				    <tbody>
	                    <tr>
	                        <td colspan="4"> 조회된 직원이 없습니다.</td>
	                    </tr>
				    </tbody>
				</table>
			</div>
			
			<br>
			
			<div class="searchBtn">
				 <select name="memCondition" id="memCondition">
					  <option value="name">이름</option>
					  <option value="job_name">직급</option>
					  <option value="dept_name">부서</option>
				 </select>
				 <input type="search" id="memSearch">
				 <button type="button" id="approBtn">검색</button>
			</div>
			
			<script>
				$(document).ready(function(){
					
					let memberList;
					
					$("#approBtn").on("click", function(){
						
						$.ajax({
							url:"searchMem.appro",
							data:{
								condition:$("#memCondition").val() ,
								search:$("#memSearch").val()
							},
							success:function(memList){
								
								memberList = memList;
								
								let value="";
								
								for (let i=0; i<memberList.length; i++){
									value += "<tr>"
											+ "<td>" + memberList[i].name + "</td>"
											+ "<td>" + memberList[i].jobName + "</td>"
											+ "<td>" + memberList[i].deptName + "</td>"
											+ "<td><input type='checkbox' name='approMem' value='"+ i +"'></td>"
											+"</td>"
								}
								
								$("#memberList tbody").html(value);
							  	
								
							},error:function(){
								
							}
							
						})
						
					})
					
					$(document).on('click','input[name=approMem]',function(){
						
						let count = $("input[name=approMem]:checked").length;
						
						if (count >= 3){
							
							$(this).prop('checked', false);
							alert("결재선은 2명까지 선택가능합니다");
							
						}
						
					})
					
					
					$('#approReg').on('click',function(){
					
						var chkArray = new Array(); 
						
						$('input[name=approMem]:checked').each(function() { 
						    chkArray.push(this.value);
						});
						
						$('#jobName td').eq(1).html(memberList[chkArray[0]].jobName);
						$('#jobName td').eq(2).html(memberList[chkArray[1]].jobName);
						
						$('#name td').eq(1).html(memberList[chkArray[0]].name);
						$('#name td').eq(2).html(memberList[chkArray[1]].name);
						
						$('input[name=interNo]').val(memberList[chkArray[0]].memberNo);
						$('input[name=finalNo]').val(memberList[chkArray[1]].memberNo);
						
						alert("등록되었습니다");
						
					})
					
				})
			</script>
		  
		  </div>
	      
		  <!-- Modal footer -->
	      <div class="modal-footer btn-center">
			 <button class="btn btn-primary" id='approReg'>등록</button>
	      </div>
	      
	    </div>
	  </div>
	</div>
	
	<!-- =============== ref ====================== -->
	
   	<!-- The Modal -->
	<div class="modal" id="myModal2">
	  <div class="modal-dialog">
	    <div class="modal-content">
	
	      <!-- Modal Header -->
	      <div class="modal-header">
	        <h3 class="modal-title">참조 선택</h3>
	        <button type="button" class="close" data-dismiss="modal">&times;</button>
	      </div>
	
	      <!-- Modal body -->
	      <div class="modal-body">
	      
   			<div style="width:100%; height:350px; overflow:auto">
				<table class="list-area table" id="refList" >
				    <thead>
				        <tr>
				           <th width="30px">이름</th>
				           <th width="30px">직급</th>
				           <th width="40px">부서</th>
				           <th width="5px"></th>
				        </tr>
				    </thead>
				    <tbody>
	                    <tr>
	                        <td colspan="4"> 조회된 직원이 없습니다.</td>
	                    </tr>
				    </tbody>
				</table>
			</div>
			
			<br>
			
			<div class="searchBtn">
				 <select name="refCondition" id="refCondition">
					  <option value="name">이름</option>
					  <option value="job_name">직급</option>
					  <option value="dept_name">부서</option>
				 </select>
				 <input type="search" id="refSearch">
				 <button type="button" id="refBtn">검색</button>
			</div>
			
			<script>
				$(document).ready(function(){
					
					let refList;
					
					$("#refBtn").on("click", function(){
						
						$.ajax({
							url:"searchMem.appro",
							data:{
								condition:$("#refCondition").val() ,
								search:$("#refSearch").val()
							},
							success:function(rList){
								
								refList = rList;
								
								let rv= "";
								
								for (let i=0; i< refList.length; i++){
									rv += "<tr>"
											+ "<td>" + refList[i].name + "</td>"
											+ "<td>" + refList[i].jobName + "</td>"
											+ "<td>" + refList[i].deptName + "</td>"
											+ "<td><input type='checkbox' name='refMem' value='"+ i +"'></td>"
											+"</td>"
								}
								
								$("#refList tbody").html(rv);
							  	
								
							},error:function(){
								
							}
							
						})
						
					})
					
					$(document).on('click','input[name=refMem]',function(){
						
						let count = $("input[name=refMem]:checked").length;
						
						if (count >= 8){
							
							$(this).prop('checked', false);
							alert("참조 인원은 8명까지 선택가능합니다");
							
						}
						
					})
					
					
					$('#refReg').on('click',function(){
					
						let refArray = new Array(); 
						let refNo = new Array();
						
						$('input[name=refMem]:checked').each(function() {
						    refArray.push(this.value);
						});
						
						let r = "";
						
						for (let i=0; i<refArray.length; i++){
							r += " " + refList[refArray[i]].name; 
							refNo.push(refList[refArray[i]].memberNo)
						}
						$("#ref").html(r);
						
						alert("등록되었습니다");
						
						$("input[name=refNo]").val(refNo);
						
					})
					
				})
			</script>
			
	      </div>
	      
		  <!-- Modal footer -->
	      <div class="modal-footer btn-center">
			 <button class="btn btn-primary" id='refReg'>등록</button>
	      </div>
	      
	    </div>
	  </div>
	</div>

	<!--=======================================open==================================== -->
 	<!-- The Modal -->
	<div class="modal" id="myModal3">
	  <div class="modal-dialog">
	    <div class="modal-content">
	
	      <!-- Modal Header -->
	      <div class="modal-header">
	        <h3 class="modal-title">열람 선택</h3>
	        <button type="button" class="close" data-dismiss="modal">&times;</button>
	      </div>
	
	      <!-- Modal body -->
	      <div class="modal-body">
	      
   			<div style="width:100%; height:350px; overflow:auto">
				<table class="list-area table" id="openList" >
				    <thead>
				        <tr>
				           <th width="30px">이름</th>
				           <th width="30px">직급</th>
				           <th width="40px">부서</th>
				           <th width="5px"></th>
				        </tr>
				    </thead>
				    <tbody>
	                    <tr>
	                        <td colspan="4"> 조회된 직원이 없습니다.</td>
	                    </tr>
				    </tbody>
				</table>
			</div>
			
			<br>
			
			<div class="searchBtn">
				 <select name="openCondition" id="openCondition">
					  <option value="name">이름</option>
					  <option value="job_name">직급</option>
					  <option value="dept_name">부서</option>
				 </select>
				 <input type="search" id="openSearch">
				 <button type="button" id="openBtn">검색</button>
			</div>
			
			<script>
				$(document).ready(function(){
					
					let openList;
					
					$("#openBtn").on("click", function(){
						
						$.ajax({
							url:"searchMem.appro",
							data:{
								condition:$("#openCondition").val() ,
								search:$("#openSearch").val()
							},
							success:function(oList){
								
								openList = oList;
								
								let ov= "";
								
								for (let i=0; i< openList.length; i++){
									ov += "<tr>"
											+ "<td>" + openList[i].name + "</td>"
											+ "<td>" + openList[i].jobName + "</td>"
											+ "<td>" + openList[i].deptName + "</td>"
											+ "<td><input type='checkbox' name='openMem' value='"+ i +"'></td>"
											+"</td>"
								}
								
								$("#openList tbody").html(ov);
							  	
								
							},error:function(){
								
							}
							
						})
						
					})
					
					$(document).on('click','input[name=openMem]',function(){
						
						let count = $("input[name=openMem]:checked").length;
						
						if (count >= 8){
							
							$(this).prop('checked', false);
							alert("열람 인원은 8명까지 선택가능합니다");
							
						}
						
					})
					
					
					$('#openReg').on('click',function(){
					
						let openArray = new Array(); 
						let openNo = new Array();
						
						$('input[name=openMem]:checked').each(function() {
							openArray.push(this.value);
						});
						
						let r = "";
						
						for (let i=0; i<openArray.length; i++){
							r += " " + openList[openArray[i]].name;
							openNo.push(openList[openArray[i]].memberNo)
						}
						$("#open").html(r);
						
						alert("등록되었습니다");
						
						$("input[name=openNo]").val(openNo);
						
					})
					
				})
			</script>
			
	      </div>
	      
		  <!-- Modal footer -->
	      <div class="modal-footer btn-center">
			 <button class="btn btn-primary" id='openReg'>등록</button>
	      </div>
	      
	    </div>
	  </div>
	</div>


	<script>
		$(document).ready(function() {
			
			$("#tplSelect").change(function(){
				
				if( $(this).val() != '선택'){
					
				    const i = $(this).val();
				    
				    $.ajax({
						url:"selectTpl.appro",
						data:{tplTitle:i},
						success:function(approTpl){
							
							$('#summernote').summernote('reset');
							$('#summernote').summernote('pasteHTML', approTpl.tplContent);
							
							$('input[name=tplNo]').val(approTpl.tplNo);
							
						},error:function(){
							
						}
					})
					
				}
				
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
			
			$('#summernote').summernote('pasteHTML', "${appro.approContent}");
			
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
			
		});
	</script>
	
</body>
</html>