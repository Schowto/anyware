<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
   <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.3/dist/jquery.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<style>
table{
    text-align: center;
    margin-top: 13px;
}
.button {
    border-radius: 5px;
    border: 1px solid rgb(221, 221, 221);
    font-size: 14px;
    margin-top: 13px;
}
.page_wrap {
	text-align:center;
	font-size:0;
 }
.page_nation {
	display:inline-block;
}
.page_nation .none {
	display:none;
}
.page_nation a {
	display:block;
	margin:0 3px;
	float:left;
	border:1px solid #e6e6e6;
	width:28px;
	height:28px;
	line-height:28px;
	text-align:center;
	background-color:#fff;
	font-size:13px;
	color:#999999;
	text-decoration:none;
}
.page_nation .arrow {
	border:1px solid #ccc;
}
.page_nation .pprev {
	background:#f8f8f8 url('arrow\page_pprev.png') no-repeat center center;
	margin-left:0;
}
.page_nation .prev {
	background:#f8f8f8 url('arrow\page_prev.png') no-repeat center center;
	margin-right:7px;
}
.page_nation .next {
	background:#f8f8f8 url('arrow\page_next.png') no-repeat center center;
	margin-left:7px;
}
.page_nation .nnext {
	background:#f8f8f8 url('arrow\page_nnext.png') no-repeat center center;
	margin-right:0;
}
.page_nation a.active {
	background-color:#42454c;
	color:#fff;
	border:1px solid #42454c;
}
</style>    
</head>
<body>
	<!-- 사이드 바  -->
	<jsp:include page="../common/sidebar.jsp"></jsp:include>
	
	<!-- 세부 메뉴 -->
	<jsp:include page="../common/boardmenu.jsp"></jsp:include>
	
	<!-- 세부 내용 -->
	<div class="content">
	
	<div class="container">
            <input type="text" value="제목으로 검색하기" class="button">
            <button type="submit" class="button">검색</button>
            <br>

            <table class="table table-hover">
              <thead>
                  <th>번호</th>
                  <th>제목</th>
                  <th>작성자</th>
                  <th>작성일</th>
                  <th>조회수</th>
                </tr>
              </thead>
              <tbody style="border: white">
                <tr>
                  <td>1</td>
                  <td>●▅▇█▇▆▅▄▇ </td>
                  <td>이소민 사원</td>
                  <td>2023-11-06</td>
                  <td>27</td>
                </tr>
                <tr>
                  <td>1</td>
                  <td>●▅▇█▇▆▅▄▇ </td>
                  <td>이소민 사원</td>
                  <td>2023-11-06</td>
                  <td>27</td>
                </tr>
                <tr>
                  <td>1</td>
                  <td>●▅▇█▇▆▅▄▇ </td>
                  <td>이소민 사원</td>
                  <td>2023-11-06</td>
                  <td>27</td>
                </tr>
                <tr>
                  <td>1</td>
                  <td>●▅▇█▇▆▅▄▇ </td>
                  <td>이소민 사원</td>
                  <td>2023-11-06</td>
                  <td>27</td>
                </tr>
                <tr>
                  <td>1</td>
                  <td>●▅▇█▇▆▅▄▇ </td>
                  <td>이소민 사원</td>
                  <td>2023-11-06</td>
                  <td>27</td>
                </tr>
                <tr>
                  <td>1</td>
                  <td>●▅▇█▇▆▅▄▇ </td>
                  <td>이소민 사원</td>
                  <td>2023-11-06</td>
                  <td>27</td>
                </tr>
                <tr>
                  <td>1</td>
                  <td>●▅▇█▇▆▅▄▇ </td>
                  <td>이소민 사원</td>
                  <td>2023-11-06</td>
                  <td>27</td>
                </tr>
                <tr>
                  <td>1</td>
                  <td>●▅▇█▇▆▅▄▇ </td>
                  <td>이소민 사원</td>
                  <td>2023-11-06</td>
                  <td>27</td>
                </tr>
                <tr>
                  <td>1</td>
                  <td>●▅▇█▇▆▅▄▇ </td>
                  <td>이소민 사원</td>
                  <td>2023-11-06</td>
                  <td>27</td>
                </tr>
                <tr>
                  <td>1</td>
                  <td>●▅▇█▇▆▅▄▇ </td>
                  <td>이소민 사원</td>
                  <td>2023-11-06</td>
                  <td>27</td>
                </tr>
              </tbody>
            </table>
            <br><br><br>
            
            <div class="page_wrap">
              <div class="page_nation">
                 <a class="arrow pprev" href="#"></a>
                 <a class="arrow prev" href="#"></a>
                 <a href="#" class="active">1</a>
                 <a href="#">2</a>
                 <a href="#">3</a>
                 <a href="#">4</a>
                 <a href="#">5</a>
                 <a href="#">6</a>
                 <a href="#">7</a>
                 <a href="#">8</a>
                 <a href="#">9</a>
                 <a href="#">10</a>
                 <a class="arrow next" href="#"></a>
                 <a class="arrow nnext" href="#"></a>
              </div>
           </div>
        
          </div>
          
	
	</div>
</body>
</html>