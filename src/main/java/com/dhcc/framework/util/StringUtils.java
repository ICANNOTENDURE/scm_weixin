package com.dhcc.framework.util;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.dhcc.framework.common.CalendaConstants;

public  abstract class StringUtils {
	
	
	private static Log logger = LogFactory.getLog(StringUtils.class);
	public static boolean isNullOrEmpty(String value) {
		if (value == null)
			return true;

		value = value.trim();
		if (value.equals(""))
			return true;

		return false;
	}

	/**
	 * 获取对象的字符串表示，当对象为null时，返回空字符串
	 * @param value
	 * @return
	 */
	public static String notNull(Object value){
		if(null != value){
			return value.toString();
		}else{
			return CalendaConstants.ANY_STRING;
		}
	}
	
	public static String notNull(String value) {
		if (value == null)
			return CalendaConstants.ANY_STRING;

		return value;
	}

	public static String trim(String value) {
		if (value == null)
			return CalendaConstants.ANY_STRING;

		return value.trim();
	}

	public static String shortString(String value, int maxWidth) {
		if (value == null)
			return CalendaConstants.ANY_STRING;

		int width = 0, index = 0;

		while (index < value.length()) {
			int ch = value.charAt(index);
			width += ((ch & 0xFF00) == 0) ? 1 : 2; 
			if (width + 3 > maxWidth)
				return value.substring(0, index) + "...";
			index++;
		}
		return value;
	}

	public static String replace(String value, String find, String replace) {
		if (value == null)
			return CalendaConstants.ANY_STRING;
		StringBuffer buffer = new StringBuffer(value.length());
		int findLength = find.length();
		int fromIndex = 0;
		int toIndex = value.indexOf(find);

		while (toIndex >= 0) {
			buffer.append(value.substring(fromIndex, toIndex));
			fromIndex = toIndex + findLength;
			toIndex = value.indexOf(find, fromIndex);
		}
		buffer.append(value.substring(fromIndex, value.length()));
		return buffer.toString();
	}

	public static String replaceIgnoreCase(String value, String find,
			String replace) {
		if (value == null)
			return CalendaConstants.ANY_STRING;

		StringBuffer buffer = new StringBuffer(value.length());
		String valueLowerCase = value.toLowerCase();
		String findLowerCase = find.toLowerCase();

		int findLength = find.length();
		int fromIndex = 0;
		int toIndex = valueLowerCase.indexOf(findLowerCase);

		while (toIndex >= 0) {
			buffer.append(value.substring(fromIndex, toIndex));
			fromIndex = toIndex + findLength;
			toIndex = valueLowerCase.indexOf(findLowerCase, fromIndex);
		}
		buffer.append(value.substring(fromIndex, value.length()));
		return buffer.toString();
	}

	private static final DateFormat tidyDateFormat = new SimpleDateFormat(
			"yyyyMMdd");

	private static final DateFormat shortDateFormat = new SimpleDateFormat(
			"yyyy-MM-dd");

	private static final DateFormat yearMonthFormat = new SimpleDateFormat(
			"yyyy-MM");

	private static final DateFormat briefDateFormat = new SimpleDateFormat(
			"MM-dd HH:mm");

	private static final DateFormat middleDateFormat = new SimpleDateFormat(
			"yyyy-MM-dd HH:mm");

	private static final DateFormat longDateFormat = new SimpleDateFormat(
			"yyyy-MM-dd HH:mm:ss");

	private static final DateFormat compactDateFormat = new SimpleDateFormat(
			"yyyyMMddHHmmss");

