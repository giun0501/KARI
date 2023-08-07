<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>KARI!</title>
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
<div class="top-wrap" style="margin-top:10px;">
	
	<div id="map" style="width:360px;height:400px;float:right;margin-right:10px;"></div>
	<div class="contents" style="width:70%;">
		<div class="cafeimg" style="text-align:center;margin-left:10px;">
			<img src="${cinfo.filename }" style="width:100%;height:200px;">
		</div>
		<br>
			<div class="title" style="margin-left:10px;">
					<h2>${cinfo.cname}</h2> 
					<i class="bi bi-eye"></i>&nbsp;<span>${cinfo.ccnt }</span>
				<br>
				<span>${cinfo.ccon }</span>
			</div>
		<hr>
		<div class = "cafe_detail-container" style="margin-left:10px;">
			<div class="A"><strong>주소</strong></div>
			<div class="B">${cinfo.cadd}</div>
			<div class="C"><strong>전화번호</strong></div>
			<div class="D">${cinfo.cphone}</div>
			<div class="E"><strong>카페 종류</strong></div>
			<div class="F">${cinfo.cate}</div>
			<div class="G"><strong>가격대</strong></div>
			<div class="H">${cinfo.cpay}</div>
			<div class="I"><strong>영업시간</strong></div>
			<div class="J">${cinfo.chour}</div>
		</div>
		
		<a href="reviewWrite_view?cname=${cinfo.cname}&cno=${cinfo.cno}"><input type="button" value="리뷰쓰기" class="btn btn-secondary" style="margin-top:10px;margin-left:10px;"></a>
	</div>
</div>

<br>
<h2 style="margin-left:10px;">Review</h2>
<br>
<c:forEach var="reviewList" items="${rList}">
	<section style="margin-left:10px;">
		<!-- id title point con filename -->
		<h4>${reviewList.title}</h4>
		<h6>${reviewList.id}</h6>
		<c:if test="${reviewList.point eq '1'}">
			<img src="resources/img/star2.png" style="width:30px;height:30px;">
		</c:if>
		<c:if test="${reviewList.point eq '2'}">
			<img src="resources/img/star2.png" style="width:30px;height:30px;"><img src="resources/img/star2.png" style="width:30px;height:30px;">
		</c:if>
		<c:if test="${reviewList.point eq '3'}">
			<img src="resources/img/star2.png" style="width:30px;height:30px;"><img src="resources/img/star2.png" style="width:30px;height:30px;"><img src="resources/img/star2.png" style="width:30px;height:30px;">
		</c:if>
		<c:if test="${reviewList.point eq '4'}">
			<img src="resources/img/star2.png" style="width:30px;height:30px;"><img src="resources/img/star2.png" style="width:30px;height:30px;"><img src="resources/img/star2.png" style="width:30px;height:30px;"><img src="resources/img/star2.png" style="width:30px;height:30px;">
		</c:if>
		<c:if test="${reviewList.point eq '5'}">
			<img src="resources/img/star2.png" style="width:30px;height:30px;"><img src="resources/img/star2.png" style="width:30px;height:30px;"><img src="resources/img/star2.png" style="width:30px;height:30px;"><img src="resources/img/star2.png" style="width:30px;height:30px;"><img src="resources/img/star2.png" style="width:30px;height:30px;">
		</c:if>
		<br>
		<p>${reviewList.state}</p>
		<p>${reviewList.con}</p><br>
		<img src="download?filename=${reviewList.filename}" style="width:350px;height:250px;"><br>
		<c:if test="${nowUser eq reviewList.id}">
		<a href="delReview?delno=${reviewList.rno}"><input type="button" value="삭제" class="btn btn-danger" style="margin-top:10px;"></a>
		</c:if>
		<hr>
	</section>
</c:forEach>













</body>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=3e8d4a2e06d756785728a72550f9f407&libraries=services"></script>
<script>

var lat = '${cinfo.lat}';
var lon = '${cinfo.lng}';

console.log('lat : ' + lat + " lon : " + lon);

var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
mapOption = { 
    center: new kakao.maps.LatLng(lat,lon), // 지도의 중심좌표
    level: 1 // 지도의 확대 레벨
};

//지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
var map = new kakao.maps.Map(mapContainer, mapOption); 

var markerPosition  = new kakao.maps.LatLng(lat,lon); 

var marker = new kakao.maps.Marker({
    position: markerPosition
});

marker.setMap(map);

</script>


<style>

  .cafe_detail-container {     
    display: grid;          
    grid-template-columns: 100px 500px;  
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