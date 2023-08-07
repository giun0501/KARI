<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자유 게시판</title>
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">
</head>
<body>
<c:if test="${nowUser != null }">
<div style="text-align:right"><span style="text-align:right;"><font style="font-style: italic;">${nowUser }님 어서오세요</font></span></div>
</c:if>
<header>
	<div class="logo">
		<a href="<%=request.getContextPath()%>/"><img
			src="resources/img/logo.png" alt="홈"></a>
	</div>
	<div id="header">
		<div class="container">
			<div class="container-left clearfix">
				<div class="menu clearfix">
					<div class="menu-item">
						<a href="board_view"><span style="text-align: right">자유게시판</span></a>
					</div>
					<div class="menu-item">
						<a href="location"><span style="text-align: right">주변카페찾기</span></a>
					</div>
					<div class="menu-item">
						<c:if test="${nowUser !=null }">
						<a href="logout"><span style="text-align: right">로그아웃</span></a>
						&nbsp;&nbsp;<a href="myPage_view?id=${nowUser }"><span style="text-align: right">마이페이지</span></a>
						</c:if>
						<c:if test="${nowUser == null }">
						<a href="login_view"><span style="text-align: right">로그인</span></a>
						</c:if>
					</div>
				</div>
			</div>
		</div>
	</div>
	</header>
<hr>
<h1>자유 게시판</h1>
<table class="table table-hover table-striped text-center" border=1 width=1000>
	<tr>
		<td>글번호</td>
		<td>작성자</td>
		<td>제목</td>
		<td>작성날짜</td>
		
	</tr>
	<c:forEach var = "boardvo" items = "${bList}">
		<tr>
			<td>${boardvo.num}</td>
			<td>${boardvo.id}</td>
			<td><a href="board_detail?viewno=${boardvo.num}">${boardvo.title}</a></td>
			<td>${boardvo.indate}</td>
		</tr>
	</c:forEach>

	<tr>
		<td colspan=8>
			<c:if test = "${pageVO.prev}">
				<a href="board_view?page=${pageVO.startPage -1}$search_word=${pageVO.search_word}">[이전]</a>
			</c:if>
			<c:forEach begin="${pageVO.startPage}" end="${pageVO.endPage}" var="idx">
				<a href="board_view?page=${idx}&search_word=${pageVO.search_word}">${idx}</a>
			</c:forEach>
			<c:if test="${pageVO.next}">
				<a href="board_view?page=${pageVO.endPage +1}&search_word=${pageVO.search_word}">[다음]</a>
			</c:if>
		</td>
	</tr>
</table>
<c:if test="${nowUser != null }">
<div style="text-align: right; margin-top: 10px; margin-right: 20px;">
<a href="write_view"><input type="button" class="btn btn-primary" value="글쓰기"></a>
</div>
</c:if>
<hr>
	<!-- <a href="list_board">[게시물확인]</a> -->
<div id="search_form" style="text-align:center">	
	<form action="board_view" method = "get">
		<div class="search-box">
			<input type="text" class="search-txt" name="search_word" placeholder="제목검색">
			<button type="submit" value="검색" style="border:none"><i class="bi bi-search" ></i></button>
         
		</div>
		
	</form>
</div>
</body>



<style>
  .image-container {
    overflow: hidden;
    display: flex;
    align-items: center;
    justify-content: center;
    width: 100%;
    height: 500px;
  }
  
  .image-container img {
    width: 100%;
    height: auto;
  }




.header {

}

body {
	margin: 0;
	padding: 0;
}

#header {
	background-color: whtie;
	border-bottom: 1px solid lightgray;
}

.container {
	width: 100%;
	margin: auto;
	/* header에 주지말고 그 안의 요소에 padding을 준다. */
	padding: 20px 0;
}

.container-left {
	
}

.logo {
	float: left;
}
/* 이미지마다 클래스를 주게 되면 효율적인 코드 작성이 아니다. */
.logo img {
	width: 150px;
	hight: 50px;
	/* img밑에 여백 없애는 코드 */
	display: block;
}

.menu {
	float: right;
}

.menu-item {
	float: left;
	/* 수직으로 가운데 정렬은 안쪽 여백을 둔다 */
	padding: 8px 10px;
	font-weight: bold;
}
/* float: left로 가로로 정렬 하고 부모 태그에 clearfix 클래스를 추가해준다*/
.clearfix::after {
	content: "";
	display: block;
	clear: both;
}

a {
	color: inherit;
	text-decoration: none;
}


.jbFixed {
        position: fixed;
        top: 0px;
      }
</style>


</html>