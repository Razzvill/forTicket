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
<title>관리자 커뮤티니</title>
<style>
	.wrap_1100 {
		margin: auto;
		width: 1100px;
		position: relative;
	}
	
	.comm_title{
		font-size: 25px;
		font-weight: 900;
		text-align: left;
		padding-top: 50px;
	}
	
	.comm_title_more {
		position: absolute;
		right: 750px;
		font-size: 15px;
		text-decoration: none;
	}
		
	.review_title {
    	display: flex;
    	justify-content: space-between;
    	padding: 10px 0 7px 0;
	}

	.review_title_left {
    	display: flex;
    	align-items: center;
	}

	.review_title_left_stars {
	    width: 95px;
	    height: 16px;
	}

	.review_title_left_star {
	    background-image: url(${contextPath}/resources/images/stars.png);
	    background-repeat: no-repeat;
	    background-size: 95px;
	    width: 100%;
	    height: 16px;
	}

	.review_title_left_star_filled {
	    position: absolute;
	    background-image: url(${contextPath}/resources/images/member/stars.png);
	    background-repeat: no-repeat;
	    background-size: 95px;
	    height: 16px;
	}
	
	.review_title_left_name {
   		align-items: flex-end;
	}

	.review_title_left_name, .review_title_right {
	    color: #777;
	    font-size: 14px;
	}
	
	.text {
		/* 요소의 내용이 영역을 벗어날 경우 그 부분은 숨겨지게 처리 */ 
		overflow: hidden;
		/* 요소의 표시 방법을 -webkit-box로 표시 */
		display: none;
		/* webkit-box로 표시된 자식 요소들의 배치 방법 결정 (여기서는 수직) */ 
		-webkit-box-orient: vertical;
		/* 요소 내 텍스트를 지정한 라인수까지만 표시 */
		-webkit-line-clamp: 0;
		width: 99%;
		font-size: 15px;
	}
	
	.more-text{
		/* 글씨 크기,색상 지정 */ 
		font-size: 15px;
		/* 마우스 포인트가 올라갔을 때 커서 모양을 포인터로 변경 */
		cursor: pointer;
		font-weight: bold;
		color: #000;
		text-align: left;
	}
	
	.section{
		cursor: pointer;
		color: black;
		text-decoration: none;
	}

</style>
</head>
<body>
<div class="wrap_1100">
	<div class="comm_title">
    	<div style="text-align:left;">커뮤니티 관리</div>
    	<div class="comm_title_more"><a href="${contextPath}/community/adminCommunity.do" align="left"> 리뷰조회</a> | 리뷰삭제</div>
        <div style="width: auto; border: 1px solid; border-color: #FF6251; margin-top: 30px; margin-bottom:10px;"></div>
    </div>
    <c:choose>
    	<c:when test="${empty u_commulist }">
    	리뷰가 없습니다.
    	</c:when>
    	<c:otherwise>
    	<c:forEach var="u_list" items="${u_commulist }">
 		   	<div class="review_title">
				<div class="review_title_left">
    				<div class="review_title_left_stars">
        				<div class="review_title_left_star">
          					<div class="review_title_left_star_filled" style="width: calc(5 * 19px);"></div>
        				</div>
        			</div>
				<div class="review_title_left_name" style="padding-left: 10px;">
				${u_list.mem_id }
				</div>
				</div>
				<div class="review_title_right" style="padding-right:8px;">
				${u_list.c_date }
				</div>
			</div>
		<div>
		<div class="more-text">
			${u_list.c_title }
			<span class="text"> ${u_list.c_content }</span>
		</div>
		</div>
		</c:forEach>
		</c:otherwise>
	</c:choose>
</div>
<c:forEach var="page" begin="1" end="10" step="1" >
	<c:if test="${section >1 && page==1 }">
		<a class="section" href="${contextPath}/community/u_Commu.do?section=${section-1}&pageNum=${(section-1)*10 +1 }">&nbsp;pre &nbsp;</a>
	</c:if>
		<a class="section" href="${contextPath}/community/u_Commu.do?section=${section}&pageNum=${page}">${(section-1)*10 +page } </a>
	<c:if test="${page ==10 }">
		<a class="section" href="${contextPath}/community/u_Commu.do?section=${section+1}&pageNum=${section*10+1}">&nbsp; next</a>
	</c:if> 
</c:forEach> 
<script>
	//코드에 필요한 요소들 변수에 할당 (전체 ui를 감싸는 div, 내용 텍스트, 더보기/줄이기 텍스트)
	//debugger;
	var arrMoreText = document.getElementsByClassName("more-text");
	var arrMoreTextLen = arrMoreText.length;
	
	for(var i =0; i<arrMoreTextLen; i++){
		let moreTextObj = arrMoreText[i];
		
		moreTextObj.addEventListener('click', () => {
			
			moreTextObj.childNodes.forEach(function(v){//v = nodeList
				if(v.nodeName === "SPAN"){
					if(v.style.display === "inline-block"){
						v.style.display = "";
					}else{
						v.style.display = 'inline-block';
					}
				}
			});
		});
	}
</script>
</body>
</html>