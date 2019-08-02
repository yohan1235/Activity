<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<c:set var="mNum" value="${sessionScope.NUM}"/>
<title>Insert title here</title>
</head>
<body>
	<div class="col-lg-3">
        <h1 class="my-4">MyPage</h1>
        <div class="list-group">
          <a href="mypage.jsp" class="list-group-item">구매내역</a>
          <a href="mylist.do?tag=myUpload&mNum=${mNum}" class="list-group-item">등록내역</a>
          <a href="list.do?tag=upload&category=0" class="list-group-item">상품등록</a>
          <a href="preEdit.do" class="list-group-item">정보수정</a>
        </div>
      </div>
      <!-- /.col-lg-3 -->
</body>
</html>