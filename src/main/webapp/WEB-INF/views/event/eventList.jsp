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
    <title>이벤트 목록</title>
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
                    <h1 class="h4"> 이벤트 목록 </h1>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- /page title -->

<!--event List-->

<div class="content" id="content">
    <div class="container" style="margin-top: 60px">
        <c:if test='${sid eq "admin"}'>
            <div class="button-group" style="float:right; margin-left:20px; margin-bottom: 20px">
                <a class="button" href="${path }/event/insert.do">글쓰기</a>
            </div>
        </c:if>
        <table class="table is-fullwidth is-center">
            <thead>
            <tr>
                <th class="has-text-centered" width="80">번호</th>
                <th class="has-text-centered">제목</th>
                <th class="has-text-centered" width="200">이벤트상태</th>
                <th class="has-text-centered" width="120">시작일</th>
                <th class="has-text-centered" width="120">종료일</th>
                <th class="has-text-centered" width="100">조회수</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${eventList }" var="event" varStatus="status">
                <tr>
                    <td class="has-text-centered" style="line-height: 83px">${event.eno }</td>
                    <td >
                        <a href="${path}/event/detail.do?eno=${event.eno }" style="color: #000000; text-decoration: none; line-height: 83px;">${event.title }</a>
                    </td>
                    <c:if test='${event.status eq "1"}'>
                        <td class="has-text-centered" style="line-height: 83px"><span class="tag is-success is-light is-medium">진행 중</span></td>
                    </c:if>
                    <c:if test='${event.status eq "0"}'>
                        <td class="has-text-centered" style="line-height: 83px"><span class="tag is-danger is-light is-medium">종료</span></td>
                    </c:if>
                    <td class="has-text-centered" style="line-height: 83px">${event.sdate}</td>
                    <td class="has-text-centered" style="line-height: 83px">${event.edate}</td>
                    <td class="has-text-centered" style="line-height: 83px">${event.cnt }</td>
                </tr>
            </c:forEach>
            <c:if test="${empty eventList}">
                <tr>
                    <td colspan="6" class="has-text-centered"> 작성된 이벤트가 없습니다. </td>
                </tr>
            </c:if>
            </tbody>
        </table>
        <!-- pagnation -->
        <nav class="pagination is-rounded is-centered mb-6" role="navigation" aria-label="pagination">
            <c:if test="${curPage > 5}">
                <a href="${path}/event/list.do?page=${page.blockStartNum - 1}" class="pagination-previous" >Previous</a>
            </c:if>
            <c:if test="${page.blockLastNum < page.totalPageCount}">
                <a href="${path}/event/list.do?page=${page.blockLastNum + 1}" class="pagination-next" >Next page</a>
            </c:if>

            <ul class="pagination-list">
                <c:forEach var="i" begin="${page.blockStartNum}" end="${page.blockLastNum}">
                    <c:choose>
                        <c:when test="${i == curPage}">
                            <li>
                                <a href="${path}/event/list.do?page=${i}" class="pagination-link is-current" aria-label="Page ${i}" aria-current="page" >${i}</a>
                            </li>
                        </c:when>
                        <c:otherwise>
                            <li>
                                <a href="${path}/event/list.do?page=${i}" class="pagination-link" aria-label="Page ${i}" aria-current="page" >${i}</a>
                            </li>
                        </c:otherwise>
                    </c:choose>
                </c:forEach>
            </ul>
        </nav>
    </div>
</div>
<!-- 이벤트 영역 끝-->
<!-- 푸터 영영 시작 -->
<jsp:include page="../layout/footer.jsp"/>
<!-- 푸터 영역 끝 -->
</body>
</html>