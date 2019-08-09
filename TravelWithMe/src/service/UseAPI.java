package service;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.StringReader;
import java.io.UnsupportedEncodingException;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLConnection;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.xmlpull.v1.XmlPullParser;
import org.xmlpull.v1.XmlPullParserException;
import org.xmlpull.v1.XmlPullParserFactory;

import model.apiModel.AttractionIntro;
import model.apiModel.CourseInfo;
import model.apiModel.CourseIntro;
import model.apiModel.CultureIntro;
import model.apiModel.DetailInfo;
import model.apiModel.FestivalIntro;
import model.apiModel.FoodIntro;
import model.apiModel.Info;
import model.apiModel.LeportsIntro;
import model.apiModel.LodgingIntro;
import model.apiModel.ShoppingIntro;

public class UseAPI {
	private String myKey = 
			"6DRAb8%2BO%2FnG%2FK8Vrtw%2BPJAIOidSJtbyPQk9Jgdor64jBkLJCDTS9wevCHe0%2F26PytkRg4cURECf7%2Ba9F6M8lPA%3D%3D";

	private String commonOpt = "?ServiceKey=" + myKey
			+ "&MobileOS=ETC"
			+ "&MobileApp=TourAPI3.0_Guide";

	public HashMap<String, Object> totalSearch(String pageNo, String keyword){
		HashMap<String, Object> resultInfo = null;
		try {
			String k = URLEncoder.encode(keyword, "UTF-8");

			URL url = 
					new URL("http://api.visitkorea.or.kr/openapi/service/rest/KorService/searchKeyword"
							+ commonOpt
							+ "&areaCode="
							+ "&sigunguCode="
							+ "&cat1="
							+ "&cat2="
							+ "&cat3="
							+ "&listYN=Y"
							+ "&arrange=A"
							+ "&numOfRows=8"
							+ "&pageNo=" + pageNo
							+ "&keyword=" + k );

			resultInfo = searchParser(url);
			resultInfo.put("keyword", keyword);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return resultInfo;
	}

	public HashMap<String, Object> festivalSearch(String pageNo, String areaCode, String eventStartDate, String eventEndDate) {
		HashMap<String, Object> resultInfo = null;
		String con_eventStartDate = eventStartDate.replace("-", "");
		String con_eventEndDate = eventEndDate.replace("-", "");

		try {
			URL url = 
					new URL("http://api.visitkorea.or.kr/openapi/service/rest/KorService/searchFestival"
							+ commonOpt
							+ "&eventStartDate=" + con_eventStartDate
							+ "&eventEndDate=" + con_eventEndDate
							+ "&areaCode=" + areaCode
							+ "&sigunguCode="
							+ "&cat1=&cat2=&cat3="
							+ "&listYN=Y"
							+ "&arrange=A"
							+ "&numOfRows=8"
							+ "&pageNo=" + pageNo);

			resultInfo = searchParser(url);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return resultInfo;
	}

	public HashMap<String, Object> areaSearch(String pageNo, String areacode){
		HashMap<String, Object> resultInfo = null;

		try {
			URL url = 
					new URL("http://api.visitkorea.or.kr/openapi/service/rest/KorService/areaBasedList"
							+ "?ServiceKey=" + myKey
							+ "&contentTypeId="
							+ "&areaCode=" + areacode
							+ "&sigunguCode="
							+ "&cat1=&cat2=&cat3="
							+ "&listYN=Y"
							+ "&MobileOS=ETC"
							+ "&MobileApp=TourAPI3.0_Guide"
							+ "&arrange=A"
							+ "&numOfRows=8"
							+ "&pageNo=" + pageNo);

			resultInfo = searchParser(url);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return resultInfo;
	}

	public HashMap<String, Object> detailSearch(String contentid, String contenttypeid) {
		HashMap<String, Object> resultInfo = null;
		try {
			URL url = 
					new URL( "http://api.visitkorea.or.kr/openapi/service/rest/KorService/detailCommon"
							+ commonOpt
							+ "&contentTypeId=" + contenttypeid
							+ "&contentId=" + contentid
							+ "&firstImageYN=Y"
							+ "&areacodeYN=Y"
							+ "&catcodeYN=Y"
							+ "&addrinfoYN=Y"
							+ "&mapinfoYN=Y"
							+ "&overviewYN=Y"
							+ "&transGuideYN=Y");

			resultInfo = searchParser(url);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		resultInfo.put("detailIntro", detailIntro(contentid, contenttypeid));
		resultInfo.put("detailInfo", detailInfoParser(contentid, contenttypeid));
		return resultInfo;
	}

	public Object detailIntro(String contentid, String contenttypeid) {
		Object returnVal = null;
		try {
			URL url = 
					new URL("http://api.visitkorea.or.kr/openapi/service/rest/KorService/detailIntro"
							+ "?ServiceKey=" + myKey
							+ "&contentTypeId=" + contenttypeid
							+ "&contentId=" + contentid
							+ "&MobileOS=ETC"
							+ "&MobileApp=TourAPI3.0_Guide"
							+ "&introYN=Y");
			switch (contenttypeid) {
			case "12":
				returnVal = attractionIntroParser(url);
				break;
			case "14":
				returnVal = cultureIntroParser(url);
				break;
			case "15":
				returnVal = festivalIntroParser(url);
				break;
			case "25":
				returnVal = courseIntroParser(url);
				break;
			case "28":
				returnVal = leportsIntroParser(url);
				break;
			case "32":
				returnVal = lodgingIntroParser(url);
				break;
			case "38":
				returnVal = shoppingIntroParser(url);
				break;
			case "39":
				returnVal = foodIntroParser(url);
				break;
			default:
				System.out.println("?? 어떠한것도 해당되지 않아버림;");
				break;
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return returnVal;
	}

	public Object detailInfoParser(String contentid, String contenttypeid) {
		List<DetailInfo> detailList = null;
		List<CourseInfo> courseList = null;
		Object resultVal = null;
		try {
			URL url = 
					new URL("http://api.visitkorea.or.kr/openapi/service/rest/KorService/detailInfo"
							+ "?ServiceKey=" + myKey
							+ "&contentTypeId=" + contenttypeid
							+ "&contentId=" + contentid
							+ "&MobileOS=ETC"
							+ "&MobileApp=TourAPI3.0_Guide"
							+ "&listYN=Y");

			XmlPullParser parser = requestAPI(url);

			int eventType = parser.getEventType();

			if(!contenttypeid.equals("25")) {
				DetailInfo dInfo = null;
				detailList = new ArrayList<DetailInfo>();
				while(eventType != XmlPullParser.END_DOCUMENT) { //문서가 끝날때 까지 반복

					switch (eventType) {
					case XmlPullParser.END_DOCUMENT:
						break;
					case XmlPullParser.START_DOCUMENT:
						break;

					case XmlPullParser.END_TAG:{
						String tag = parser.getName();
						if(tag.equals("item")) {
							detailList.add(dInfo);
							dInfo = null;
						}
					}
					case XmlPullParser.START_TAG:{
						String tag = parser.getName();

						switch (tag) {
						case "item":
							dInfo = new DetailInfo();
							break;
						case "fldgubun":
							if(dInfo!=null) 
								dInfo.setFldgubun(parser.nextText());
							break;
						case "infoname":
							if(dInfo!=null) 
								dInfo.setInfoname(parser.nextText());
							break;
						case "infotext":
							if(dInfo!=null) 
								dInfo.setInfotext(parser.nextText());
							break;
						case "serialnum":
							if(dInfo!=null) 
								dInfo.setSerialnum(parser.nextText());
							break;
						}			
					}
					}	
					eventType = parser.next();
				}
				resultVal = detailList;
			}else {
				CourseInfo cInfo = null;
				courseList = new ArrayList<CourseInfo>();
				while(eventType != XmlPullParser.END_DOCUMENT) { //문서가 끝날때 까지 반복

					switch (eventType) {
					case XmlPullParser.END_DOCUMENT:
						break;
					case XmlPullParser.START_DOCUMENT:
						break;

					case XmlPullParser.END_TAG:{
						String tag = parser.getName();
						if(tag.equals("item")) {
							courseList.add(cInfo);
							cInfo = null;
						}
					}
					case XmlPullParser.START_TAG:{
						String tag = parser.getName();

						switch (tag) {
						case "item":
							cInfo = new CourseInfo();
							break;
						case "subcontentid":
							if(cInfo!=null) 
								cInfo.setSubcontentid(parser.nextText());
							break;
						case "subdetailalt":
							if(cInfo!=null) 
								cInfo.setSubdetailalt(parser.nextText());
							break;
						case "subdetailimg":
							if(cInfo!=null) 
								cInfo.setSubdetailimg(parser.nextText());
							break;
						case "subdetailoverview":
							if(cInfo!=null) 
								cInfo.setSubdetailoverview(parser.nextText());
							break;
						case "subname":
							if(cInfo!=null) 
								cInfo.setSubname(parser.nextText());
							break;
						case "subnum":
							if(cInfo!=null) 
								cInfo.setSubnum(parser.nextText());
							break;
						}			
					}
					}	
					eventType = parser.next();
				}
				resultVal = courseList;
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return resultVal;
	}


	public XmlPullParser requestAPI(URL url) {
		URLConnection urlConn;
		BufferedReader br = null;
		XmlPullParser parser = null;
		try {
			urlConn = url.openConnection();
			br = new BufferedReader(
					new InputStreamReader(urlConn.getInputStream()));

			String msg = null;
			String data = "";
			while((msg = br.readLine()) != null) {
				data += msg;
			}

			XmlPullParserFactory factory = XmlPullParserFactory.newInstance();
			parser = factory.newPullParser();
			parser.setInput(new StringReader(data));

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			if(br != null) {
				try {
					br.close();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
		return parser;
	}

	public HashMap<String, Object> searchParser(URL url){
		HashMap<String, Object> resultInfo = new HashMap<String, Object>();
		List<Info> ilist = new ArrayList<Info>();
		XmlPullParser parser = requestAPI(url);
		try {
			int eventType = parser.getEventType();

			Info info = null;
			while(eventType != XmlPullParser.END_DOCUMENT) { //문서가 끝날때 까지 반복

				switch (eventType) {
				case XmlPullParser.END_DOCUMENT:
					break;
				case XmlPullParser.START_DOCUMENT:
					break;

				case XmlPullParser.END_TAG:{
					String tag = parser.getName();
					if(tag.equals("item")) {
						ilist.add(info);
						info = null;
					}
				}
				case XmlPullParser.START_TAG:{
					String tag = parser.getName();

					switch (tag) {
					case "item":
						info = new Info();
						break;
					case "addr1":
						if(info!=null) 
							info.setAddr1(parser.nextText());
						break;
					case "addr2":
						if(info!=null) 
							info.setAddr2(parser.nextText());
						break;
					case "areacode":
						if(info!=null) 
							info.setAreacode(parser.nextText());
						break;
					case "booktour":
						if(info!=null)  
							info.setBooktour(parser.nextText());
						break;
					case "cat1":
						if(info!=null) 
							info.setCat1(parser.nextText());
						break;
					case "cat2":
						if(info!=null) 
							info.setCat2(parser.nextText());
						break;
					case "cat3":
						if(info!=null) 
							info.setCat3(parser.nextText());
						break;
					case "contentid":
						if(info!=null) 
							info.setContentid(parser.nextText());
						break;
					case "contenttypeid":
						if(info!=null) 
							info.setContenttypeid(parser.nextText());
						break;
					case "createdtime":
						if(info!=null) 
							info.setCreatedtime(parser.nextText());
						break;
					case "firstimage":
						if(info!=null) 
							info.setFirstimage(parser.nextText());
						break;
					case "firstimage2":
						if(info!=null) 
							info.setFirstimage2(parser.nextText());
						break;
					case "mapx":
						if(info!=null) 
							info.setMapx(parser.nextText());
						break;
					case "mapy":
						if(info!=null) 
							info.setMapy(parser.nextText());
						break;
					case "mlevel":
						if(info!=null) 
							info.setMlevel(parser.nextText());
						break;
					case "modifiedtime":
						if(info!=null) 
							info.setModifiedtime(parser.nextText());
						break;
					case "readcount":
						if(info!=null) 
							info.setReadcount(parser.nextText());
						break;
					case "sigungucode":
						if(info!=null) 
							info.setSigungucode(parser.nextText());
						break;
					case "title":
						if(info!=null) 
							info.setTitle(parser.nextText());
						break;
					case "overview":
						if(info!=null) 
							info.setOverview(parser.nextText());
						break;
					case "zipcode":
						if(info!=null) 
							info.setZipcode(parser.nextText());
						break;
					case "eventenddate":
						if(info!=null) 
							info.setEventenddate(parser.nextText());
						break;
					case "eventstartdate":
						if(info!=null) 
							info.setEventstartdate(parser.nextText());
						break;
					case "tel":
						if(info!=null) 
							info.setTel(parser.nextText());
						break;
					case "numOfRows":
						if(info!=null) 
							resultInfo.put("numOfRows", parser.nextText());
						break;
					case "pageNo":
						if(info!=null) 
							resultInfo.put("pageNo", parser.nextText());
						break;
					case "totalCount":
						if(info!=null) 
							resultInfo.put("totalCount", parser.nextText());
						break;
					}			
				}
				}	
				eventType = parser.next();
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		int page = Integer.parseInt((String)resultInfo.get("pageNo"));
		int cnt = Integer.parseInt((String)resultInfo.get("totalCount"));

		resultInfo.put("startpage", getStartpage(page));
		resultInfo.put("endpage", getEndpage(page, cnt));
		resultInfo.put("lastpage", getLastpage(cnt));

		resultInfo.put("ilist", ilist);

		return resultInfo;
	}

	public AttractionIntro attractionIntroParser(URL url) {
		XmlPullParser parser = requestAPI(url);
		AttractionIntro attIntro = new AttractionIntro();
		try {
			int eventType = parser.getEventType();
			while(eventType != XmlPullParser.END_DOCUMENT) { //문서가 끝날때 까지 반복

				switch (eventType) {
				case XmlPullParser.END_DOCUMENT:
					break;
				case XmlPullParser.START_DOCUMENT:
					break;

				case XmlPullParser.END_TAG:{
					String tag = parser.getName();
				}
				case XmlPullParser.START_TAG:{
					String tag = parser.getName();

					switch (tag) {
					case "accomcount":
						if(attIntro!=null) 
							attIntro.setAccomcount(parser.nextText());
						break;
					case "chkbabycarring":
						if(attIntro!=null) 
							attIntro.setChkbabycarring(parser.nextText());
						break;
					case "chkcreditcard":
						if(attIntro!=null) 
							attIntro.setChkcreditcard(parser.nextText());
						break;
					case "chkpet":
						if(attIntro!=null) 
							attIntro.setChkpet(parser.nextText());
						break;
					case "expagerange":
						if(attIntro!=null) 
							attIntro.setExpagerange(parser.nextText());
						break;
					case "expguide":
						if(attIntro!=null) 
							attIntro.setExpguide(parser.nextText());
						break;
					case "heritage1":
						if(attIntro!=null) 
							attIntro.setHeritage1(parser.nextText());
						break;
					case "heritage2":
						if(attIntro!=null) 
							attIntro.setHeritage2(parser.nextText());
						break;
					case "heritage3":
						if(attIntro!=null) 
							attIntro.setHeritage3(parser.nextText());
						break;
					case "infocenter":
						if(attIntro!=null) 
							attIntro.setInfocenter(parser.nextText());
						break;
					case "opendate":
						if(attIntro!=null) 
							attIntro.setOpendate(parser.nextText());
						break;
					case "parking":
						if(attIntro!=null) 
							attIntro.setParking(parser.nextText());
						break;
					case "restdate":
						if(attIntro!=null) 
							attIntro.setRestdate(parser.nextText());
						break;
					case "useseason":
						if(attIntro!=null) 
							attIntro.setUseseason(parser.nextText());
						break;
					case "usetime":
						if(attIntro!=null) 
							attIntro.setUsetime(parser.nextText());
						break;
					}			
				}
				}	
				eventType = parser.next();
			}

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return attIntro;
	}

	public CultureIntro cultureIntroParser(URL url) {
		XmlPullParser parser = requestAPI(url);
		CultureIntro culIntro = new CultureIntro();
		try {
			int eventType = parser.getEventType();

			while(eventType != XmlPullParser.END_DOCUMENT) { //문서가 끝날때 까지 반복

				switch (eventType) {
				case XmlPullParser.END_DOCUMENT:
					break;
				case XmlPullParser.START_DOCUMENT:
					break;

				case XmlPullParser.END_TAG:{
					String tag = parser.getName();
				}
				case XmlPullParser.START_TAG:{
					String tag = parser.getName();

					switch (tag) {
					case "accomcountculture":
						if(culIntro!=null) 
							culIntro.setAccomcountculture(parser.nextText());
						break;
					case "chkbabycarringculture":
						if(culIntro!=null) 
							culIntro.setChkbabycarringculture(parser.nextText());
						break;
					case "chkcreditcardculture":
						if(culIntro!=null) 
							culIntro.setChkcreditcardculture(parser.nextText());
						break;
					case "chkpetculture":
						if(culIntro!=null) 
							culIntro.setChkpetculture(parser.nextText());
						break;
					case "discountinfo":
						if(culIntro!=null) 
							culIntro.setDiscountinfo(parser.nextText());
						break;
					case "infocenterculture":
						if(culIntro!=null) 
							culIntro.setInfocenterculture(parser.nextText());
						break;
					case "parkingculture":
						if(culIntro!=null) 
							culIntro.setParkingculture(parser.nextText());
						break;
					case "parkingfee":
						if(culIntro!=null) 
							culIntro.setParkingfee(parser.nextText());
						break;
					case "restdateculture":
						if(culIntro!=null) 
							culIntro.setRestdateculture(parser.nextText());
						break;
					case "usefee":
						if(culIntro!=null) 
							culIntro.setUsefee(parser.nextText());
						break;
					case "usetimeculture":
						if(culIntro!=null) 
							culIntro.setUsetimeculture(parser.nextText());
						break;
					case "scale":
						if(culIntro!=null) 
							culIntro.setScale(parser.nextText());
						break;
					case "spendtime":
						if(culIntro!=null) 
							culIntro.setSpendtime(parser.nextText());
						break;
					}			
				}
				}	
				eventType = parser.next();
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return culIntro;
	}

	public FestivalIntro festivalIntroParser(URL url) {
		XmlPullParser parser = requestAPI(url);
		FestivalIntro fesIntro = new FestivalIntro();;

		try {
			int eventType = parser.getEventType();

			while(eventType != XmlPullParser.END_DOCUMENT) { //문서가 끝날때 까지 반복

				switch (eventType) {
				case XmlPullParser.END_DOCUMENT:
					break;
				case XmlPullParser.START_DOCUMENT:
					break;

				case XmlPullParser.END_TAG:{
					String tag = parser.getName();
				}
				case XmlPullParser.START_TAG:{
					String tag = parser.getName();

					switch (tag) {
					case "agelimit":
						if(fesIntro!=null) 
							fesIntro.setAgelimit(parser.nextText());
						break;
					case "bookingplace":
						if(fesIntro!=null) 
							fesIntro.setBookingplace(parser.nextText());
						break;
					case "discountinfofestival":
						if(fesIntro!=null) 
							fesIntro.setDiscountinfofestival(parser.nextText());
						break;
					case "eventenddate":
						if(fesIntro!=null) 
							fesIntro.setEventenddate(parser.nextText());
						break;
					case "eventplace":
						if(fesIntro!=null) 
							fesIntro.setEventplace(parser.nextText());
						break;
					case "eventstartdate":
						if(fesIntro!=null) 
							fesIntro.setEventstartdate(parser.nextText());
						break;
					case "placeinfo":
						if(fesIntro!=null) 
							fesIntro.setPlaceinfo(parser.nextText());
						break;
					case "playtime":
						if(fesIntro!=null) 
							fesIntro.setPlaytime(parser.nextText());
						break;
					case "program":
						if(fesIntro!=null) 
							fesIntro.setProgram(parser.nextText());
						break;
					case "spendtimefestival":
						if(fesIntro!=null) 
							fesIntro.setSpendtimefestival(parser.nextText());
						break;
					case "sponsor1":
						if(fesIntro!=null) 
							fesIntro.setSponsor1(parser.nextText());
						break;
					case "sponsor1tel":
						if(fesIntro!=null) 
							fesIntro.setSponsor1tel(parser.nextText());
						break;
					case "sponsor2":
						if(fesIntro!=null) 
							fesIntro.setSponsor2(parser.nextText());
						break;
					case "sponsor2tel":
						if(fesIntro!=null) 
							fesIntro.setSponsor2tel(parser.nextText());
						break;
					case "subevent":
						if(fesIntro!=null) 
							fesIntro.setSubevent(parser.nextText());
						break;
					case "usetimefestival":
						if(fesIntro!=null) 
							fesIntro.setUsetimefestival(parser.nextText());
						break;
					}			
				}
				}	
				eventType = parser.next();
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return fesIntro;
	}

	public CourseIntro courseIntroParser(URL url) {
		XmlPullParser parser = requestAPI(url);
		CourseIntro couIntro = new CourseIntro();
		try {
			int eventType = parser.getEventType();

			while(eventType != XmlPullParser.END_DOCUMENT) { //문서가 끝날때 까지 반복

				switch (eventType) {
				case XmlPullParser.END_DOCUMENT:
					break;
				case XmlPullParser.START_DOCUMENT:
					break;

				case XmlPullParser.END_TAG:{
					String tag = parser.getName();
				}
				case XmlPullParser.START_TAG:{
					String tag = parser.getName();

					switch (tag) {
					case "distance":
						if(couIntro!=null) 
							couIntro.setDistance(parser.nextText());
						break;
					case "taketime":
						if(couIntro!=null) 
							couIntro.setTaketime(parser.nextText());
						break;
					}			
				}
				}	
				eventType = parser.next();
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return couIntro;
	}

	public LeportsIntro leportsIntroParser(URL url) {
		XmlPullParser parser = requestAPI(url);
		LeportsIntro lIntro = new LeportsIntro();
		try {
			int eventType = parser.getEventType();

			while(eventType != XmlPullParser.END_DOCUMENT) { //문서가 끝날때 까지 반복

				switch (eventType) {
				case XmlPullParser.END_DOCUMENT:
					break;
				case XmlPullParser.START_DOCUMENT:
					break;

				case XmlPullParser.END_TAG:{
					String tag = parser.getName();
				}
				case XmlPullParser.START_TAG:{
					String tag = parser.getName();

					switch (tag) {
					case "accomcountleports":
						if(lIntro!=null) 
							lIntro.setAccomcountleports(parser.nextText());
						break;
					case "chkbabycarringleports":
						if(lIntro!=null) 
							lIntro.setChkbabycarringleports(parser.nextText());
						break;
					case "chkcreditcardleports":
						if(lIntro!=null) 
							lIntro.setChkcreditcardleports(parser.nextText());
						break;
					case "chkpetleports":
						if(lIntro!=null) 
							lIntro.setChkpetleports(parser.nextText());
						break;
					case "expagerangeleports":
						if(lIntro!=null) 
							lIntro.setExpagerangeleports(parser.nextText());
						break;
					case "infocenterleports":
						if(lIntro!=null) 
							lIntro.setInfocenterleports(parser.nextText());
						break;
					case "openperiod":
						if(lIntro!=null) 
							lIntro.setOpenperiod(parser.nextText());
						break;
					case "parkingfeeleports":
						if(lIntro!=null) 
							lIntro.setParkingfeeleports(parser.nextText());
						break;
					case "parkingleports":
						if(lIntro!=null) 
							lIntro.setParkingleports(parser.nextText());
						break;
					case "reservation":
						if(lIntro!=null) 
							lIntro.setReservation(parser.nextText());
						break;
					case "restdateleports":
						if(lIntro!=null) 
							lIntro.setRestdateleports(parser.nextText());
						break;
					case "scaleleports":
						if(lIntro!=null) 
							lIntro.setScaleleports(parser.nextText());
						break;
					case "usefeeleports":
						if(lIntro!=null) 
							lIntro.setUsefeeleports(parser.nextText());
						break;
					case "usetimeleports":
						if(lIntro!=null) 
							lIntro.setUsetimeleports(parser.nextText());
						break;
					}			
				}
				}	
				eventType = parser.next();
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return lIntro;
	}

	public LodgingIntro lodgingIntroParser(URL url) {
		XmlPullParser parser = requestAPI(url);
		LodgingIntro lodIntro = new LodgingIntro();
		try {
			int eventType = parser.getEventType();

			while(eventType != XmlPullParser.END_DOCUMENT) { //문서가 끝날때 까지 반복

				switch (eventType) {
				case XmlPullParser.END_DOCUMENT:
					break;
				case XmlPullParser.START_DOCUMENT:
					break;

				case XmlPullParser.END_TAG:{
					String tag = parser.getName();
				}
				case XmlPullParser.START_TAG:{
					String tag = parser.getName();

					switch (tag) {
					case "accomcountlodging":
						if(lodIntro!=null) 
							lodIntro.setAccomcountlodging(parser.nextText());
						break;
					case "benikia":
						if(lodIntro!=null) 
							lodIntro.setBenikia(parser.nextText());
						break;
					case "checkintime":
						if(lodIntro!=null) 
							lodIntro.setCheckintime(parser.nextText());
						break;
					case "checkouttime":
						if(lodIntro!=null) 
							lodIntro.setCheckouttime(parser.nextText());
						break;
					case "chkcooking":
						if(lodIntro!=null) 
							lodIntro.setChkcooking(parser.nextText());
						break;
					case "foodplace":
						if(lodIntro!=null) 
							lodIntro.setFoodplace(parser.nextText());
						break;
					case "goodstay":
						if(lodIntro!=null) 
							lodIntro.setGoodstay(parser.nextText());
						break;
					case "hanok":
						if(lodIntro!=null) 
							lodIntro.setHanok(parser.nextText());
						break;
					case "infocenterlodging":
						if(lodIntro!=null) 
							lodIntro.setInfocenterlodging(parser.nextText());
						break;
					case "parkinglodging":
						if(lodIntro!=null) 
							lodIntro.setParkinglodging(parser.nextText());
						break;
					case "pickup":
						if(lodIntro!=null) 
							lodIntro.setPickup(parser.nextText());
						break;
					case "roomcount":
						if(lodIntro!=null) 
							lodIntro.setRoomcount(parser.nextText());
						break;
					case "reservationlodging":
						if(lodIntro!=null) 
							lodIntro.setReservationlodging(parser.nextText());
						break;
					case "reservationurl":
						if(lodIntro!=null) 
							lodIntro.setReservationurl(parser.nextText());
						break;
					case "roomtype":
						if(lodIntro!=null) 
							lodIntro.setRoomtype(parser.nextText());
						break;
					case "scalelodging":
						if(lodIntro!=null) 
							lodIntro.setScalelodging(parser.nextText());
						break;
					case "subfacility":
						if(lodIntro!=null) 
							lodIntro.setSubfacility(parser.nextText());
						break;
					}			
				}
				}	
				eventType = parser.next();
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return lodIntro;
	}

	public ShoppingIntro shoppingIntroParser(URL url) {
		XmlPullParser parser = requestAPI(url);
		ShoppingIntro sIntro = new ShoppingIntro();
		try {
			int eventType = parser.getEventType();

			while(eventType != XmlPullParser.END_DOCUMENT) { //문서가 끝날때 까지 반복

				switch (eventType) {
				case XmlPullParser.END_DOCUMENT:
					break;
				case XmlPullParser.START_DOCUMENT:
					break;

				case XmlPullParser.END_TAG:{
					String tag = parser.getName();
				}
				case XmlPullParser.START_TAG:{
					String tag = parser.getName();

					switch (tag) {
					case "chkbabycarringshopping":
						if(sIntro!=null) 
							sIntro.setChkbabycarringshopping(parser.nextText());
						break;
					case "chkcreditcardshopping":
						if(sIntro!=null) 
							sIntro.setChkcreditcardshopping(parser.nextText());
						break;
					case "chkpetshopping":
						if(sIntro!=null) 
							sIntro.setChkpetshopping(parser.nextText());
						break;
					case "culturecenter":
						if(sIntro!=null) 
							sIntro.setCulturecenter(parser.nextText());
						break;
					case "fairday":
						if(sIntro!=null) 
							sIntro.setFairday(parser.nextText());
						break;
					case "infocentershopping":
						if(sIntro!=null) 
							sIntro.setInfocentershopping(parser.nextText());
						break;
					case "opentime":
						if(sIntro!=null) 
							sIntro.setOpentime(parser.nextText());
						break;
					case "parkingshopping":
						if(sIntro!=null) 
							sIntro.setParkingshopping(parser.nextText());
						break;
					case "restdateshopping":
						if(sIntro!=null) 
							sIntro.setRestdateshopping(parser.nextText());
						break;
					case "restroom":
						if(sIntro!=null) 
							sIntro.setRestroom(parser.nextText());
						break;
					case "saleitem":
						if(sIntro!=null) 
							sIntro.setSaleitem(parser.nextText());
						break;
					case "scaleshopping":
						if(sIntro!=null) 
							sIntro.setScaleshopping(parser.nextText());
						break;
					case "shopguide":
						if(sIntro!=null) 
							sIntro.setShopguide(parser.nextText());
						break;
					}			
				}
				}	
				eventType = parser.next();
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return sIntro;
	}

	public FoodIntro foodIntroParser(URL url) {
		XmlPullParser parser = requestAPI(url);
		FoodIntro foodIntro = new FoodIntro();
		try {
			int eventType = parser.getEventType();

			while(eventType != XmlPullParser.END_DOCUMENT) { //문서가 끝날때 까지 반복

				switch (eventType) {
				case XmlPullParser.END_DOCUMENT:
					break;
				case XmlPullParser.START_DOCUMENT:
					break;

				case XmlPullParser.END_TAG:{
					String tag = parser.getName();
				}
				case XmlPullParser.START_TAG:{
					String tag = parser.getName();

					switch (tag) {
					case "chkcreditcardfood":
						if(foodIntro!=null) 
							foodIntro.setChkcreditcardfood(parser.nextText());
						break;
					case "discountinfofood":
						if(foodIntro!=null) 
							foodIntro.setDiscountinfofood(parser.nextText());
						break;
					case "firstmenu":
						if(foodIntro!=null) 
							foodIntro.setFirstmenu(parser.nextText());
						break;
					case "infocenterfood":
						if(foodIntro!=null) 
							foodIntro.setInfocenterfood(parser.nextText());
						break;
					case "kidsfacility":
						if(foodIntro!=null) 
							foodIntro.setKidsfacility(parser.nextText());
						break;
					case "opentimefood":
						if(foodIntro!=null) 
							foodIntro.setOpentimefood(parser.nextText());
						break;
					case "packing":
						if(foodIntro!=null) 
							foodIntro.setPacking(parser.nextText());
						break;
					case "parkingfood":
						if(foodIntro!=null) 
							foodIntro.setParkingfood(parser.nextText());
						break;
					case "reservationfood":
						if(foodIntro!=null) 
							foodIntro.setReservationfood(parser.nextText());
						break;
					case "restdatefood":
						if(foodIntro!=null) 
							foodIntro.setRestdatefood(parser.nextText());
						break;
					case "scalefood":
						if(foodIntro!=null) 
							foodIntro.setScalefood(parser.nextText());
						break;
					case "seat":
						if(foodIntro!=null) 
							foodIntro.setSeat(parser.nextText());
						break;
					}			
				}
				}	
				eventType = parser.next();
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return foodIntro;
	}












	public int getStartpage(int page) {
		return page - ((page-1) % 10);
	}
	public int getEndpage(int page, int cnt) {
		int startpage = getStartpage(page);
		int lastpage = getLastpage(cnt);
		if(lastpage - startpage >= 9)
			return getStartpage(page) + 9;
		else
			return lastpage;
	}
	public int getLastpage(int cnt) {
		// perpage : 한 페이지의 게시물 수
		int perpage = 8;
		if((cnt % perpage) == 0) return (cnt/perpage);
		else return (cnt/perpage) + 1;
	}

















}