	public static Date regularizeDate(Date date, int type) {
		if (date == null)
			return null;

		Calendar calendar = Calendar.getInstance();
		calendar.setTimeInMillis(new Date().getTime());

		if (type == 1) {
			calendar.set(Calendar.HOUR_OF_DAY, 0);
			calendar.set(Calendar.MINUTE, 0);
			calendar.set(Calendar.SECOND, 0);
			calendar.set(Calendar.MILLISECOND, 0);
		} else if (type == 2) {
			calendar.set(Calendar.HOUR_OF_DAY, 23);
			calendar.set(Calendar.MINUTE, 59);
			calendar.set(Calendar.SECOND, 59);
			calendar.set(Calendar.MILLISECOND, 999);
		}

		return date;
	}

	public static String formatTidyDate(Date date) {
		if (date == null)
			return CalendaConstants.ANY_STRING;

		return StringUtils.tidyDateFormat.format(date);
	}

	public static Date parseTidyDate(String value) throws ParseException {
		if (value == null)
			return null;

		return StringUtils.tidyDateFormat.parse(value);
	}

	public static Date parseTidyDate(String value, Date defaultValue) {
		try {
			if (value == null)
				return defaultValue;

			return StringUtils.tidyDateFormat.parse(value);
		} catch (ParseException e) {
			logger.debug("incorrect tidy date, default used.", e);

			return defaultValue;
		}
	}

	public static Date parseTidyDateLast(String value, Date defaultValue) {
		try {
			if (value == null)
				return defaultValue;

			return new Date(StringUtils.tidyDateFormat.parse(value).getTime()
					+ (86400000 - 1000));
		} catch (ParseException e) {
			logger.debug("incorrect tidy date, default used.", e);

			return defaultValue;
		}
	}

	public static String formatShortDate(Date date) {
		if (date == null)
			return CalendaConstants.ANY_STRING;

		return StringUtils.shortDateFormat.format(date);
	}

	/**
	 * @author tangfeng
	 * @param Date
	 * @return String
	 * @throws ParseException
	 */
	public static String formatYearMonthDate(Date date) {
		if (date == null)
			return CalendaConstants.ANY_STRING;
		return StringUtils.yearMonthFormat.format(date);
	}

	public static Date parseShortDate(String value) throws ParseException {
		if (value == null)
			return null;

		return StringUtils.shortDateFormat.parse(value);
	}

	public static Date parseShortDate(String value, Date defaultValue) {
		try {
			if (value == null)
				return defaultValue;

			return StringUtils.shortDateFormat.parse(value);
		} catch (ParseException e) {
			logger.debug("incorrect short date, default used.", e);

			return defaultValue;
		}
	}
	
	public static Date parseShort59Date(Date tempDate) {
		return new Date(StringUtils.parseShortDate(StringUtils.formatShortDate(tempDate), tempDate).getTime() + 86399999);
	}

	public static String formatBriefDate(Date date) {
		if (date == null)
			return CalendaConstants.ANY_STRING;

		return StringUtils.briefDateFormat.format(date);
	}

	public static String formatMiddleDate(Date date) {
		if (date == null)
			return CalendaConstants.ANY_STRING;

		return StringUtils.middleDateFormat.format(date);
	}

	public static Date parseMiddleDate(String value) throws ParseException {
		if (value == null)
			return null;

		return StringUtils.middleDateFormat.parse(value);
	}

	public static Date parseMiddleDate(String value, Date defaultValue) {
		try {
			if (value == null)
				return defaultValue;

			return StringUtils.middleDateFormat.parse(value);
		} catch (ParseException e) {
			logger.debug("incorrect middle date, default used.", e);

			return defaultValue;
		}
	}

	public static String formatLongDate(Date date) {
		if (date == null)
			return CalendaConstants.ANY_STRING;

		return StringUtils.longDateFormat.format(date);
	}

	public static Date parseLongDate(String value) throws ParseException {
		if (value == null)
			return null;

		return StringUtils.longDateFormat.parse(value);
	}

	public static Date parseLongDate(String value, Date defaultValue) {
		try {
			if (value == null)
				return defaultValue;

			return StringUtils.longDateFormat.parse(value);
		} catch (ParseException e) {
			logger.debug("incorrect long date, default used.", e);

			return defaultValue;
		}
	}

