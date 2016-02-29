function checkImageType(fileName){
	var pattern = /jpg|gif|png|jpeg/i;
	return fileName.match(pattern);

}

function getFileInfo(fullName){
	var fileName,imgsrc, getLink;
	var fileLink;
	
	if(checkImageType(fullName)){
		imgsrc = "/springBoard/displayFile?fileName="+fullName;
		fileLink = fullName.substr(14);
		
		var front = fullName.substr(0,12); // /2016/01/01/ 
		var end = fullName.substr(14);
		
		getLink = "/springBoard/displayFile?fileName="+front + end;
		
	}else{
		imgsrc ="/springBoard/resources/AdminLTE/img/file.png";
		fileLink = fullName.substr(12);
		getLink = "/springBoard/displayFile?fileName="+fullName;
	}
	fileName = fileLink.substr(fileLink.indexOf("_")+1);
	
	return  {fileName:fileName, imgsrc:imgsrc, getLink:getLink, fullName:fullName};
	
}


