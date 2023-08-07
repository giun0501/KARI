<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.1/css/all.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css"/>
<title>KaRi!</title>
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
						<a href="board_view?userName=${nowUser}"><span style="text-align: right" id="free-board">자유게시판</span></a>
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
<div class="image-container">
        <img src="resources/img/main2.jpg" >
</div>

<!-- partial:index.partial.html -->
<form id = "searchForm" action="cafe_search" method="get">
<div class="search__container">
    <p class="search__title">
        	카페 검색
    </p>
    <input class="search__input" name="cname" type="text" placeholder="Search">
</div>

<div class="credits__container">
    <p class="credits__text">즐거운 카페생활 KARI!</p>
</div>
</form>






<h3 style="margin-left:5%;margin-top:10px;">CAFE REVIEW</h3>
<div class="cafes">
<div class="contain text-center">
  <div class="row row-cols-2">
    <div class="col">
    <a href="cafe_view?cate=mood" ><img src="resources/img/mood.jpg" style="width:530px;height:200px;margin-left:10px;"></a>
    <div class="jb-text">
    	<a href="cafe_view?cate=mood">분위기 좋은 카페</a>
    	<p style="font-size:15px;">분 좋 카 !</p>
    </div>
    </div>
    <div class="col">
    <a href="cafe_view?cate=study"><img src="resources/img/study.jpg" style="width:530px;height:200px;"></a>
	<div class="jb-text">
    	<a href="cafe_view?cate=study">스터디 카페</a>
    	<p style="font-size:15px;">조용하니 공부하기 딱이네</p>
    </div>    
    </div>
    <div class="col">
    <a href="cafe_view?cate=insta"><img src="resources/img/insta.jpg" style="width:530px;height:200px; margin-top:10px;margin-left:10px;"></a>
    <div class="jb-text">
    	<a href="cafe_view?cate=insta">인스타 카페</a>
    	<p style="font-size:13px;">인스타 사진올리기 딱좋은 날씨구만</p>
    </div>
    </div>
    <div class="col">
    <a href="cafe_view?cate=bakery"><img src="resources/img/bread.jpg" style="width:530px;height:200px; margin-top:10px;"></a>
    <div class="jb-text">
    	<a href="cafe_view?cate=bakery">베이커리 카페</a>
    	<p style="font-size:15px;">존맛탱 빵 카페</p>
    </div>
    </div>
  </div>
</div>
</div>
<h3 style="margin-left:5%">광고</h3>
<div class="add">
<div class="container text-center">
  <div class="row">
    <div class="col">
      <a href="https://www.starbucks.co.kr/index.do" target="_blank"><img src="resources/img/starbucks.jpg" style="width:355px;height:200px; margin-top:10px;"></a>
      <div class="jb-text">
    	
    </div>
    </div>
    <div class="col">
      <a href="https://www.ediya.com/" target="_blank"><img src="resources/img/ediya.jpg" style="width:355px;height:200px; margin-top:10px;"></a>
      <div class="jb-text">
    	
    </div>
    </div>
    <div class="col">
      <a href="https://www.caffe-pascucci.co.kr/" target="_blank"><img src="resources/img/pas.PNG" style="width:360px;height:200px; margin-top:10px;"></a>
      <div class="jb-text">
    	
    </div>
    </div>
  </div>
</div>
</div>
<h3 style="margin-left:5%">자유 게시판</h3>
<div class="board">
<table class="table table-hover table-striped text-center" border=1 >
	<tr>
		<td>글번호</td>
		<td>작성자</td>
		<td>제목</td>
		<td style="margin-right:5%">작성날짜</td>
		
	</tr>
	<c:forEach var ="boardvo" items = "${bList}">
		<tr>
			<td>${boardvo.num}</td>
			<td>${boardvo.id}</td>
			<td><a href="board_detail?viewno=${boardvo.num}">${boardvo.title}</a></td>
			<td style="margin-right:5%">${boardvo.indate}</td>
		</tr>
	</c:forEach>

	<tr>
		<td colspan=8>
			<c:if test = "${pageVO.prev}">
				<a href="board_view?page=${pageVO.startPage -1}">[이전]</a>
			</c:if>
			<c:forEach begin="${pageVO.startPage}" end="${pageVO.endPage}" var="idx">
				<a href="<%=request.getContextPath()%>/?page=${idx}">${idx}</a>
			</c:forEach>
			<c:if test="${pageVO.next}">
				<a href="<%=request.getContextPath()%>/?page=${pageVO.endPage +1}">[다음]</a>
			</c:if>
		</td>
	</tr>
