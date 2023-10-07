<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
  <title> 회원약관 </title>
  <c:set var="path" value="${pageContext.request.contextPath}"/>
  <jsp:include page="../setting/head.jsp" />

</head>
<body>
<%@ include file="../layout/header.jsp"%>

<!-- page title -->
<section class="section-sm">
  <div class="container">
    <div class="columns is-multiline">
      <div class="column is-12">
        <div class="title-bordered mb-5 has-text-centered" >
          <h1 class="h4"> 로그인 </h1>
        </div>
      </div>
    </div>
  </div>
</section>
<!-- /page title -->

<!-- 본문 영역 시작 -->
<section class="section">
  <div class="container" id="content">
    <div class="columns is-centered">
      <div class="column is-8-desktop">
        <div class="has-background-white card-content shadow-down p-6">
          <form action="${path}/member/loginpro.do" method="post" style="width: 300px; margin: 0 auto;">
            <div class="field">
              <p class="control">
                <input class="input" type="text" id="id" name="id" placeholder="아이디">
              </p>
            </div>
            <div class="field">
              <p class="control">
                <input class="input" type="password" id="pw" name="pw" placeholder="비밀번호">
              </p>
            </div>
            <div class="field">
              <p class="control">
                <input class="button is-primary" type="submit" value="LOGIN" style="width: 100%">
              </p>
            </div>
          </form>
        </div>
      </div>
    </div>
  </div>
</section>
<!-- 본문 영역 종료 -->


<%@ include file="../layout/footer.jsp"%>
</body>
</html>
