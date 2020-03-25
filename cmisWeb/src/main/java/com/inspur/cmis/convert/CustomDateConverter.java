package com.inspur.cmis.convert;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.core.convert.converter.Converter;

public class CustomDateConverter implements Converter<String, Date> {

	@Override
	public Date convert(String source) {
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
		Date today = new Date();
		Date converDay = null;
		try {
		   if(null == source || "".equals(source))
			   converDay = simpleDateFormat.parse(simpleDateFormat.format(today));
		   else
			converDay = simpleDateFormat.parse(source);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return converDay;
	}
}