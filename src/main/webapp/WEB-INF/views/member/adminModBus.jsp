<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<% request.setCharacterEncoding("utf-8"); %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>관리자 회원 관리</title>
	<style>
	.search{
		width: 80%;
		border: 1px solid #FF6251;
		border-collapse: collapse;
		border-style: hidden;
        box-shadow: 0 0 0 2px #FF6251;
        border-spacing: 0;
        border-radius: 15px;
        margin : 50px 80px;
	}
	
	tr,td{
		border-bottom: 2px solid #FF6251;
		 border: 1px solid #FF6251;
		font-size: 15px;
	}
	
	.inputSize{
		width:230px;
		border: 1px solid #696969;
        height: 20px;
        border-radius: 10px;
	}
	
	.inputSize1{
		width:330px;
		border: 1px solid #696969;
        height: 20px;
        border-radius: 10px;
	}
	
	.clear {
		clear: both;
		height: 50px;
	}
	
	.reply{
		text-decoration: none;
		color: #FF6251;
	}
	
	.mypage4{
		border:3px solid #d2d2d2;
		border-radius: 20px;
		padding:30px;
		font-size:15px;
		line-height:280%;
		border-color: #FF6251;
		padding-bottom: 50px;
	}
	
	.alink{
		text-decoration: none;
	}
	
	.optionsize{
		border: 1px solid #696969;
        height: 20px;
        border-radius: 10px;   
        text-align: center;     
	}
	</style>
</head>

<body>
<div class="mypage4">
<form method="post"   action="${contextPath}/member/adminUpdateBus.do">
	<div style="margin-bottom:20px;">
    	<h2 style="text-align:left;">사업자 정보</h2>
        <div style="width: auto; border: 1px solid; border-color: #FF6251; margin-top: 10px; margin-bottom:10px;"></div>
        	<div style="border-color: #FF6251; width:auto;"></div>
    </div>
	<table class="search">
		<tr>
			<td  width="150px;">사업자명</td>
			<td><input type="text" class="inputSize1" name="b_name" value="${member.b_name}"></td>
		</tr>
		<tr>
			<td>아이디</td>
			<td><input type="text" class="inputSize1" name="mem_id" id="i_id" value="${member.mem_id}" readonly></td>
		</tr>
		<tr>
			<td>비밀번호</td>
			<td><input type="text" class="inputSize1" name="pwd" value="${member.pwd}" ></td>
		</tr>
		<tr>
			<td>비밀번호 확인</td>
			<td><input type="text" class="inputSize1"></td>
		</tr>
		<tr>
			<td>사업자 번호</td>
			<td><input type="text" class="inputSize1" name="b_number" value="${member.b_number}" readonly></td>
		</tr>
		<tr>
			<td>전화번호</td>
			<td><input type="text" class="inputSize1" name="b_phone2" value="${member.b_phone2}"></td>
		</tr>
		<tr>
			<td>핸드폰확인</td>
			<td><input type="text" class="inputSize1" name="b_phone3" value="${member.b_phone3}"></td>
		</tr>
		<tr>
			<td>이메일</td>
			<td><input type="text" class="inputSize1" name="email" value="${member.email}"></td>
		</tr>
		<tr>
			<td>주소</td>
			<td>
				<input type="text" class="inputSize" name="post" value="${member.post}" disabled> <a href="javascript:execDaumPostcode()" class="post1">우편번호찾기</a><br>
				<input type="text" class="inputSize1" name="addr1" value="${member.addr1}"><br>
			  	<input type="text" class="inputSize1" name="addr2" value="${member.addr2}"><br>
			</td>
		</tr>
	</table>
	<input type="submit" onclick="fn_sub(this.form)" value="수정하기">
</form>
</div>
</body>
</html>