	public static String formatCompactDate(Date date) {
		if (date == null)
			return CalendaConstants.ANY_STRING;

		return StringUtils.compactDateFormat.format(date);
	}

	public static Date parseCompactDate(String value) throws ParseException {
		if (value == null)
			return null;

		return StringUtils.compactDateFormat.parse(value);
	}

	public static Date parseCompactDate(String value, Date defaultValue) {
		try {
			if (value == null)
				return defaultValue;

			return StringUtils.compactDateFormat.parse(value);
		} catch (ParseException e) {
			logger.debug("incorrect compact date, default used.", e);

			return defaultValue;
		}
	}

	public static Date parseDate(String value, Date defaultValue) {
		try {
			if (value == null)
				return defaultValue;

			String format = "yyyyMMdd";
			if (value.indexOf("-") > 0) {
				format = "yyyy-MM-dd";
			} else if (value.indexOf("/") > 0) {
				if (value.length() == 8)
					value = "20" + value;
				format = "yyyy/MM/dd";
			}
			DateFormat dateFormat = new SimpleDateFormat(format);

			return dateFormat.parse(value);

		} catch (ParseException e) {
			logger.debug("incorrecttidy date, default used.", e);

			return defaultValue;
		}
	}

	public static boolean parseBoolean(String value) {
		if (value == null)
			return false;

		return value.equalsIgnoreCase("true");
	}

	public static boolean parseBoolean(String value, boolean defaultValue) {
		if (value == null)
			return defaultValue;

		if (value.equalsIgnoreCase("true"))
			return true;

		if (value.equalsIgnoreCase("false"))
			return false;

		return defaultValue;
	}

	public static int parseInt(String value, int defaultValue) {
		if (value == null)
			return defaultValue;

		try {
			return Integer.parseInt(value);
		} catch (NumberFormatException e) {
			logger.debug("Bad integer, default used.", e);
			return defaultValue;
		}
	}

	public static long parseLong(String value, long defaultValue) {
		if (value == null)
			return defaultValue;

		try {
			return Long.parseLong(value);
		} catch (NumberFormatException e) {
			logger.debug("Bad long integer, default used.", e);
			return defaultValue;
		}
	}

	public static boolean checkEmail(String email) {
		String regex = "\\w+([-+.]\\w+)*@\\w+([-.]\\w+)*\\.\\w+([-.]\\w+)*";
		Pattern p = Pattern.compile(regex);
		Matcher m = p.matcher(email);
		return m.find();
	}

	public static String getSeparator() {
		String separator = "";
		String osName = System.getProperty("os.name");
		if (osName.startsWith("Windows"))
			separator = "/";
		else
			separator = "/";

		return separator;
	}

	/**
	 * @author tangfeng
	 * @param sourceStr
	 * @param ch
	 * @return
	 */
	public static int getCharNum(String sourceStr, char ch) {
		if (sourceStr.indexOf(ch) < 0)
			return -1;
		else {
			char[] source = sourceStr.toCharArray();
			int j = 0;
			for (int i = 0; i < source.length; i++) {
				if (source[i] == ch)
					++j;
			}
			return j;
		}
	}
	
	public static String getRemainderStr(String existStr, String separator, String allStr){
		if(existStr == null || "".equals(existStr) || allStr == null || "".equals(allStr))
			return allStr;
		String splitAllStr[] = allStr.split(",");
		String splitAllStr_ = "";
		String remainderStr = "";
		for(int i = 0; i < splitAllStr.length; i++){
			splitAllStr_ = splitAllStr[i];
			if(!"".equals(splitAllStr_) && existStr.indexOf(splitAllStr_) == -1){
				if("".equals(remainderStr)){
					remainderStr = splitAllStr_;
				}else
					remainderStr += "," + splitAllStr_;
			}
		}
		return remainderStr;
	}
	
