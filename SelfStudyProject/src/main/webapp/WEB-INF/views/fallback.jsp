<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="${pageContext.request.contextPath }/resources/js/jquery-3.7.0.js"></script>
<script type="text/javascript">
	$(function() {
		alert("${msg}");
		history.back();
	});
</script>
