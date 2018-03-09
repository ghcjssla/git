package com.happylopers.util;

import java.awt.image.BufferedImage;
import java.io.File;
import java.text.DecimalFormat;
import java.util.Calendar;
import java.util.UUID;

import javax.imageio.ImageIO;

import org.imgscalr.Scalr;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.util.FileCopyUtils;

public class UploadFileUtils {
	private static final Logger logger = LoggerFactory.getLogger(UploadFileUtils.class);
	
	public static String uploadFile(String uploadPath, String originalName, byte[] fileData)throws Exception{
		UUID uid = UUID.randomUUID();
		System.out.println("uploadFile 호출 ");
		
		String savedName = uid.toString()+"_"+originalName;
		String savedpath = calcPath(uploadPath);
		
		System.out.println("uploadFile 호출  uploadPath : "+uploadPath);
		System.out.println("uploadFile 호출  savedpath : "+savedpath);
		System.out.println("uploadFile 호출  uploadPath+savedpath : "+uploadPath+savedpath);
		
		File target = new File(uploadPath+savedpath,savedName);
		FileCopyUtils.copy(fileData, target);
		
		String formatName = originalName.substring(originalName.lastIndexOf(".")+1);
		String uploadedFileName = null;
		
		if(MediaUtils.getMediaType(formatName) != null){
			uploadedFileName = makeThumbnail(uploadPath, savedpath, savedName);
		}else{
			uploadedFileName = makeIcon(uploadPath, savedpath, savedName);
		}
		
		System.out.println("uploadFile 호출 : "+uploadedFileName);
		
		return uploadedFileName;
	}
	
	private static String makeIcon(String uploadPath, String savedpath, String fileName) {
		String iconName = uploadPath + savedpath + File.separator + fileName;
		
		return iconName.substring(uploadPath.length()).replace(File.separatorChar, '/');
	}

	private static String calcPath(String uploadPath){
		Calendar cal = Calendar.getInstance();
		
		String yearPath = File.separator+cal.get(Calendar.YEAR);
		String monthPath = yearPath+File.separator+new DecimalFormat("00").format(cal.get(Calendar.MONTH)+1);
		String datePath = monthPath +File.separator+ new DecimalFormat("00").format(cal.get(Calendar.DATE));
		
		makeDir(uploadPath, yearPath,monthPath,datePath);
		System.out.println("calcPath 호출  :"+datePath);
		return datePath;
	}
/**
 * 년도/월/일 구조로 폴더를 만든다.
 * @param uploadPath
 * @param paths
 */
	private static void makeDir(String uploadPath, String...paths) {
		if(new File(paths[paths.length-1]).exists()){
			return;
		}
		System.out.println("makeDir 호출");
		for(String path : paths){
			File dirPath = new File(uploadPath + path);
			System.out.println("makeDir 호출  uploadPath + path : "+uploadPath+" "+path);
			if(! dirPath.exists()){
				dirPath.mkdir();
			}
		}
	}
	
	private static String makeThumbnail(String uploadPath, String path, String fileName)throws Exception{
		
		BufferedImage sourceImg = ImageIO.read(new File(uploadPath + path, fileName));
		
		BufferedImage destImg = Scalr.resize(sourceImg, Scalr.Method.AUTOMATIC, Scalr.Mode.FIT_TO_HEIGHT,100);
		
		String thumbnailName = uploadPath + path + File.separator + "s_"+fileName;
		
		File newFile = new File(thumbnailName);
		String formatName = fileName.substring(fileName.lastIndexOf(".")+1);
		
		ImageIO.write(destImg, formatName.toUpperCase(), newFile);
		return thumbnailName.substring(uploadPath.length()).replace(File.separatorChar, '/');
	}
}
