package com.happylopers.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.util.UUID;

import javax.annotation.Resource;

import org.apache.commons.io.IOUtils;
import org.happylopers.util.MediaUtils;
import org.happylopers.util.UploadFileUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class UploadController {
	@Resource(name = "uploadPath")
	private String uploadPath;
	
	private static final Logger logger = LoggerFactory.getLogger(UploadController.class);
	
	@RequestMapping(value ="/uploadForm", method = RequestMethod.GET)
	public void uploadForm(Model model){
		logger.info("/uploadForm method = RequestMethod.GET");
		
		model.addAttribute("savedname","test");
	}
	
	@RequestMapping(value ="/uploadForm", method = RequestMethod.POST)
	public String uploadForm(MultipartFile file, Model model)throws Exception{
		logger.info("/uploadForm method = RequestMethod.POST");
		
		logger.info("originalName:"+file.getOriginalFilename());
		logger.info("size:"+file.getSize());
		logger.info("contentTYpe:"+file.getContentType());
		
		String savedName = uploadFile(file.getOriginalFilename(),file.getBytes());
		logger.info("-------->실제 파일 이름 : "+savedName);
		model.addAttribute("savedname",savedName);
		
		return "uploadResult";
	}

	private String uploadFile(String originalFilename, byte[] fileData)throws Exception {
		UUID uid = UUID.randomUUID();
		
		String savedName = uid.toString()+"_"+originalFilename;
		
		File target = new File(uploadPath,savedName);
		
		FileCopyUtils.copy(fileData, target);
		return savedName;
	}
	
	@RequestMapping(value="/uploadAjax", method = RequestMethod.GET)
	public void uploadAjax(){
		logger.info("/uploadAjax 호출");
	}
	@ResponseBody
	@RequestMapping(value="/uploadAjax", method = RequestMethod.POST, produces = "text/plain; charset=UTF-8")
	public ResponseEntity<String> uploadAjax(MultipartFile file)throws Exception{
		
		logger.info("/uploadAjax 호출");
		logger.info("originalName:"+file.getOriginalFilename());
		logger.info("size:"+file.getSize());
		logger.info("contentTYpe:"+file.getContentType());
		logger.info("uploadPath : "+uploadPath);
		
		return new ResponseEntity<String>(UploadFileUtils.uploadFile(uploadPath, file.getOriginalFilename(), file.getBytes()),HttpStatus.CREATED);
	}
	@ResponseBody
	@RequestMapping("/displayFile")
	public ResponseEntity<byte[]> displayFile(String fileName)throws Exception{
		
		InputStream in = null;
		ResponseEntity<byte[]> entity = null;
		
		logger.info("FILE NAME : "+ fileName);
		
		try {
			String formatName = fileName.substring(fileName.lastIndexOf(".")+1);
			
			MediaType mType = MediaUtils.getMediaType(formatName);
			
			HttpHeaders headers = new HttpHeaders();
			
			in = new FileInputStream(uploadPath+fileName);
			
			if(mType != null){
				headers.setContentType(mType);
			}else{
				fileName = fileName.substring(fileName.indexOf("_")+1);
				headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
				headers.add("Content-Disposition", "attachment; filename=\""+new String(fileName.getBytes("UTF-8"),"ISO-8859-1")+"\"");
			}
			
			entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(in),headers,HttpStatus.CREATED);
			
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<byte[]>(HttpStatus.BAD_REQUEST);
		}finally {
			in.close();
		}
		return entity;
	}
	
	@ResponseBody
	@RequestMapping(value="/deleteFile", method=RequestMethod.POST)
	public ResponseEntity<String> deleteFile(String fileName){
		logger.info("delete file : "+fileName);
		String formatName = fileName.substring(fileName.lastIndexOf(".")+1);
		
		MediaType mType = MediaUtils.getMediaType(formatName);
		
		if(mType != null){
			String front = fileName.substring(0, 12);
			String end = fileName.substring(14);
			new File(uploadPath+(front+end).replace('/', File.separatorChar)).delete();
			logger.info("삭제경로 "+uploadPath+(front+end).replace('/', File.separatorChar));
		}
		new File(uploadPath+fileName.replace('/', File.separatorChar)).delete();
		
		logger.info("삭제경로 "+uploadPath+fileName.replace('/', File.separatorChar));
		return new ResponseEntity<String>("deleted",HttpStatus.OK);
	}
	
	@ResponseBody
	@RequestMapping(value="/deleteAllFiles", method=RequestMethod.POST)
	public ResponseEntity<String> deleteFile(@RequestParam("files[]") String[] files){
		logger.info("모든 파일 삭제 : "+ files);
		
		if(files == null || files.length == 0){
			return new ResponseEntity<String>("deleted", HttpStatus.OK);
		}
		
		for(String fileName : files){
			String formatName = fileName.substring(fileName.lastIndexOf(".")+1);
			MediaType mType = MediaUtils.getMediaType(formatName);
			
			if(mType != null){
				String front = fileName.substring(0, 12);
				String end = fileName.substring(14);
				new File(uploadPath+(front+end).replace('/', File.separatorChar)).delete();
				logger.info("삭제경로 "+uploadPath+(front+end).replace('/', File.separatorChar));
			}
			logger.info("삭제경로 "+uploadPath+fileName.replace('/', File.separatorChar));
			new File(uploadPath+fileName.replace('/', File.separatorChar)).delete();
		}
		return new ResponseEntity<String>("deleted", HttpStatus.OK);
	}
}
