<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title> 커뮤니티 관리 </title>
    <c:set var="path" value="${pageContext.request.contextPath}"/>
    <jsp:include page="../setting/head.jsp" />
    <link rel="stylesheet" href="https://cdn.datatables.net/1.11.5/css/jquery.dataTables.min.css">
    <script src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.min.js"></script>

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
                    <h1 class="h4"> 커뮤니티 관리 </h1>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- /page title -->

<section class="section">
    <div class="container">
        <div class="container mb-100" style="margin-top: 50px">
            <div class="columns">
                <div class="column is-3 ">
                    <aside class="menu is-hidden-mobile">
                        <ul class="menu-list" style="text-align: left; height: 400px;color: #A5D7E8;font-weight: bold; border-right: solid 3px;width: 250px;">
                            <br>
                            <li><a href="${path}/admin/adminMemberList.do"> 회원 관리</a></li>
                            <li><a href="${path}/admin/adminNoticeList.do"> 공지사항 관리</a></li>
                            <li><a href="${path}/admin/adminFileList.do">자료실</a></li>
                            <li><a href="${path}/admin/adminCommunityList.do">커뮤니티 관리</a></li>
                            <li><a href="${path}/admin/adminQuestionList.do">QnA 관리</a></li>
                            <li><a href="${path}/admin/adminEventList.do">이벤트 관리</a></li>
                        </ul>
                    </aside>
                </div>
                <div class="container">
                    <div class="buttons has-addons is-centered mb-5">
                        <c:if test="${empty curCategory}">
                        <label class="button is-primary is-active">
                        </c:if>
                        <c:if test="${!empty curCategory}">
                        <label class="button is-primary">
                            </c:if>
                            <input type="radio" checked="checked" onclick="javascript:location.href='${path}/admin/adminCommunityList.do'"/> 전체
                        </label>
                        <c:forEach var="cate" items="${categories}">
                        <c:if test="${cate.cate eq curCategory}">
                        <label class="button is-primary is-active">
                        </c:if>
                        <c:if test="${cate.cate ne curCategory}">
                        <label class="button is-primary">
                        </c:if>
                            <input type="radio" checked="checked" onclick="javascript:location.href='${path}/admin/adminCommunityList.do?cate=${cate.cate}'"/> ${cate.cateName}
                        </label>
                        </c:forEach>
                    </div>

                    <div class="container">
                        <table class="table is-hoverable is-fullwidth">
                            <thead>
                            <tr>
                                <th class="has-text-centered" width="5%"> # </th>
                                <th class="has-text-centered" width="15%"> 카테고리 </th>
                                <th class="has-text-centered"> 제목 </th>
                                <th class="has-text-centered" width="20%"> 작성자 </th>
                                <th class="has-text-centered" width="15%"> 작성일 </th>
                                <th class="has-text-centered" width="10%"> 조회수 </th>
                                <th class="has-text-centered" width="10%"> 삭제 </th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="list" items="${communityList}">
                                <tr onclick="location.href='${path}/community/getCommunity.do?cno=${list.cno}&page=${curPage}<c:if test="${!empty curCategory}">&cate=${curCategory}</c:if><c:if test="${!empty page.keyword}">&type=${page.type}&keyword=${page.keyword}</c:if>'" style="cursor: pointer">
                                    <th class="has-text-centered">${list.cno}</th>
                                    <td class="has-text-centered">${list.cateName}</td>
                                    <td width="300">${list.title}</td>
                                    <td class="has-text-centered">${list.author}</td>
                                    <td class="has-text-centered">
                                        <fmt:parseDate value="${list.resdate}" var="resdate"
                                                       pattern="yyyy-MM-dd HH:mm:ss"/>
                                        <fmt:formatDate value="${resdate}" pattern="yyyy-MM-dd"/>
                                    </td>
                                    <td class="has-text-centered" width="80">${list.cnt}</td>
                                    <td class="has-text-centered">
                                        <div class="button-group" style="align-items: center">
                                            <a class="button is-danger"
                                               href="${path}/admin/communityDelete.do?cno=${list.cno}" style="height: 20px;">삭제</a>
                                        </div>
                                    </td>
                                </tr>
                            </c:forEach>
                            <c:if test="${empty communityList}">
                                <tr>
                                    <td colspan="6" class="has-text-centered"> 게시글이 없습니다. </td>
                                </tr>
                            </c:if>
                            </tbody>
                        </table>

                        <!-- pagination -->
                        <nav class="pagination is-rounded is-centered mb-6" role="navigation" aria-label="pagination">
                            <c:if test="${curPage > 5}">
                                <a href="${path}/admin/adminCommunityList.do?page=${page.blockStartNum - 1}<c:if test="${!empty cate}">&cate=${cate}</c:if><c:if test="${!empty page.keyword}">&type=${page.type}&keyword=${page.keyword}</c:if>" class="pagination-previous">Previous</a>
                            </c:if>
                            <c:if test="${page.blockLastNum < page.totalPageCount}">
                                <a href="${path}/admin/adminCommunityList.do?page=${page.blockLastNum + 1}<c:if test="${!empty cate}">&cate=${cate}</c:if><c:if test="${!empty page.keyword}">&type=${page.type}&keyword=${page.keyword}</c:if>" class="pagination-next">Next page</a>
                            </c:if>

                            <ul class="pagination-list">
                                <c:forEach var="i" begin="${page.blockStartNum}" end="${page.blockLastNum}">
                                    <c:choose>
                                        <c:when test="${i == curPage}">
                                            <li>
                                                <a href="${path}/admin/adminCommunityList.do?page=${i}<c:if test="${!empty curCategory}">&cate=${curCategory}</c:if><c:if test="${!empty page.keyword}">&type=${page.type}&keyword=${page.keyword}</c:if>" class="pagination-link is-current" aria-label="Page ${i}" aria-current="page">${i}</a>
                                            </li>
                                        </c:when>
                                        <c:otherwise>
                                            <li>
                                                <a href="${path}/admin/adminCommunityList.do?page=${i}<c:if test="${!empty curCategory}">&cate=${curCategory}</c:if><c:if test="${!empty page.keyword}">&type=${page.type}&keyword=${page.keyword}</c:if>" class="pagination-link" aria-label="Page ${i}" aria-current="page">${i}</a>
                                            </li>
                                        </c:otherwise>
                                    </c:choose>
                                </c:forEach>
                            </ul>
                        </nav>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>


<%@ include file="../layout/footer.jsp"%>

</body>
</html>
