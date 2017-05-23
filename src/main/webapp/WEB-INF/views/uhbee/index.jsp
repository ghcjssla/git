<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="/<spring:eval expression="@propGlobal['APP_ROOT']"></spring:eval>/resources/mobile/css/smartphone.css" media="only screen and (min-device-width : 320px) and (max-device-width : 48px)">
<title>모바일 연습</title>
<style>
#shadowBox1{
    border:solid 1px black;
    width:100px;
    height:100px;
    box-shadow:10px 10px 10px rgba(0,0,0,.1);
    margin:50px;
}
#shadowBox2{
    border:solid 1px black;
    width:100px;
    height:100px;
    box-shadow:0 10px 0 rgba(0,0,0,.1);
    margin:50px;
}
#shadowBox3{
    border:solid 1px black;
    width:100px;
    height:100px;
    box-shadow:10px 0 0 rgba(0,0,0,.1);
    margin:50px;
}
#shadowBox4{
    border:solid 1px black;
    width:100px;
    height:100px;
    box-shadow:-10px -10px 10px rgba(0,0,0,.1);
    margin:50px;
}
#shadowBox5{
    border:solid 1px black;
    width:100px;
    height:100px;
    box-shadow:inset 10px 10px 10px rgba(0,0,0,.1);
    margin:50px;
}
</style>
</head>
<body>
<div id="shadowBox1">
그림자 만들어보자
</div>
<div id="shadowBox2">
그림자 만들어보자
</div>
<div id="shadowBox3">
그림자 만들어보자
</div>
<div id="shadowBox4">
그림자 만들어보자
</div>
<div id="shadowBox5">
그림자 만들어보자
</div>
</body>
</html>