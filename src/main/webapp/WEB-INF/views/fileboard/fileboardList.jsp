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
    <title>자료실</title>
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
                <div class="title-bordered mb-5 has-text-centered">
                    <h1 class="h4"> 자료실 </h1>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- page title -->

<!-- 공지사항 영역 시작 -->
<div class="content" id="content" style="margin-top: 20px;">
    <div class="row column text-center">
        <div class="container">
            <div>
                <%-- <c:if test='${sid eq "admin"}'> --%>
                <c:if test='${sid eq "admin"}'>
                <div class="button-group" style="float:right; margin-left:20px;">
                    <a class="button" href="${path }/fileboard/insert.do">글쓰기</a>
                </div>
                </c:if>
                <%-- </c:if> --%>
                <!-- 검색 엔진 시작 -->
                <form action="${path}/fileboard/list.do" method="get" class="field has-addons has-addons-right" style="margin-top: 100px;">
                    <p class="control">
                <span class="select">
                    <select id="type" name="type">
                        <option value="T"> 제목 </option>
                        <option value="C"> 내용 </option>
                        <option value="W"> 작성자 </option>
                    </select>
                </span>
                    </p>
                    <p class="control">
                        <input class="input" type="text" id="keyword" name="keyword" placeholder="검색어를 입력하세요" value="${page.keyword}" autocomplete="false">
                    </p>
                    <p class="control">
                        <input type="submit" class="button is-primary" value="검색" />
                    </p>
                </form></div>
            <!-- 검색 엔진 끝 -->
            <table class="table">
                <thead>
                <tr>
                    <th width="80">번호</th>
                    <th>제목</th>
                    <th width="100">작성자</th>
                    <th width="120">작성일</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${fileboardList }" var="fileboard" varStatus="status">
                    <tr>
                        <td>${status.count }</td>
                        <td ><a href="${path}/fileboard/detail.do?articleno=${fileboard.articleno }" style="color: #000000;">${fileboard.title }</a></td>
                        <td>${fileboard.id }</td>
                        <td>
                            <fmt:parseDate value="${fileboard.regdate }" var="resdate" pattern="yyyy-MM-dd HH:mm:ss" />
                            <fmt:formatDate value="${resdate }" pattern="yyyy-MM-dd" />
                        </td>
                    </tr>
                </c:forEach>
                <c:if test="${empty fileboardList}">
                    <tr>
                        <td colspan="6" class="has-text-centered"> 등록된 자료가 없습니다. </td>
                    </tr>
                </c:if>
                </tbody>
            </table>
            <!-- pagnation -->
            <nav class="pagination is-rounded is-centered mb-6" role="navigation" aria-label="pagination">
                <c:if test="${curPage > 5}">
                    <a href="${path}/fileboard/list.do?page=${page.blockStartNum - 1}" class="pagination-previous">Previous</a>
                </c:if>
                <c:if test="${page.blockLastNum < page.totalPageCount}">
                    <a href="${path}/fileboard/list.do?page=${page.blockLastNum + 1}" class="pagination-next">Next page</a>
                </c:if>

                <ul class="pagination-list">
                    <c:forEach var="i" begin="${page.blockStartNum}" end="${page.blockLastNum}">
                        <c:choose>
                            <c:when test="${i == curPage}">
                                <li>
                                    <a href="${path}/fileboard/list.do?page=${i}<c:if test="${!empty page.keyword}">&type=${page.type}&keyword=${page.keyword}</c:if>" class="pagination-link is-current" aria-label="Page ${i}" aria-current="page">${i}</a>
                                </li>
                            </c:when>
                            <c:otherwise>
                                <li>
                                    <a href="${path}/fileboard/list.do?page=${i}<c:if test="${!empty page.keyword}">&type=${page.type}&keyword=${page.keyword}</c:if>" class="pagination-link" aria-label="Page ${i}" aria-current="page">${i}</a>
                                </li>
                            </c:otherwise>
                        </c:choose>
                    </c:forEach>
                </ul>
            </nav>
        </div>
    </div>
</div>
<!-- 공지사항 영역 끝-->

<!-- 푸터 영영 시작 -->
<jsp:include page="../layout/footer.jsp"/>
<!-- 푸터 영역 끝 -->

</body>
</html>