	public static String getShortDateStrFormList(List<Date> dates){
		StringBuffer sb =  new StringBuffer();
		if(dates != null && dates.size() != 0){
			Iterator it = dates.iterator();
			int i = 0;
			while(it.hasNext()){
				if(i != 0)
					sb.append(",");
				sb.append(formatShortDate((Date)it.next()));
				i ++;
			}
		}
		return sb.toString();
	}
	
	public static String getNOZero(float num){
		if(num * 10 == 0){
			return 0 + "";
		}
		return num + "";
	}
	
	public static String get3Str(String prefixStr, Integer last3Int){
		String _3Str = "";
		if(last3Int < 10)
			_3Str = "00" + last3Int;
		else if(10 <= last3Int && last3Int < 100){
			_3Str = "0" + last3Int;
		}else{
			_3Str = "" + last3Int;
		}
		return prefixStr + _3Str;
	}
	
	public static String getSeq(String prefixStr, Integer index){
		String _3Str = "" + index;
		if(!"".equals(prefixStr))
			_3Str = prefixStr + "." + index;
		return _3Str;
	}
	
	public static String replaceEnter(String oldStr) {
		   //Pattern p = Pattern.compile("|\t|\r|\n");
		   Pattern p = Pattern.compile("\r|\n");
		   Matcher m = p.matcher(oldStr);
		   return m.replaceAll("\t");
	}
	
	public static String getSeason(int month){
		if(month > 0 && month <=3){
			return "Q1";
		}else if(month >= 4 && month <=6){
			return "Q2";
		}else if(month >= 7 && month <=9){
			return "Q3";
		}else if(month >= 10 && month <= 12){
			return "Q4";
		}
		return "";
	}
	
	
	public static List<String> convertList(String idStr, String separator){
		List<String> ids = new ArrayList();
		if(!StringUtils.isNullOrEmpty(idStr)){
			String[] idArray = idStr.split(separator);
			for(int i = 0; i < idArray.length; i++){
				if(!"".equals(idArray[i])){
					ids.add(idArray[i]);
				}
			}
		}
		return ids;
	}
	
	



	/**
	 * 去掉字符串中引用数字的双引号
	 * @param str
	 * @return
	 */
	public static String removeNubericSoftquote(String str){
		String result = new String(str);
		String numberReg = "\\d+(\\.\\d+)?";
		String reg = "(\"" + numberReg + "\")";
		Pattern pattern = Pattern.compile(reg);
		Matcher matcher = pattern.matcher(str);
		while(matcher.find()){
			result = result.replaceAll(matcher.group(0), matcher.group(0).replaceAll("\"", ""));
		}
		return result;
	}
	
	  public static String getDaysBetweenTwoDates(String dateFrom, String dateEnd) {
	        Date dtFrom = null;
	        Date dtEnd = null;
	        dtFrom = toDate(dateFrom, "yyyy-MM-dd");
	        dtEnd = toDate(dateEnd, "yyyy-MM-dd");
	        long begin = dtFrom.getTime();
	        long end = dtEnd.getTime();
	        long inter = end - begin;
	        if (inter < 0) {
	            inter = inter * (-1);
	        }
	        long dateMillSec = 24 * 60 * 60 * 1000;
	       
	        long dateCnt =  inter / dateMillSec;
	       
	        long remainder = inter % dateMillSec;
	       
	        if (remainder != 0) {
	            dateCnt++;
	        }
	        return String.valueOf(dateCnt);
	    }
	  
	  private static Date toDate(String sDate, String sFmt) {
	        Date dt = null;
	        try {
	            dt = new SimpleDateFormat(sFmt).parse(sDate);
	        } catch (ParseException e) {
	            return dt;
	        }
	        return dt;
	    }
	  
	  
	  public static void main(String[] args){
		  System.out.println(StringUtils.getDaysBetweenTwoDates("2011-11-10","2011-11-30"));
	  }
}