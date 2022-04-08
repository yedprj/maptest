<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <%@ page isELIgnored="false" %>
    <title>${title}</title>
</head>
<body>
<h2>${content}</h2>
    <button type="button" onClick="location.href='${pageContext.request.contextPath}/maps/map'"> 지도 확인</button>
    <button type="button" onClick="location.href='${pageContext.request.contextPath}/maps/map1'"> 차트 확인 </button>
    <button type="button" onClick="location.href='${pageContext.request.contextPath}/maps/map2'"> 지도 확인 </button>
    <button type="button" onClick="location.href='${pageContext.request.contextPath}/maps/map3'"> 지도 확인 </button>
    <button type="button" onClick="location.href='${pageContext.request.contextPath}/maps/map4'"> 차트 확인 </button>
</body>
</html>