<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title> 회원 관리 </title>
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
                    <h1 class="h4"> 회원 관리 </h1>
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
                <div class="row column text-center">
                    <br>
                    <div class="container">
                        <div>
                            <%--회원 목록--%>
                            <table class="table" id="member-table" width="100%">
                                <thead>
                                <tr>
                                    <th class="has-text-centered" width="25%">아이디</th>
                                    <th class="has-text-centered" width="25%">이름</th>
                                    <th class="has-text-centered" width="25%">가입일</th>
                                    <th class="has-text-centered" width="25%">강퇴</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${memberList}" var="member" varStatus="status">
                                    <tr>
                                        <td class="has-text-centered">${member.id }</td>
                                        <td class="has-text-centered">${member.name}</td>
                                        <td class="has-text-centered">
                                            <fmt:parseDate value="${member.regdate}" var="resdate"
                                                           pattern="yyyy-MM-dd HH:mm:ss"/>
                                            <fmt:formatDate value="${resdate}" pattern="yyyy-MM-dd"/>
                                        </td>
                                        <td class="has-text-centered">
                                            <div class="button-group" style="align-items: center">
                                                <a class="button is-danger"
                                                   href="${path}/admin/memberDelete.do?id=${member.id }"
                                                style="height: 10px">강퇴</a>
                                            </div>
                                        </td>
                                    </tr>
                                </c:forEach>
                                <c:if test="${empty memberList}">
                                    <tr>
                                        <td colspan="5" class="has-text-centered"> 가입한 회원이 없습니다.</td>
                                    </tr>
                                </c:if>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script async type="text/javascript" src="../js/bulma.js"></script>
    <script type="text/javascript">
        jQuery(function ($) {
            $("#member-table").DataTable();
        })
    </script>
</section>


<%@ include file="../layout/footer.jsp"%>

</body>
</html>
