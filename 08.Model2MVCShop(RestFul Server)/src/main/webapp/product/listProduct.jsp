<%@ page contentType="text/html; charset=euc-kr" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page import="java.util.*"  %>
<%@ page import="com.model2.mvc.common.*" %>


<html>
<head>
<!--  <title>상품 목록조회</title>-->

<title>${param.menu=="manage"?"상품관리":"상품 목록조회"}</title>

<link rel="stylesheet" href="/css/admin.css" type="text/css">

<script type="text/javascript">

	// 검색 / page 두가지 경우 모두 Form 전송을 위해 JavaScrpt 이용  
	function fncGetList(currentPage) {
		document.getElementById("currentPage").value = currentPage;
	   	document.detailForm.submit();		
	}

</script>

<body bgcolor="#ffffff" text="#000000">

<div style="width:98%; margin-left:10px;">

<!--  <form name="detailForm" action="/listProduct.do?menu=search" method="post">-->
<!-- ////////////////////////////////////////////////////////////////////////////////////////////////////////// 
<form name="detailForm" action='/listProduct.do?&menu=${param.menu}' method="post">
////////////////////////////////////////////////////////////////////////////////////////////////////////// -->
<form name="detailForm" action='/product/listProduct?&menu=${param.menu}' method="post"><!-- 2022-04-28 shhwang -->

<%-- 
<table width="100%" height="37" border="0" cellpadding="0"	cellspacing="0">
	<tr>
		<td width="15" height="37">
			<img src="/images/ct_ttl_img01.gif" width="15" height="37"/>
		</td>
		<td background="/images/ct_ttl_img02.gif" width="100%" style="padding-left:10px;">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="93%" class="ct_ttl01">
 			<%if(menu.equals("search")){ %>
				상품 목록조회			
			<%}else if(menu.equals("manage")) { %>
				상품 관리			
			<%}%>
					</td>
				</tr>
			</table>
		</td>
		<td width="12" height="37">
			<img src="/images/ct_ttl_img03.gif" width="12" height="37"/>
		</td>
	</tr>
</table>
--%>
<table width="100%" height="37" border="0" cellpadding="0"	cellspacing="0">
	<tr>
		<td width="15" height="37">
			<img src="/images/ct_ttl_img01.gif" width="15" height="37"/>
		</td>
		<td background="/images/ct_ttl_img02.gif" width="100%" style="padding-left:10px;">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="93%" class="ct_ttl01">
						${param.menu=="manage"?"상품관리":"상품 목록조회"}
					</td>
				</tr>
			</table>
		</td>
		<td width="12" height="37">
			<img src="/images/ct_ttl_img03.gif" width="12" height="37"/>
		</td>
	</tr>
</table><br/>
<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:10px;">
	<tr>
		
		<td align="right">
			<select name="searchCondition" class="ct_input_g" style="width:80px">
				<option value="0">상품번호</option>
				<option value="1">상품명</option>
				<option value="2">상품가격</option>
			</select>
			<input type="text" name="searchKeyword"  class="ct_input_g" style="width:200px; height:19px" />
		</td>
				
		<td align="right" width="70">
			<table border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="17" height="23">
						<img src="/images/ct_btnbg01.gif" width="17" height="23">
					</td>
					<td background="/images/ct_btnbg02.gif" class="ct_btn01" style="padding-top:3px;">
						<a href="javascript:fncGetList();">검색</a>
					</td>
					<td width="14" height="23">
						<img src="/images/ct_btnbg03.gif" width="14" height="23">
					</td>
				</tr>
			</table>
		</td>
	</tr>
</table>



<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:10px;">
	<tr>
		<td colspan="11" >
			전체  ${resultPage.totalCount } 건수, 현재 ${resultPage.currentPage}  페이지
	</tr>
	<tr>
		<td class="ct_list_b" width="100">No</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b" width="150">상품명</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b" width="150">가격</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b">등록일</td>	
		<td class="ct_line02"></td>
		<td class="ct_list_b">현재상태</td>
	</tr>
	<tr>
		<td colspan="11" bgcolor="808285" height="1"></td>
	</tr>

 	<c:set var="i" value="0" />
	<c:forEach var="product" items="${list}">
		<c:set var="i" value="${ i+1 }" />
		<c:set var="menu" value="menu" />		
		<tr class="ct_list_pop">
			<td align="center">${ i }</td>
			<td></td>
			
			<!--  <td align="left"><a href="/getProduct.do?prodNo=${product.prodNo}">${product.prodName}</a></td>-->
			<td align="left"><a href="/product/getProduct?prodNo=${product.prodNo}">${product.prodName}</a></td><!-- 2022-04-28 shhwang -->
			<td></td>
			<td align="left">${product.price}</td>
			<td></td>
			<td align="left">${product.regDate}</td>		
			<td></td>
			<td align="left">
			
				판매중
			
			</td>		
		</tr>
		<tr>
		<td colspan="11" bgcolor="D6D7D6" height="1"></td>
		</tr>
	</c:forEach>

<%-- 
	<tr class="ct_list_pop">
		<td></td>
		<td align = "left">
 			<%if(menu.equals("search")){ %>
				<a href = "/getProduct.do?prodNo=${product.ProdNo}">${product.ProdName}</a>			
			<%}else if(menu.equals("manage")) { %>
				<a href = "/updateProductView.do?prodNo=${product.ProdNo}">${product.ProdName}</a>
			<%}else{ %>
			   <a href = "/getProduct.do?prodNo=${product.ProdNo}">${product.ProdName}</a>
			<% }%>
		</td>
		<td></td>
		<td align="left">${product.Price}</td>
		<td></td>
		<td align="left">${product.redDate}
		<td></td>
		<td align="left">
		<td>		
			판매중		
		</td>	
	</tr>
--%>
	
	<tr>
		<td colspan="11" bgcolor="D6D7D6" height="1"></td>
	</tr>	
<%-- 	
	<% } %>
--%>  	
</table>

<!-- PageNavigation Start... -->
<table width="100%" border="0" cellspacing="0" cellpadding="0"	style="margin-top:10px;">
	<tr>
		<td align="center">
		   <input type="hidden" id="currentPage" name="currentPage" value=""/>
	
			<jsp:include page="../common/pageNavigator.jsp"/>	
			
    	</td>
	</tr>
</table>
<!-- PageNavigation End... -->

</form>

</div>
</body>
</html>
