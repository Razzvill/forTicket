<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공연장 목록</title>
<style>
	a,
	a.underline {
	  color: #000;
	  text-decoration: none;
	}
	
	a.underline:hover {
	  text-decoration: underline;
	}
	table {
	  border-collapse: collapse;
	}
	object {
	  display: block;
	}
	.wrap_1100 {
	  margin: auto;
	  width: 1100px;
	  position: relative;
	}
	img {
	  border: none;
	  padding: 0;
	  margin: 0;
	}
	.clear {
	  clear: both;
	}
	.theater_list {
	  position: relative;
	  width: 255px;
	  margin-right: 26px;
	  margin-bottom: 60px;
	  letter-spacing: -1px;
	  text-align: left;
	  transition: transform 0.3s ease-in-out;
	}
	.theater_list:hover {
	  transform: translateY(-5px);
	}
	.theater_list .thumb img {
	  width: 255px;
	  height: 357px;
	  border-radius: 10px;
	  border: 1px solid #eee;
	}
	.theater_list .theater_info {
	  width: 95%;
	  padding: 0 5px;
	  letter-spacing: -0.5px;
	}
	.theater_list .theater_info .area {
	  display: inline-block;
	  margin-top: 15px;
	  padding: 5px 10px;
	  font-size: 14px;
	  color: #333;
	  background: #eee;
	  border-radius: 10px;
	}
	.theater_list .theater_info .category {
	  display: block;
	  margin-top: 10px;
	  color: #999;
	  font-size: 14px;
	}
	.theater_list .theater_info .title {
	  margin-top: 10px;
	  font-size: 18px;
	  color: #000;
	  font-weight: 400;
	  display: block;
	  overflow: hidden;
	  white-space: nowrap;
	  text-overflow: ellipsis;
	  word-break: break-all;
	}
	.theater_list .theater_info .price {
	  display: flex;
	  justify-content: space-between;
	  margin-top: 15px;
	  font-size: 18px;
	  color: #000;
	  font-weight: 600;
	  text-align: left;
	}
	
	.theater_list .theater_info .price .stars {
	  font-size:15px; color:#333; font-weight:600;
	}
	.theater_list .theater_info .price .stars img {
	  width:15px; vertical-align:-1px; padding-right:3px;
	}
	.theater_list .theater_info .price .stars span {
	  font-size:14px; font-weight: 300;
	}
	.main_title {
		font-size: 25px;
		font-weight: 900;
		text-align: left;
		padding-left: 30px;
		padding-top: 50px;
		padding-bottom: 20px;
	}
</style>
</head>
<body>
<%-- <div class="main_book">
   <c:set  var="goods_count" value="0" />
	<h3>베스트셀러</h3>
	<c:forEach var="item" items="${goodsMap.bestseller }">
	   <c:set  var="goods_count" value="${goods_count+1 }" />
		<div class="book">
			<a href="${contextPath}/goods/goodsDetail.do?goods_id=${item.goods_id }">
			<img class="link"  src="${contextPath}/resources/image/1px.gif"> 
			</a> 
				<img width="121" height="154" 
				     src="${contextPath}/thumbnails.do?goods_id=${item.goods_id}&fileName=${item.goods_fileName}">

			<div class="title">${item.goods_title }</div>
			<div class="price">
		  	   <fmt:formatNumber  value="${item.goods_price}" type="number" var="goods_price" />
		          ${goods_price}원
			</div>
		</div>
	   <c:if test="${goods_count==15   }">
         <div class="book">
           <font size=20> <a href="#">more</a></font>
         </div>
     </c:if>
  </c:forEach>
</div> --%>
<div class="wrap_1100">
<div class="main_title">
	공연장 목록
</div>
<div style="margin-top: 25px;">
<table width="100%" border="0" cellpadding="0" cellspacing="0">
	<tbody>
		<tr>
			<td valign="top" align="left">
				<a href="${contextPath}/theater/detailTheater.do?t_name=아신극장">
					<div class="theater_list">
						<div class="thumb">
							<img src="${contextPath}/resources/images/asin.jpeg" alt="아신극장">
						</div>
						<div class="theater_info">
							<p class="category">민간</p>
							<p class="title">아신극장</p>
							<%-- <div class="price">
								<div>
									<span class="stars" style=";">
										<img src="${contextPath}/resources/images/ico_star.png" alt="별점">4.8<span>(59)</span>
									</span>
								</div>
							</div> --%>
						</div>
					</div>
				</a>
			</td>
		</tr>
	</tbody>
</table>
</div>
</div>
</body>
</html>