<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<title>Home</title>
</head>
<body>
<h1>
	Hello world!  

</h1>

<P>  The time on the server is ${serverTime}.</P>
<a href="test.do">test</a>
<a href="testGet.do"> testGet </a>
<a href="headerWithCate.do">headerWithCate</a>
<a href="sns/redirect.do">kakao</a>
<a href="sns/googleRedirect.do">google</a>
<a href="sns/googlelogin.do">googlelogin</a>
</body>
</html>
