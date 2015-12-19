<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<script>

var result = "${savedname}";
alert("uploadResult.jsp 파일명 : "+result);
parent.addFilePath(result);

</script>

