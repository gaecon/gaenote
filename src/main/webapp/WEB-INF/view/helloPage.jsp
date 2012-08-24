<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/dust-full-1.0.0.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.8.0.js"></script>
<script type="text/javascript">

	var templateId = "hello";
	/* Text Template */
	//var compiled = dust.compile("hello {name}!", templateId);
	
	/* File(URL) Template */
	var template = 
			$.ajax({
				type: "GET",
				url: "/rest-sample/template/hello.t",
				dataType: "html",
				async: false
			}).responseText;
	var compiled = dust.compile(template, templateId);
	
	//load compiled template html
	dust.loadSource(compiled);

	//var jsonData = {name: "chanwook"};
	$.ajax({
		type: "GET",
		url: "/rest-sample/hello",
		dataType: "json",
		success: function(jsonData){
			dust.render(templateId, jsonData, function(err, out){
				console.log("success: " + out);
				console.log("error: " + err);

				$('#body').html(out);
			});
		}
	});
</script>
</head>
<body>

	<div id="body"></div>

</body>

</html>
