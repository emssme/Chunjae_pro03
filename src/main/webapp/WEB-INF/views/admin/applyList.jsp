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
  <title>이벤트 참여자 목록</title>
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
          <h1 class="h4"> 이벤트 참여자 목록 </h1>
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
            <table class="table is-fullwidth is-center" id="apply-table">
              <thead>
              <tr>
                <th width="15%" class="has-text-centered">신청번호</th>
                <th width="15%" class="has-text-centered">이벤트 글 번호</th>
                <th width="20%" class="has-text-centered">참여자 아이디</th>
                <th width="20%" class="has-text-centered">참여자 이름</th>
                <th width="30%" class="has-text-centered">참여자 전화번호</th>
              </tr>
              </thead>
              <tbody>
              <c:forEach items="${applyList }" var="apply" varStatus="status">
                <tr>
                  <td class="has-text-centered">${apply.appno}</td>
                  <td class="has-text-centered">${apply.eno}</td>
                  <td class="has-text-centered">${apply.id}</td>
                  <td class="has-text-centered">${apply.name}</td>
                  <td class="has-text-centered">${apply.tel}</td>
                </tr>
              </c:forEach>
              <c:if test="${empty applyList}">
                <tr>
                  <td colspan="6" class="has-text-centered"> 참여자가 없습니다. </td>
                </tr>
              </c:if>
              </tbody>
            </table>
            <script type="text/javascript">
              jQuery(function ($){
                $("#apply-table").DataTable();
              })
            </script>
            <div class="buttons is-right mb-100" style="margin-top: 30px;">
              <a class="button is-primary" href="${path}/admin/winners.do?eno=${eno}"> 당첨자 추첨 </a>
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