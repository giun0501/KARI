<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 쓰기</title>
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
<div class="formcon">
<h1>자유 게시판</h1>
	<form action="board_write" id="reg" method = "get">
		제목 
		<input type="text" class="form-control" id="title" name="title" style="margin: auto;width:50%;text-align:center;"><br>
		내용 <br>
		<textarea cols="50" id="con" class="form-control" rows="10" name="bcon" maxlength="120" style="margin: auto;width:50%;text-align:center;"></textarea><br>
		<input type="submit" class="btn btn-outline-primary" value="글 등록" onclick="clickSubmit();return false;">		
	</form>
</div>
</body>
<script type="text/javascript">


function clickSubmit(){
	var title = document.getElementById('title').value;
	var con = document.getElementById('con').value;
	if(confirm('등록하시겠습니까?')){
		if(title == '' || con== ''){
			alert('제목과 내용을 확인해주세요.');
			return false;
		}else{
			alert('등록완료');
			document.getElementById('reg').submit();
		}
		
	}
}


</script>


<style>
.formcon{
 	display: inline-block;
    text-align: center;
    width: 100%;
	margin: auto;
	/* header에 주지말고 그 안의 요소에 padding을 준다. */
	padding: 20px 0;
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



#seach_form {
	text-align:center;
}

.search-box{
  padding: 10px;
  position: absolute;
  top: 15%;
  left: 50%;
  transform: translate(-50%,-50%);
  height: 30px;
  background-color: #ffffff;
  border: 1px solid #000000;
  border-radius: 30px;
  transition: 0.4s;
  width:30px;
}
.search-box:hover{
  box-shadow: 0px 0px .5px 1px #000000;
  width: 282px;
}
.search-btn{
  text-decoration: none;
  float: right;
  width: 30px;
  height: 30px;
  background-color: #ffffff; <!--돋보기 배경-->
  border-radius: 50%;
  display: flex;
  justify-content: center;
  align-items: center;
  color: #7a7878; <!--돋보기 색-->
}
.search-box:hover > .search-btn{
  background-color: #ffffff;
}
.search-txt{
  display: flex;
  padding: 0;
  width: 0px;
  border:none;
  background: none;
  outline: none;
  float: left;
  font-size: 1rem;
  line-height: 30px;
  transition: .4s;
}
.search-box:hover > .search-txt{
  width: 240px;
  padding: 0 6px;
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