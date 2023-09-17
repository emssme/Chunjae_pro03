<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title> 커뮤니티 </title>
    <c:set var="path" value="${pageContext.request.contextPath}"/>
    <jsp:include page="../setting/head.jsp" />

    <style>
        h1 { font-size: 40pt; }
        h3 { font-size: 20pt; }
        input[type=radio] {
            display: none;
        }
    </style>
</head>
<body>
<%@ include file="../layout/header.jsp"%>

<!-- page title -->
<section class="section-sm">
    <div class="container">
        <div class="columns is-multiline">
            <div class="column is-12">
                <div class="title-bordered mb-5 has-text-centered">
                    <h1 class="h4">커뮤니티</h1>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- /page title -->

<section class="section">
    <div class="container">
        <div class="columns is-desktop is-multiline">
            <aside class="column is-2-desktop">
                <div class="widget" style="margin-top: 90px;">
                    <h5 class="widget-title"><span>카테고리</span></h5>
                    <ul class="list-unstyled widget-list">
                        <c:if test="${empty curCategory}">
                            <li><label class="is-active">
                        </c:if>
                        <c:if test="${!empty curCategory}">
                            <li><label>
                        </c:if>
                                <input type="radio" checked="checked" onclick="javascript:location.href='${path}/community/list.do'"/> 전체
                            </label></li>
                        <c:forEach var="cate" items="${categories}">
                            <c:if test="${cate.cate eq curCategory}">
                            <li><label style="font-weight: bold;">
                            </c:if>
                                <c:if test="${cate.cate ne curCategory}">
                                <li><label>
                                </c:if>
                                    <input type="radio" checked="checked" onclick="javascript:location.href='${path}/community/list.do?cate=${cate.cate}'"/> ${cate.cateName}
                                </label></li>
                        </c:forEach>
                    </ul>
                </div>
            </aside>
            <div class="column is-10-desktop">
            <form action="${path}/community/list.do" method="get" class="field has-addons has-addons-right">
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
                    <c:if test="${!empty curCategory}">
                        <input type="hidden" id="cate" name="cate" value="${curCategory}">
                    </c:if>
                    <input class="input" type="text" id="keyword" name="keyword" placeholder="검색어를 입력하세요" autocomplete="off" value="${page.keyword}">
                </p>
                <p class="control">
                    <input type="submit" class="button is-primary" value="검색" />
                </p>
            </form>

            <table class="table is-hoverable is-fullwidth">
                <thead>
                <tr>
                    <th class="has-text-centered"> # </th>
                    <th class="has-text-centered"> 카테고리 </th>
                    <th class="has-text-centered"> 제목 </th>
                    <th class="has-text-centered"> 작성자 </th>
                    <th class="has-text-centered"> 작성일 </th>
                    <th class="has-text-centered"> 조회수 </th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="item" items="${list}">
                    <tr onclick="location.href='${path}/community/getCommunity.do?cno=${item.cno}&page=${curPage}<c:if test="${!empty curCategory}">&cate=${curCategory}</c:if><c:if test="${!empty page.keyword}">&type=${page.type}&keyword=${page.keyword}</c:if>'" style="cursor: pointer">
                        <th class="has-text-centered">${item.cno}</th>
                        <td class="has-text-centered">${item.cateName}</td>
                        <td width="300">${item.title}</td>
                        <td class="has-text-centered">${item.author}</td>
                        <td class="has-text-centered">${item.resdate}</td>
                        <td class="has-text-centered" width="80">${item.cnt}</td>
                    </tr>
                </c:forEach>
                <c:if test="${empty list}">
                    <tr>
                        <td colspan="6" class="has-text-centered"> 게시글이 없습니다. </td>
                    </tr>
                </c:if>
                </tbody>
            </table>

            <!-- pagination -->
            <nav class="pagination is-rounded is-centered mb-6" role="navigation" aria-label="pagination">
                <c:if test="${curPage > 5}">
                    <a href="${path}/community/list.do?page=${page.blockStartNum - 1}<c:if test="${!empty cate}">&cate=${cate}</c:if><c:if test="${!empty page.keyword}">&type=${page.type}&keyword=${page.keyword}</c:if>" class="pagination-previous">Previous</a>
                </c:if>
                <c:if test="${page.blockLastNum < page.totalPageCount}">
                    <a href="${path}/community/list.do?page=${page.blockLastNum + 1}<c:if test="${!empty cate}">&cate=${cate}</c:if><c:if test="${!empty page.keyword}">&type=${page.type}&keyword=${page.keyword}</c:if>" class="pagination-next">Next page</a>
                </c:if>

                <ul class="pagination-list">
                    <c:forEach var="i" begin="${page.blockStartNum}" end="${page.blockLastNum}">
                        <c:choose>
                            <c:when test="${i == curPage}">
                                <li>
                                    <a href="${path}/community/list.do?page=${i}<c:if test="${!empty curCategory}">&cate=${curCategory}</c:if><c:if test="${!empty page.keyword}">&type=${page.type}&keyword=${page.keyword}</c:if>" class="pagination-link is-current" aria-label="Page ${i}" aria-current="page">${i}</a>
                                </li>
                            </c:when>
                            <c:otherwise>
                                <li>
                                    <a href="${path}/community/list.do?page=${i}<c:if test="${!empty curCategory}">&cate=${curCategory}</c:if><c:if test="${!empty page.keyword}">&type=${page.type}&keyword=${page.keyword}</c:if>" class="pagination-link" aria-label="Page ${i}" aria-current="page">${i}</a>
                                </li>
                            </c:otherwise>
                        </c:choose>
                    </c:forEach>
                </ul>
            </nav>

            <div class="buttons is-right">
                <a href="${path}/community/insert.do" class="button is-primary"> 글 작성하기 </a>
            </div>
        </div>
        </div>
    </div>
</section>


<%@ include file="../layout/footer.jsp"%>

</body>
</html>
