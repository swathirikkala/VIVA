<%@page import="com.viva.dto.BusinessValue"%>
<%@page import="com.viva.dao.util.LookUp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link href="./css/fSelect.css" rel="stylesheet">
<script src="./js/jquery-3.4.0.min.js"></script>
<script src="./js/fSelect.js"></script>
<script>
	(function($) {
	    $(function() {
	        window.fs_test = $('.test').fSelect();
	    });
	})(jQuery);
</script>
</head>
	<body>
	    <select class="test" multiple="multiple">
			<option value="" disabled="disabled">Option 1</option>
			<%for(BusinessValue bv : LookUp.getBusinessValues()){%>
	        <option value="<%=bv.getId()%>"><%=bv.getName()%></option>
	        <%}%>
	    </select>
	</body>
</html>