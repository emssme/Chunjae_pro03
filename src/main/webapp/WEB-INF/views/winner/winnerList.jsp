<%@ page contentType="text/html;" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge" />
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
  <title>당첨자 발표 목록</title>
  <jsp:include page="../setting/head.jsp"></jsp:include>
</head>
<body>

<!--헤더 영역 시작 -->
<jsp:include page="../layout/header.jsp"/>
<!-- page title -->
<section class="section-sm">
  <div class="container">
    <div class="columns is-multiline">
      <div class="column is-12">
        <div class="title-bordered mb-5 has-text-centered">
          <h1 class="h4"> 당첨자 발표 목록 </h1>
        </div>
      </div>
    </div>
  </div>
</section>
<!-- /page title -->

<!--event List-->

<div class="content" id="content">
  <div class="container" style="margin-top: 60px;">
    <div>
      <table class="table">
        <thead>
        <tr>
          <th width="10%" class="has-text-centered">글번호</th>
          <th width="50%">글제목</th>
          <th width="15%" class="has-text-centered">작성자</th>
          <th width="25%" class="has-text-centered">작성일</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${winnerList }" var="win" varStatus="status">
          <tr>
            <td>${win.wno }</td>
            <td><a href="${path}/winner/detail.do?wno=${win.wno}"
                   style="color: #000000;">${win.title }</a></td>
            <td class="has-text-centered">${win.author }</td>
            <td class="has-text-centered">
              <fmt:parseDate value="${win.resdate }" var="resdate" pattern="yyyy-MM-dd HH:mm:ss"/>
              <fmt:formatDate value="${resdate }" pattern="yyyy-MM-dd"/>
            </td>
          </tr>
        </c:forEach>
        <c:if test="${empty winnerList}">
          <tr>
            <td colspan="6" class="has-text-centered"> 게시글이 없습니다.</td>
          </tr>
        </c:if>
        </tbody>
      </table>
      <!-- pagnation -->
      <nav class="pagination is-rounded is-centered mb-6" role="navigation" aria-label="pagination">
        <c:if test="${curPage > 5}">
          <a href="${path}/winner/list.do?page=${page.blockStartNum - 1}" class="pagination-previous">Previous</a>
        </c:if>
        <c:if test="${page.blockLastNum < page.totalPageCount}">
          <a href="${path}/winner/list.do?page=${page.blockLastNum + 1}" class="pagination-next">Next
            page</a>
        </c:if>

        <ul class="pagination-list">
          <c:forEach var="i" begin="${page.blockStartNum}" end="${page.blockLastNum}">
            <c:choose>
              <c:when test="${i == curPage}">
                <li>
                  <a href="${path}/winner/list.do?page=${i}" class="pagination-link is-current"
                     aria-label="Page ${i}" aria-current="page">${i}</a>
                </li>
              </c:when>
              <c:otherwise>
                <li>
                  <a href="${path}/winner/list.do?page=${i}" class="pagination-link"
                     aria-label="Page ${i}" aria-current="page">${i}</a>
                </li>
              </c:otherwise>
            </c:choose>
          </c:forEach>
        </ul>
      </nav>
    </div>
  </div>
</div>
<!-- 이벤트 영역 끝-->
<!-- 푸터 영영 시작 -->
<jsp:include page="../layout/footer.jsp"/>
<!-- 푸터 영역 끝 -->
</body>
</html>