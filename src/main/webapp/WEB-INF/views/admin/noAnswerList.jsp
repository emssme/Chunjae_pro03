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
    <title>미답변 질문 목록</title>
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
<!--헤더 영역 끝 -->
<!-- page title -->
<section class="section-sm">
    <div class="container">
        <div class="columns is-multiline">
            <div class="column is-12">
                <div class="title-bordered mb-5 has-text-centered" >
                    <h1 class="h4"> 미답변 질문 목록 </h1>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- /page title -->

<!--QnA List-->
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
                <div class="row column text-center">
                    <div class="container">
                        <div>
                            <%--미답변 질문 목록--%>
                            <table class="table is-fullwidth is-center" id="qna-table">
                                <thead>
                                <tr>
                                    <th width="10%" class="has-text-centered">글번호</th>
                                    <th width="50%" class="has-text-centered">글제목</th>
                                    <th width="10%" class="has-text-centered">작성자</th>
                                    <th width="20%" class="has-text-centered">작성일</th>
                                    <th width="10%" class="has-text-centered">답변하기</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${noAnswerList }" var="noAnswer" varStatus="status">
                                    <tr>
                                        <td class="has-text-centered">${noAnswer.qno}</td>
                                        <td><a href="${path}/qna/detail.do?qno=${noAnswer.qno}"
                                               style="color: #000000;">${noAnswer.title}</a></td>
                                        <td class="has-text-centered">${noAnswer.author}</td>
                                        <td class="has-text-centered">
                                            <fmt:parseDate value="${noAnswer.resdate}" var="resdate"
                                                           pattern="yyyy-MM-dd HH:mm:ss"/>
                                            <fmt:formatDate value="${resdate}" pattern="yyyy-MM-dd"/>
                                        </td>
                                        <td class="has-text-centered"><a
                                                href="${path}/qna/answerInsert.do?qno=${noAnswer.qno}" class="button" style="height: 30px">답변</a>
                                        </td>
                                    </tr>
                                </c:forEach>
                                <c:if test="${empty noAnswerList}">
                                    <tr>
                                        <td colspan="6" class="has-text-centered"> 질문이 없습니다.</td>
                                    </tr>
                                </c:if>
                                </tbody>
                            </table>

                            <!-- pagination -->
                            <nav class="pagination is-rounded is-centered mb-6" role="navigation" aria-label="pagination">
                                <c:if test="${curPage > 5}">
                                    <a href="${path}/admin/questionList.do?page=${page.blockStartNum - 1}"
                                       class="pagination-previous">Previous</a>
                                </c:if>
                                <c:if test="${page.blockLastNum < page.totalPageCount}">
                                    <a href="${path}/admin/questionList.do?page=${page.blockLastNum + 1}"
                                       class="pagination-next">Next page</a>
                                </c:if>

                                <ul class="pagination-list">
                                    <c:forEach var="i" begin="${page.blockStartNum}" end="${page.blockLastNum}">
                                        <c:choose>
                                            <c:when test="${i == curPage}">
                                                <li>
                                                    <a href="${path}/admin/questionList.do?page=${i}"
                                                       class="pagination-link is-current" aria-label="Page ${i}"
                                                       aria-current="page">${i}</a>
                                                </li>
                                            </c:when>
                                            <c:otherwise>
                                                <li>
                                                    <a href="${path}/admin/questionList.do?page=${i}"
                                                       class="pagination-link" aria-label="Page ${i}"
                                                       aria-current="page">${i}</a>
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
    </div>
</section>
<!-- 푸터 영영 시작 -->
<jsp:include page="../layout/footer.jsp"/>
<!-- 푸터 영역 끝 -->
</body>
</html>