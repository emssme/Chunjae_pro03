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
    <title>당첨자 발표 등록</title>
    <jsp:include page="../setting/head.jsp"></jsp:include>
    <link rel="stylesheet" href="https://cdn.datatables.net/1.11.5/css/jquery.dataTables.min.css">
    <script src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.min.js"></script>
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
                    <h1 class="h4"> 당첨자 발표 등록 </h1>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- /page title -->

<!-- List-->
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
                <div class="container" style="margin-left: -200px">
                    <form action="${path}/admin/winnerInsert.do" method="post">
                        <!--제목-->
                        <div class="field is-horizontal">
                            <div class="field-label is-normal" style="height: 60px; margin-bottom:0px;">
                                <label class="label">제목</label>
                            </div>
                            <div class="field-body">
                                <div class="field">
                                    <p class="control">
                                        <input type="hidden" id="eno" name="eno" value="${event.eno}">
                                        <input class="input" type="text" name="title" id="title" maxlength="98" value="${event.title} 당첨자 발표" required>
                                    </p>
                                </div>
                            </div>
                        </div>
                        <!--내용-->
                        <div class="field is-horizontal">
                            <div class="field-label is-normal">
                                <label class="label">내용</label>
                            </div>
                            <div class="field-body">
                                <div class="field">
                                    <p class="control">
                                <textarea class="textarea is-focused" name="content" id="content" rows="8" cols="100" maxlength="800" style="resize: none;" required>
<c:forEach var="win" items="${winners}" varStatus="status">
    ${status.count}. id : ${win.id} / 이름 : ${win.name} <br>
</c:forEach>
당첨자는 개별 연락 드릴 예정입니다.
                                </textarea>
                                    </p>
                                </div>
                            </div>
                        </div>

                        <div class="button-group" style="margin-top: 30px; margin-bottom: 100px;">
                            <input class="button is-primary" type="submit" value="글등록" style="float:right; margin-left:10px;">
                            <a class="button" href="${path }/winner/winnerList.do" style="float:right;">글 목록</a>
                        </div>
                    </form>
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