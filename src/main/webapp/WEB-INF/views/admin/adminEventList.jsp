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
  <title>이벤트 관리</title>
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
          <h1 class="h4"> 이벤트 관리 </h1>
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
        <div class="row column text-center">
          <div class="container">
            <%--이벤트 목록--%>
            <table class="table" id="event-table" width="100%">
              <thead>
              <tr>
                <th class="has-text-centered" width="10%">번호</th>
                <th>제목</th>
                <th class="has-text-centered" width="15%">이벤트상태</th>
                <th class="has-text-centered"width="15%">작성일</th>
                <th class="has-text-centered"width="15%">추첨</th>
              </tr>
              </thead>
              <tbody>
              <c:forEach items="${eventList }" var="event" varStatus="status">
                <tr>
                  <td class="has-text-centered">${event.eno }</td>
                  <td ><a href="${path}/event/detail.do?eno=${event.eno }" style="color: #000000; text-decoration: none;">${event.title }</a></td>
                  <c:if test='${event.status eq "1"}'>
                    <td class="has-text-centered"><span class="tag is-success is-light is-medium">진행 중</span></td>
                  </c:if>
                  <c:if test='${event.status eq "0"}'>
                    <td class="has-text-centered"><span class="tag is-danger is-light is-medium">종료</span></td>
                  </c:if>
                  <td class="has-text-centered">
                    <fmt:parseDate value="${event.regdate }" var="resdate" pattern="yyyy-MM-dd HH:mm:ss" />
                    <fmt:formatDate value="${resdate }" pattern="yyyy-MM-dd" />
                  </td>
                  <td class="has-text-centered">
                    <div class="button-group" style="align-items: center">
                      <a class="button is-link" href="${path}/admin/applyList.do?eno=${event.eno }" style="height: 15px">참여자 확인</a>
                    </div>
                  </td>
                </tr>
              </c:forEach>
              <c:if test="${empty eventList}">
                <tr>
                  <td colspan="6" class="has-text-centered"> 작성된 이벤트가 없습니다. </td>
                </tr>
              </c:if>
              </tbody>
            </table>
          </div>
        </div>
      </div>
    </div>
  </div>
  <script async type="text/javascript" src="../js/bulma.js"></script>
  <script type="text/javascript">
    jQuery(function ($){
      $("#event-table").DataTable();
    })
  </script>
</section>
<!-- 푸터 영영 시작 -->
<jsp:include page="../layout/footer.jsp"/>
<!-- 푸터 영역 끝 -->
</body>
</html>