<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>  
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="<%=request.getContextPath() %>"/>


<div id="wrap">
	<div id="container">
		<div id="content">
			<div class="logo-box">
				<h1>열어데이</h1>
				<p>관리자페이지</p>
			</div>
			<ul class="list-box">
				<li class="f-list">
					<ul class="s-ul">
						클래스 개설 검토
						<a href="${contextPath}/adm/?page=adminWaitingList.jsp">
							<li class="s-li">개설신청 목록</li>
						</a>
					</ul>
				</li>
				<li class="f-list">
					<ul class="s-ul">
						회원 관리
						<a href="">
							<li class="s-li">회원 목록</li>
						</a>
						<a href="">
							<li class="s-li">클래스 목록</li>
						</a>
					</ul>
				</li>
				<li class="f-list">
					<ul class="s-ul">
						고객센터
						<a href="">
							<li class="s-li">문의</li>
						</a>
						<a href="">
							<li class="s-li">공지</li>
						</a>
					</ul>
				</li>
				<li class="f-list">
					<ul class="s-ul">
						정산 및 매출
						<a href="">
							<li class="s-li">정산하기</li>
						</a>
						<a href="">
							<li class="s-li">정산내역 조회</li>
						</a>
						<a href="">
							<div class="s-li-div">
								<li class="s-li">매출 확인</li>
							</div>
						</a>
					</ul>
				</li>

			</ul>


		</div>
	</div>
</div>