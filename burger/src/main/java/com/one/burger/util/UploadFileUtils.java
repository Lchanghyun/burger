package com.one.burger.util;

import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.File;
import java.text.DecimalFormat;
import java.util.Calendar;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import javax.imageio.ImageIO;

import org.imgscalr.Scalr;
import org.springframework.util.FileCopyUtils;

public class UploadFileUtils {
	
	public static String uploadFile(String uploadPath, String originalName, byte[] fileData) throws Exception{
		UUID uid = UUID.randomUUID();
		String savedName = uid.toString()+"_"+originalName;
		String savedPath = calcPath(uploadPath);
		File target = new File(uploadPath+savedPath, savedName);
		FileCopyUtils.copy(fileData, target);
		String path = savedPath.replace(File.separatorChar, '/')+'/'+savedName;
		return path;
	}
	
	public static String makeThumbnail(String uploadPath, String fileName, byte[] filedata) throws Exception{
		// 디렉토리 확인
		String savedPath = File.separator+"thumbnail";
		makeDir(uploadPath, savedPath);
		// 이미지 변경
		ByteArrayInputStream bs = new ByteArrayInputStream(filedata);
		BufferedImage image = ImageIO.read(bs);
		BufferedImage thumbImage = Scalr.resize(image, Scalr.Method.AUTOMATIC, Scalr.Mode.FIT_TO_WIDTH,300);
		
		String saveName = savedPath+File.separator+"th_"+fileName;
		String thumbnailName = uploadPath+saveName;
		File newFile = new File(thumbnailName);
		String formatName = fileName.substring(fileName.lastIndexOf(".")+1);
		// 이미지 출력
		ImageIO.write(thumbImage, formatName.toUpperCase(), newFile);
		saveName = saveName.replace(File.separatorChar, '/');
		
		return saveName;
	}
	public static String calcPath(String uploadPath) {
		Calendar cal = Calendar.getInstance();
		String yearPath = File.separator + cal.get(Calendar.YEAR);
		String monthPath = yearPath + File.separator + new DecimalFormat("00").format(cal.get(Calendar.MONTH)+1);
		String datePath = monthPath + File.separator + new DecimalFormat("00").format(cal.get(Calendar.DATE));
		makeDir(uploadPath, yearPath, monthPath, datePath);
		return datePath;
	}
	private static void makeDir(String uploadPath, String... paths) {
		if(new File(paths[paths.length-1]).exists()) {
			return;
		}
		for(String path:paths) {
			File dir = new File(uploadPath + path);
			if(!dir.exists()) {
				dir.mkdir();
			}
		}
	}
}
