<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>

<!DOCTYPE html>

<html>
<head lang="ko">
	<tiles:insertAttribute name="meta" />
	
	<title>Insert title here</title>
	
	<tiles:insertAttribute name="style" />
	<tiles:insertAttribute name="script" />
</head>

<body>
	<header>
		<tiles:insertAttribute name="header" />
	</header>
	
	<div id="body">
		<tiles:insertAttribute name="contents" />
	</div>
	
	<footer>
		<tiles:insertAttribute name="footer" />
	</footer>
</body>
</html>