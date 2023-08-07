<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>KARI!</title>
</head>
<body>
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
						<a href="board_view?userName=${nowUser}"><span style="text-align: right">자유게시판</span></a>
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

<c:if test="${cafeName eq 'insta'}">
<div class="image-container">
      <h3>인스타 카페</h3>
</div>
</c:if>

<c:if test="${cafeName eq 'bakery'}">
<div class="image-container">
      <h3>베이커리 카페</h3>
</div>
</c:if>

<c:if test="${cafeName eq 'study'}">
<div class="image-container">
      <h3>스터디 카페</h3>
</div>
</c:if>

<c:if test="${cafeName eq 'mood'}">
<div class="image-container">
      <h3>분위기 좋은 카페</h3>
</div>
</c:if>
<c:if test="${search eq 'search'}">
<div class="image-container">
      <h3>카페 검색</h3>
</div>
</c:if>

<div class="cafeList" style="text-align:center;">
  <ul class="list-restaurants type-single-big top_list_restaurant_list">
  <c:forEach var="list" items="${cvo}" varStatus="status">
              <li class="toplist_list">
                <div class="with-review">
                  <figure class="restaurant-item">
                    <a href="">
                    </a>
                    <figcaption>
                      <div class="info">
                        <span class="title">
                          <a href="cafe_detail?cname=${list.cname}&cno=${list.cno}" >
                           <h3>${status.count}. ${list.cname}</h3>
                          </a>
                        </span>
                        <strong class="point">
                          <span>조회수 : ${list.ccnt }</span>
                        </strong>
                        <p class="etc">주소 : ${list.cadd }</p>
                      </div>
                      
                    </figcaption>
                  </figure>
                  <p class="etc">${list.ccon }</p>
                  <hr>
				</div>
</c:forEach>
 </ul>
</div>
</body>


<style>
ul{
 list-style-type: none;
}
li{
 list-style-type: none;
}

  .image-container {
  	box-shadow: inset 2px 3px 10px 3px rgb(77, 71, 71);
    overflow: hidden;
    display: flex;
    align-items: center;
    justify-content: center;
    width: 100%;
    height: 300px;
    background-color:#E2E2E2;
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