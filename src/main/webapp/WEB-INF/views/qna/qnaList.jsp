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
    <title>Q & A</title>
    <jsp:include page="../setting/head.jsp"></jsp:include>

    <style>
        table tbody tr:nth-child(2n) {
            background-color: #d3d3d3;
        }
        table > thead {
            background-color: #d3d3d3;
        }
    </style>
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
                    <h1 class="h4"> Q&A 목록 </h1>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- /page title -->

<!--QnA List-->

<div class="content" id="content">
    <div class="container" style="margin-top: 60px">
        <c:if test='${!empty sid || sid eq "admin"}'>
            <div class="button-group" style="float:right; margin-left:20px; margin-bottom: 20px">
                <a class="button" href="${path }/qna/insert.do">글쓰기</a>
            </div>
        </c:if>
        <table class="table is-fullwidth is-center">
            <thead>
            <tr>
                <th width="10%" class="has-text-centered">글번호</th>
                <th width="50%" class="has-text-centered">글제목</th>
                <th width="15%" class="has-text-centered">작성자</th>
                <th width="25%" class="has-text-centered">작성일</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${qnaList }" var="qna" varStatus="status">
            <tr>
                <td class="has-text-centered">${status.count}</td>
                <!-- 비회원일때 -->
                <c:if test="${empty sid}">
                    <c:if test="${qna.lev==0}">
                        <td>${qna.title}</td>
                    </c:if>
                    <c:if test="${qna.lev==1}">
                        <td>&nbsp;&nbsp;&nbsp;&nbsp;⌞${qna.title}</td>
                    </c:if>
                </c:if>
                <!-- 회원일때-->
                <c:if test="${!empty sid}">
                    <c:if test="${qna.lev==0}">
                        <td>
                            <a href="${path}/qna/detail.do?qno=${qna.qno}" style="color: #000000;">${qna.title}</a>
                        </td>
                    </c:if>
                    <c:if test="${qna.lev==1}">
                        <td>
                            <a href="${path}/qna/detail.do?qno=${qna.qno}" style="color: #000000;">&nbsp;&nbsp;&nbsp;&nbsp;⌞${qna.title}</a>
                        </td>
                    </c:if>
                </c:if>
                <td class="has-text-centered">${qna.author}</td>
                <td class="has-text-centered">${qna.resdate}</td>
            </tr>
            </c:forEach>
            <c:if test="${empty qnaList}">
                <tr>
                    <td colspan="6" class="has-text-centered"> Q&A가 없습니다. </td>
                </tr>
            </c:if>
            </tbody>
        </table>
        <!-- pagnation -->
        <nav class="pagination is-rounded is-centered mb-6" role="navigation" aria-label="pagination">
            <c:if test="${curPage > 5}">
                <a href="${path}/qna/list.do?page=${page.blockStartNum - 1}" class="pagination-previous">Previous</a>
            </c:if>
            <c:if test="${page.blockLastNum < page.totalPageCount}">
                <a href="${path}/qna/list.do?page=${page.blockLastNum + 1}" class="pagination-next">Next page</a>
            </c:if>

            <ul class="pagination-list">
                <c:forEach var="i" begin="${page.blockStartNum}" end="${page.blockLastNum}">
                    <c:choose>
                        <c:when test="${i == curPage}">
                            <li>
                                <a href="${path}/qna/list.do?page=${i}" class="pagination-link is-current" aria-label="Page ${i}" aria-current="page">${i}</a>
                            </li>
                        </c:when>
                        <c:otherwise>
                            <li>
                                <a href="${path}/qna/list.do?page=${i}" class="pagination-link" aria-label="Page ${i}" aria-current="page">${i}</a>
                            </li>
                        </c:otherwise>
                    </c:choose>
                </c:forEach>
            </ul>
        </nav>
    </div>
</div>
<!-- 푸터 영영 시작 -->
<jsp:include page="../layout/footer.jsp"/>
<!-- 푸터 영역 끝 -->
</body>
</html>