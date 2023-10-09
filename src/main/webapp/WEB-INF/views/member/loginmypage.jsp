<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri = "http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>본인 확인</title>
    <jsp:include page="../setting/head.jsp"></jsp:include>
</head>
<body>

<!-- 헤더 영역 시작 -->
<jsp:include page="../layout/header.jsp" />
<!-- 헤더 영역 끝 -->

<!-- page title -->
<section class="section-sm">
    <div class="container">
        <div class="columns is-multiline">
            <div class="column is-12">
                <div class="title-bordered mb-5 has-text-centered" >
                    <h1 class="h4"> 비밀번호 확인 </h1>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- /page title -->

<form action="${path }/member/loginpro2.do" method="post" name="loginForm">
    <div class="container is-max-desktop" style="margin-top: 150px; margin-bottom: 150px">
        <table class="table"  style="margin-left: 320px">
            <tbody>
            <tr>
                <p style="margin-left: 200px;margin-bottom: 30px"> <strong style="font-size: 26px; font-weight: bold;">보안을 위해 비밀번호를 다시 한번 입력 해주세요.</strong></p>
            </tr>
            <tr>
                <th><label for="pw">비밀번호</label></th>
                <td><input type="password" name="pw" id="pw"  class="input" placeholder="비밀번호 입력" required>
                    <!--  pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}"  -->
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <input type="submit" class="button is-primary" value="로그인" style="width: 100%">
                </td>
            </tr>
            </tbody>
        </table>
    </div>
</form>

<jsp:include page="../layout/footer.jsp"/>
</body>
</html>
