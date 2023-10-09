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
  <title>이벤트 상세보기</title>
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
          <h1 class="h4"> 이벤트 상세보기 </h1>
        </div>
      </div>
    </div>
  </div>
</section>
<!-- /page title -->

<!-- 이벤트 상세보기-->

<div class="content" id="content">
  <div class="row column text-center">
    <div class="container">
      <div class="buttons is-right" style="margin-top: 30px;">
        <c:if test='${sid eq "admin"}'>
          <a class="button" href="${path}/event/delete.do?eno=${event.eno}" style="color:#0a0a0a;">글 삭제</a>
          <a class="button is-primary" href="${path}/event/edit.do?eno=${event.eno}" style="margin-left:10px; margin-right:10px;">글 수정</a>
        </c:if>
        <a class="button" href="${path}/event/list.do" style="float:right; color:#0a0a0a;">글 목록</a>
      </div>
      <table id="table">
        <tbody>
        <tr style="border-top: solid #808080FF 1px;">
          <td style="font-weight: bold; font-size: 30px;">${event.title }</td>
        </tr>
        <tr style="border-bottom: solid #808080FF 1px;">
          <td style="border-bottom: solid #808080FF 1px;">
            <p class="mb-0" style="font-weight: bold;">이벤트 기간 | ${event.sdate } ~ ${event.edate}</p>
          </td>
        </tr>
        <tr style="border-bottom: solid grey 1px;">
          <td style="padding-top: 50px; padding-bottom: 50px;"><p>${event.content }</p></td>
        </tr>
        </tbody>
      </table>
      <div class="container mb-100">
        <c:if test="${sid ne null && event.status eq '1'}">
        <div class="container">
          <input type="hidden" name="id" id="id" value="${sid}">
          <input type="hidden" id="eno" name="eno" value="${event.eno}">
          <input type="hidden" name="app_chk" id="app_chk" value="no">
          <button type="button" id="ck_btn" class="button is-fullwidth is-primary" onclick="appCheck()" style="height:72px">신청하기</button>
        </div>
        <script>
          function appCheck() {
            var child;
            let params = { id: $("#id").val(), eno: $("#eno").val()};
            $.ajax({
              url: "${path}/apply/appCheck.do",
              type: "post",
              dataType: "json",
              data: params,
              success:function(data) {
                console.log("HI");
                let appPass = data.result;
                if(!appPass) {
                  //$("#app_chk").val("no");
                  alert("이미 신청한 회원입니다.");
                } else {
                  //$("#app_chk").val("yes");
                  child = window.open("${path}/apply/insert.do?eno="+$("#eno").val()+"&id="+$("#id").val(), "child", "width=700, height=500");
                }
              },
              error:function(res) {
                alert(" 잠시 후 다시 시도해주세요.");
                console.log(res.responseText);
              }
            })
          }
        </script>
      </div>
      </c:if>
    </div>
  </div>
</div>

</body>
</html>