package kr.or.ddit.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

public class Utils {
	// 문자열을 숫자로 변경해준다.
	// 문자열에 오류가 있을 경우 default 값을 반환한다.
	public static int parseInt(String str, int defaultValue) {
		int returnValue = defaultValue;
		try {
			if (str == null) {
				return returnValue;
			}

			returnValue = Integer.parseInt(str);
		} catch (Exception e) {
			return returnValue;
		}

		return returnValue;
	}

	// 문자열이 null이거나 ""인 경우 true를 리턴한다.
	public static boolean isNullOrEmpty(String str) {
		if (str == null || "".equals(str)) {
			return true;
		} else {
			return false;
		}
	}
}

class MyDate {
	public static String DefaultDateFormat = "yyyy-MM-dd HH:mm:ss";

	// 특정 날짜에 대하여 요일을 구함(일, 월, 화,.., 토 순서)
	public static String getDateDay(String date, boolean bKorean) throws Exception {
		String day = "";

		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		Date nDate = dateFormat.parse(date);

		Calendar cal = Calendar.getInstance();
		cal.setTime(nDate);

		int dayNum = cal.get(Calendar.DAY_OF_WEEK);

		switch (dayNum) {
		case 1:
			day = Constants.DAY_OF_WEEK_SUNDAY_KOR;
			break;
		case 2:
			day = Constants.DAY_OF_WEEK_MONDAY_KOR;
			break;
		case 3:
			day = Constants.DAY_OF_WEEK_TUESDAY_KOR;
			break;
		case 4:
			day = Constants.DAY_OF_WEEK_WEDNESDAY_KOR;
			break;
		case 5:
			day = Constants.DAY_OF_WEEK_THURSDAY_KOR;
			break;
		case 6:
			day = Constants.DAY_OF_WEEK_FRIDAY_KOR;
			break;
		case 7:
			day = Constants.DAY_OF_WEEK_SATURDAY_KOR;
			break;
		}

		return day;
	}

	// 시간 차이 계산
	public static int getDiffTime(int type, String dateStr1, String dateStr2, String dateFormatStr) {
		try {
			if (Utils.isNullOrEmpty(dateFormatStr)) {
				dateFormatStr = DefaultDateFormat;
			}

			SimpleDateFormat dateFormat1 = new SimpleDateFormat(dateFormatStr);
			SimpleDateFormat dateFormat2 = new SimpleDateFormat(dateFormatStr);
			Date date1 = dateFormat1.parse(dateStr1);
			Date date2 = dateFormat2.parse(dateStr2);

			long diffSecond = (date1.getTime() - date2.getTime()) / 1000;
			int result = -1;

			switch (type) {
			case Calendar.DATE:
				result = (int) diffSecond / (60 * 60 * 24);
				break;
			case Calendar.HOUR:
				result = (int) diffSecond / (60 * 60);
				break;
			case Calendar.MINUTE:
				result = (int) diffSecond / 60;
				break;
			}

			return result;
		} catch (ParseException ex) {
			return 0;
		}
	}

	// 어느 날이 더 빠른지 두 날짜비교
	// 왼쪽날이 더 빠르면 -1, 같으면 0, 오른쪽이 빠르면 1
	public static int compareDate(String left, String right, String dateFormat) throws ParseException {

		SimpleDateFormat simpleDateFormatLeft = new SimpleDateFormat(dateFormat);
		Date dateLeft = simpleDateFormatLeft.parse(left);

		SimpleDateFormat simpleDateFormatRight = new SimpleDateFormat(dateFormat);
		Date dateRight = simpleDateFormatRight.parse(right);

		Calendar calendarLeft = Calendar.getInstance();
		calendarLeft.setTime(dateLeft);

		int result = dateLeft.compareTo(dateRight);
		return result;
	}

	// 날짜 비교
	// date1이 이르면 음수
	// 같으면 0
	// date1이 늦으면 양수
	public static int compareDate(String dateStr1, String dateStr2) {
		try {
			SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
			Date date1 = dateFormat.parse(dateStr1);
			Date date2 = dateFormat.parse(dateStr2);

			if (date1.before(date2)) {
				return -1;
			} else if (date1.after(date2)) {
				return 1;
			} else {
				return 0;
			}
		} catch (ParseException ex) {
			return 0;
		}
	}

	// 날짜 비교
	// date1이 이르면 음수
	// 같으면 0
	// date1이 늦으면 양수
	public static int compareDate(Date date1, Date date2) {
		try {
			if (date1.before(date2)) {
				return -1;
			} else if (date1.after(date2)) {
				return 1;
			} else {
				return 0;
			}
		} catch (Exception ex) {
			return 0;
		}
	}
}