<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"   isELIgnored="false"  %>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
 <c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<%
  request.setCharacterEncoding("UTF-8");
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인 페이지</title>
<style>
	.mypage_right_wrap {
		margin: 0 auto;
	    float: center;
	    width: 800px;
	    min-height: 640px;
	    padding: 40px 30px 0 30px;
	    background: #fff;
	    border-radius: 10px;
	    text-align:center;
	    line-height:200%;
	}
	
	* {
	    margin: 0;
	    padding: 0;
	}
		
	div {
	    display: block;
	}
	
	body, table {
	    text-align: center;
	    word-break: break-all;
	    font-size: 13px;
	    font-weight: 400;
	}
	
	.overlay_t {
		background: #000;
		bottom: 0; 
		left: 0; 
		opacity: 0.7; 
		position: fixed; 
		right: 0; 
		top: 0; 
		z-index: 99; 
		display:none;
	}
	
	.popup_layer {
		width:500px; 
		border-radius:10px; 
		margin-bottom:0px; 
		background:#eeeeee; 
		border:solid 1px #ccc; 
		position:absolute; 
		top:0px; 
		left:35%; 
		z-index:100; 
		display:none;
	}
	
	.rows_my_buy_pop_top {
		font-size:14px; 
		color:#313131;
		padding:10px;
	}
	
	.rows_my_buy_pop_detail {
		text-align:left;
		padding:10px 15px 15px 10px;
		border-radius:0 0 10px 10px; 
		background-color:#fff; 
		line-height:180%;  
		vertical-align:bottom;
	}
	
	.rows_my_buy_pop_line {
		width:100%;
		height:1px; 
		border-top:1px solid #ccc; 
		padding:0; 
	}
	
	.rows_my_buy_pop_box {
		width:48%; 
		text-align:center; 
		padding:3px 0; 
		border:1px solid #ddd; 
		background:#eee; 
	}
	
	.buy_detail_title {
		float:left; 
		width:23%; 
		word-wrap:break-word; 
		word-break:break-all; 
		font-size:12px;
	}
	
	.buy_detail_info {
		float:left; 
		width:77%;
	}
	
	.option_title{
		width:90px;
		float:left;
		color:#888;
	}
	
	.option_content{
		width:100%; 
		vertical-align:bottom; 
		font-size:20px;
	}
</style>
</head>
<body>
<div class="mypage_right_wrap">

      <div class="mypage_right_title" style="margin-bottom:20px;">
        <h2 style="text-aling:left;">예매완료</h2>
        <div style="border-color: #FF6251; width:auto;"></div>
        </div>

<div style="margin-top:17px; padding:25px 0; border:1px solid #ff6060; border-radius:10px; text-align:center;">

   

	<div style="font-size:20px; font-weight:bold; color:#ff6060;">
		결제가 정상적으로 완료되었습니다.
		<div style="font-size:14px; font-weight:300; color:#333; padding-top:15px;">
			세부사항은 하단 예매내역을 참고해주세요.
		</div>
	</div>

</div>

<div style="height:500px; margin-top:10px; border:1px solid #d2d2d2; border-radius: 10px; background:#fff; padding:10px 25px; font-size:15px; color:#313131; line-height:280%; border-color: #FF6251;">
        <div class="option_title">티켓명</div>
        <div style="width:100%; font-size:20px;">라면</div>
        
        <div class="option_title">예매번호</div>
        <div style="width:100%; font-size:20px;">095-8176-601</div>
        
        <div class="option_title">장소</div>
        <div class="option_content" style="width:100%; vertical-align:bottom; font-size:20px;">아신극장</div>
        
        <div class="option_title">연락처</div>
        <div class="option_content" style="width:100%; vertical-align:bottom; font-size:20px;">1599-3091</div>
        
        <div class="option_title">날짜/시간</div>
        <div class="option_content" style="width:100%; vertical-align:bottom; font-size:20px;">2023.08.31(목)19:00</div>
        
        <div class="option_title">수량</div>
        <div class="option_content" style="width:100%; vertical-align:bottom; font-size:20px;">1</div>
        
        <div class="option_title">좌석번호</div>
        <div class="option_content" style="width:100%; vertical-align:bottom; font-size:20px;">c-1</div>
        
        <div class="option_title">이용자</div>
        <div class="option_content" style="width:100%; vertical-align:bottom; font-size:20px;">이중민(010-****-****)</div>
        
        <div class="option_title">티켓합계</div>
        <div class="option_content" style="width:100%; vertical-align:bottom; font-size:20px;">19,000원</div>
        
        <div class="option_title">환불기한</div>
        <div class="option_content" style="width:100%; vertical-align:bottom;">이용 1일 전 자정까지 신청가능<br>(환불규정에 따라 위약금이 발생할 수 있음)</div>
     
        <input type="hidden" name="row_price_value_258000" id="row_price_value_258000" value="18900">
        </div>
      </div>

<div style="padding:30px; text-align:center;">
	<span>
		<a href=""><button style="width:200px; height:50px; border:1px solid #ff4b4b; border-radius:5px; background:#fff; color:#ff4b4b; font-size:18px; font-weight:bold; cursor:pointer ">홈으로</button></a>
	</span>

	<span style="padding-left:20px;">
		<a href=""><button style="width:200px; height:50px; border:none; background:#ff4b4b; color:#fff; border-radius:5px; font-size:18px; font-weight:bold; cursor:pointer ">예매내역 전체보기</button></a>
	</span>
</div>

<!-- 구매 통계  -->


<!-- GA4 : GTM 전자상거래 전환 변수 push -->
<script>
  window.dataLayer = window.dataLayer || [];
  dataLayer.push({
    event : 'purchase',
    ecommerce : {
      'transaction_id' : '1691729526-49',
      'currency' : 'KRW',
      'value' : '18900',
      'items' : [{
        'item_id' : '4343',
        'item_name' : '라면',
        'price' : '18900',
        'item_category' : '공연',
        'item_category2' : '연극',
        'quantity' : '1'
      }]
    }
  });
</script>

<script>
  fbq('track', 'Purchase', { currency: "KRW", value: 18900 });
</script>



    </div>
</body>
</html>