</table>
</div>
</body>
<script>
function enterkey() {
	var user ='${nowUser}';
    if (window.event.keyCode == 13) {
         document.getElementById("searchForm").submit();
    }else if(window.event.keyCode == 13 && user == ''){
    	alert('로그인 후 이용하세요.');
    }
}




</script>


<style>
@import url('https://fonts.googleapis.com/css?family=Raleway:400,700,900');
.search__container {
        padding-top: 64px;
        margin-left:30%;
        margin-right:30%;
    }

.search__title {
        font-size: 22px;
        font-weight: 900;
        text-align: center;
        color: #ff8b88;
    }

.search__input {
        width: 100%;
        padding: 12px 24px;

        background-color: transparent;
        transition: transform 250ms ease-in-out;
        font-size: 14px;
        line-height: 18px;
        
        color: #575756;
        background-color: transparent;
/*         background-image: url(http://mihaeltomic.com/codepen/input-search/ic_search_black_24px.svg); */
 
      	background-image: url("data:image/svg+xml;charset=utf8,%3Csvg xmlns='http://www.w3.org/2000/svg' width='24' height='24' viewBox='0 0 24 24'%3E%3Cpath d='M15.5 14h-.79l-.28-.27C15.41 12.59 16 11.11 16 9.5 16 5.91 13.09 3 9.5 3S3 5.91 3 9.5 5.91 16 9.5 16c1.61 0 3.09-.59 4.23-1.57l.27.28v.79l5 4.99L20.49 19l-4.99-5zm-6 0C7.01 14 5 11.99 5 9.5S7.01 5 9.5 5 14 7.01 14 9.5 11.99 14 9.5 14z'/%3E%3Cpath d='M0 0h24v24H0z' fill='none'/%3E%3C/svg%3E");
        background-repeat: no-repeat;
        background-size: 18px 18px;
        background-position: 95% center;
        border-radius: 50px;
        border: 1px solid #575756;
        transition: all 250ms ease-in-out;
        backface-visibility: hidden;
        transform-style: preserve-3d;
    }

.search__input::placeholder {
            color: rgba(87, 87, 86, 0.8);
            text-transform: uppercase;
            letter-spacing: 1.5px;
        }

.search__input:hover,
        .search__input:focus {
            padding: 12px 0;
            outline: 0;
            border: 1px solid transparent;
            border-bottom: 1px solid #575756;
            border-radius: 0;
            background-position: 100% center;
        }

.credits__container {
        margin-top: 24px;
    }

.credits__text {
        text-align: center;
        font-size: 13px;
        line-height: 18px;
    }

.credits__link {
        color: #ff8b88;
        text-decoration: none;
        transition: color 250ms ease-in;
    }

.credits__link:hover,
        .credits__link:focus {
            color: rgb(191, 137, 135);
        }





.cafes{
	margin:10px 5% 1% 0%;
}

.add{
	margin:5px 5% 5px 5%;
}

.board {
	margin:2% 5% 1% 5%;
}

body {
	
	margin: 0;
	padding: 0;
}
.col {
	width: 40%;
	margin: 10px auto;
	position: relative;
	padding:0;
}
.col img {
	width: 100%;
	vertical-align: middle;
}
.jb-text {
	padding: 5px 10px;
	background-color:rgba(0, 0, 0, 0.3);/*까만색(0,0,0) 20% 불투명도*/
	text-align: center;
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate( -50%, -50% );
	color:white;
	font-size:25px;
	font-weight:bold;
	font-family:맑은고딕;
}

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


/* .jbFixed {
        position: fixed;
        top: 0px;
      } */
</style>



</html>
