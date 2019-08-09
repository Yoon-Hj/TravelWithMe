<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>${title }</h1>
<table>
	<tr>
		<td style="width:300px;height:300px"><img src="${ilist[0].firstimage }" style="width:450px;height:300px"/><hr></td>
		<td style="padding:50px">
		<c:if test="${ilist[0].tel != null && ilist[0].tel != ''}">○ 전화번호 : ${ilist[0].tel }<BR><br></c:if>
		<c:if test="${ilist[0].zipcode != null && ilist[0].zipcode != ''}">○ 우편번호 : ${ilist[0].zipcode }<BR><br></c:if>
		<c:if test="${ilist[0].addr1 != null && ilist[0].addr1 != ''}">○ 주소 : ${ilist[0].addr1 }<BR><BR></c:if>
		</td>
	</tr>
</table>
<hr>
<h3>개요</h3>
${ilist[0].overview }
<hr>
<c:choose>
	<c:when test="${contenttypeid == '12'}">
		<h3>관광지</h3>
		<table>
			<tr>
				<td style="text-align:center">주요 정보</td>
				<td style="text-align:center">기타 정보</td>
			</tr>
			<tr style="padding:30px">
				<td style="padding:30px">
					<c:if test="${detailIntro.heritage1 == '1' }">º 세계 문화유산<BR><BR></c:if>
					<c:if test="${detailIntro.heritage2 == '1' }">º 세계 자연유산<BR><BR></c:if>
					<c:if test="${detailIntro.heritage3 == '1' }">º 세계 기록유산<BR><BR></c:if>
					<c:if test="${detailIntro.restdate != null && detailIntro.restdate != ''}">º 휴일 : ${detailIntro.restdate }<BR><BR></c:if>
					<c:if test="${detailIntro.expagerange != null && detailIntro.expagerange != ''}">º 체험가능 연령 : ${detailIntro.expagerange }<BR><BR></c:if>
					<c:if test="${detailIntro.accomcount != null && detailIntro.accomcount != ''}">º 수용인원 : ${detailIntro.accomcount }<BR><BR></c:if>
					<c:if test="${detailIntro.infocenter != null && detailIntro.infocenter != ''}">º 문의 및 안내 : ${detailIntro.infocenter }<BR><BR></c:if>
					<c:if test="${detailIntro.parking != null && detailIntro.parking != ''}">º 주차시설 : ${detailIntro.parking }<BR><BR></c:if>
					<c:if test="${detailIntro.chkbabycarring != null && detailIntro.chkbabycarring != ''}">º 유모차 대여 여부 : ${detailIntro.chkbabycarring }<BR><BR></c:if>
					<c:if test="${detailIntro.chkpet != null && detailIntro.chkpet != ''}">º 애완동물 동반 여부 : ${detailIntro.chkpet }<BR><BR></c:if>
					<c:if test="${detailIntro.chkcreditcard != null && detailIntro.chkcreditcard != ''}">º 신용카드 사용 여부 : ${detailIntro.chkcreditcard }<BR><BR></c:if>
					<c:if test="${detailIntro.usetime != null && detailIntro.usetime != ''}">º 이용시간 : ${detailIntro.usetime }<BR><BR></c:if>
				</td>
				<td style="padding:30px">
					<c:forEach var="d" items="${detailInfo }">
						º ${d.infoname }<BR>
						&nbsp&nbsp&nbsp - ${d.infotext }<BR><BR>
					</c:forEach>
				</td>
			</tr>
		</table>
	</c:when>
	<c:when test="${contenttypeid == '14'}">
	<h3>문화</h3>
		<table>
			<tr>
				<td style="text-align:center">주요 정보</td>
				<td style="text-align:center">기타 정보</td>
			</tr>
			<tr style="padding:30px">
				<td style="padding:30px">
					<c:if test="${detailIntro.restdateculture != null && detailIntro.restdateculture != ''}">º 휴일 : ${detailIntro.restdateculture }<BR><BR></c:if>
					<c:if test="${detailIntro.accomcountculture != null && detailIntro.accomcountculture != ''}">º 수용인원 : ${detailIntro.accomcountculture }<BR><BR></c:if>
					<c:if test="${detailIntro.infocenterculture != null && detailIntro.infocenterculture != ''}">º 문의 및 안내 : ${detailIntro.infocenterculture }<BR><BR></c:if>
					<c:if test="${detailIntro.parkingculture != null && detailIntro.parkingculture != ''}">º 주차시설 : ${detailIntro.parkingculture}<BR><BR></c:if>
					<c:if test="${detailIntro.parkingfee != null && detailIntro.parkingfee != ''}">º 주차요금 : ${detailIntro.parkingfee }<BR><BR></c:if>
					<c:if test="${detailIntro.chkbabycarringculture != null && detailIntro.chkbabycarringculture != ''}">º 유모차 대여 여부 : ${detailIntro.chkbabycarringculture}<BR><BR></c:if>
					<c:if test="${detailIntro.chkpetculture != null && detailIntro.chkpetculture != ''}">º 애완동물 동반 여부 :  ${detailIntro.chkpetculture}<BR><BR></c:if>
					<c:if test="${detailIntro.chkcreditcardculture != null && detailIntro.chkcreditcardculture != ''}">º 신용카드 사용 여부 : ${detailIntro.chkcreditcardculture}<BR><BR></c:if>
					<c:if test="${detailIntro.discountinfo != null && detailIntro.discountinfo != ''}">º 할인정보 : ${detailIntro.discountinfo }<BR><BR></c:if>
					<c:if test="${detailIntro.spendtime != null && detailIntro.spendtime != ''}">º 관람 소요시간 : ${detailIntro.spendtime }<BR><BR></c:if>
					<c:if test="${detailIntro.usefee != null && detailIntro.usefee != ''}">º 이용요금 : ${detailIntro.usefee }<BR><BR></c:if>
					<c:if test="${detailIntro.usetimeculture != null && detailIntro.usetimeculture != ''}">º 이용시간 : ${detailIntro.usetimeculture }<BR><BR></c:if>
					<c:if test="${detailIntro.scale != null && detailIntro.scale != ''}">º 규모 : ${detailIntro.scale }<BR><BR></c:if>
				</td>
				<td style="padding:30px">
					<c:forEach var="d" items="${detailInfo }">
						º ${d.infoname }<BR>
						&nbsp&nbsp&nbsp - ${d.infotext }<BR><BR>
					</c:forEach>
				</td>
			</tr>
		</table>
	</c:when>
	<c:when test="${contenttypeid == '15'}">
	<h3>행사/축제/공연</h3>
		<table>
			<tr>
				<td style="text-align:center">주요 정보</td>
				<td style="text-align:center">기타 정보</td>
			</tr>
			<tr style="padding:30px">
				<td style="padding:30px">
					<c:if test="${detailIntro.agelimit != null && detailIntro.agelimit != ''}">º 관람 가능연령 : ${detailIntro.agelimit }<BR><BR></c:if>
					<c:if test="${detailIntro.bookingplace != null && detailIntro.bookingplace != ''}">º 예매처 : ${detailIntro.bookingplace }<BR><BR></c:if>
					<c:if test="${detailIntro.usetimefestival != null && detailIntro.usetimefestival != ''}">º 이용 요금 : ${detailIntro.usetimefestival }<BR><BR></c:if>
					<c:if test="${detailIntro.discountinfofestival != null && detailIntro.discountinfofestival != ''}">º 할인정보 : ${detailIntro.discountinfofestival }<BR><BR></c:if>
					<c:if test="${detailIntro.eventstartdate != null && detailIntro.eventstartdate != ''}">º 시작일 : ${detailIntro.eventstartdate }<BR><BR></c:if>
					<c:if test="${detailIntro.eventenddate != null && detailIntro.eventenddate != ''}">º 종료일 : ${detailIntro.eventenddate }<BR><BR></c:if>
					<c:if test="${detailIntro.eventplace != null && detailIntro.eventplace != ''}">º 장소 : ${detailIntro.eventplace }<BR><BR></c:if>
					<c:if test="${detailIntro.eventhompage != null && detailIntro.eventhompage != ''}">º 홈페이지 : ${detailIntro.eventhompage }<BR><BR></c:if>
					<c:if test="${detailIntro.placeinfo != null && detailIntro.placeinfo != ''}">º 위치 안내 : ${detailIntro.placeinfo }<BR><BR></c:if>
					<c:if test="${detailIntro.playtime != null && detailIntro.playtime != ''}">º 공연 시간 : ${detailIntro.playtime }<BR><BR></c:if>
					<c:if test="${detailIntro.program != null && detailIntro.program != ''}">º 프로그램 : ${detailIntro.program }<BR><BR></c:if>
					<c:if test="${detailIntro.spendtimefestival != null && detailIntro.spendtimefestival != ''}">º 관람 소요시간 : ${detailIntro.spendtimefestival }<BR><BR></c:if>
					<c:if test="${detailIntro.sponsor1 != null && detailIntro.sponsor1 != ''}">º 주최자 정보 : ${detailIntro.sponsor1 }<BR><BR></c:if>
					<c:if test="${detailIntro.sponsor1tel != null && detailIntro.sponsor1tel != ''}">º 주최자 연락처 : ${detailIntro.sponsor1tel }<BR><BR></c:if>
					<c:if test="${detailIntro.sponsor2 != null && detailIntro.sponsor2 != ''}">º 주관사 정보 : ${detailIntro.sponsor2 }<BR><BR></c:if>
					<c:if test="${detailIntro.sponsor2tel != null && detailIntro.sponsor2tel != ''}">º 주관사 연락처 : ${detailIntro.sponsor2tel }<BR><BR></c:if>
					<c:if test="${detailIntro.subevent != null && detailIntro.subevent != ''}">º 부대행사 : ${detailIntro.subevent }<BR><BR></c:if>
				</td>
				<td style="padding:30px">
					<c:forEach var="d" items="${detailInfo }">
						º ${d.infoname }<BR>
						&nbsp&nbsp&nbsp - ${d.infotext }<BR><BR>
					</c:forEach>
				</td>
			</tr>
		</table>
	</c:when>
	<c:when test="${contenttypeid == '28'}">
	<h3>레포츠</h3>
		<table>
			<tr>
				<td style="text-align:center">주요 정보</td>
				<td style="text-align:center">기타 정보</td>
			</tr>
			<tr style="padding:30px">
				<td style="padding:30px">
					<c:if test="${detailIntro.restdateleports != null && detailIntro.restdateleports != ''}">º 휴일 : ${detailIntro.restdateleports }<BR><BR></c:if>
					<c:if test="${detailIntro.accomcountleports != null && detailIntro.accomcountleports != ''}">º 수용인원 : ${detailIntro.accomcountleports }<BR><BR></c:if>
					<c:if test="${detailIntro.expagerangeleports != null && detailIntro.expagerangeleports != ''}">º 체험가능 연령 : ${detailIntro.expagerangeleports }<BR><BR></c:if>
					<c:if test="${detailIntro.usefeeleports != null && detailIntro.usefeeleports != ''}">º 입장료 : ${detailIntro.usefeeleports }<BR><BR></c:if>
					<c:if test="${detailIntro.usetimeleports != null && detailIntro.usetimeleports != ''}">º 이용시간 : ${detailIntro.usetimeleports }<BR><BR></c:if>
					<c:if test="${detailIntro.openperiod != null && detailIntro.openperiod != ''}">º 개장기간 : ${detailIntro.openperiod }<BR><BR></c:if>
					<c:if test="${detailIntro.reservation != null && detailIntro.reservation != ''}">º 예약안내 : ${detailIntro.reservation }<BR><BR></c:if>
					<c:if test="${detailIntro.scaleleports != null && detailIntro.scaleleports != ''}">º 규모 : ${detailIntro.scaleleports }<BR><BR></c:if>
					<c:if test="${detailIntro.parkingleports != null && detailIntro.parkingleports != ''}">º 주차시설 : ${detailIntro.parkingleports}<BR><BR></c:if>
					<c:if test="${detailIntro.parkingfeeleports != null && detailIntro.parkingfeeleports != ''}">º 주차요금 : ${detailIntro.parkingfeeleports }<BR><BR></c:if>
					<c:if test="${detailIntro.chkbabycarringleports != null && detailIntro.chkbabycarringleports != ''}">º 유모차 대여 여부 : ${detailIntro.chkbabycarringleports}<BR><BR></c:if>
					<c:if test="${detailIntro.chkpetleports != null && detailIntro.chkpetleports != ''}">º 애완동물 동반 여부 :  ${detailIntro.chkpetleports}<BR><BR></c:if>
					<c:if test="${detailIntro.chkcreditcardleports != null && detailIntro.chkcreditcardleports != ''}">º 신용카드 사용 여부 : ${detailIntro.chkcreditcardleports}<BR><BR></c:if>
					<c:if test="${detailIntro.infocenterleports != null && detailIntro.infocenterleports != ''}">º 문의 및 안내 : ${detailIntro.infocenterleports }<BR><BR></c:if>
				</td>
				<td style="padding:30px">
					<c:forEach var="d" items="${detailInfo }">
						º ${d.infoname }<BR>
						&nbsp&nbsp&nbsp - ${d.infotext }<BR><BR>
					</c:forEach>
				</td>
			</tr>
		</table>
	</c:when>
	<c:when test="${contenttypeid == '32'}">
	<h3>숙박</h3>
		<table>
			<tr>
				<td style="text-align:center">주요 정보</td>
			</tr>
			<tr style="padding:30px">
				<td style="padding:30px">
					<c:if test="${detailIntro.goodstay == '1'}">º 굿스테이<BR><BR></c:if>
					<c:if test="${detailIntro.accomcountlodging != null && detailIntro.accomcountlodging != ''}">º 수용인원 : ${detailIntro.accomcountlodging }<BR><BR></c:if>
					<c:if test="${detailIntro.scalelodging != null && detailIntro.scalelodging != ''}">º 규모 : ${detailIntro.scalelodging }<BR><BR></c:if>
					<c:if test="${detailIntro.roomtype != null && detailIntro.roomtype != ''}">º 객실유형 : ${detailIntro.roomtype }<BR><BR></c:if>
					<c:if test="${detailIntro.roomcount != null && detailIntro.roomcount != ''}">º 객실 수 : ${detailIntro.roomcount }<BR><BR></c:if>
					<c:if test="${detailIntro.checkintime != null && detailIntro.checkintime != ''}">º 입실 시간 : ${detailIntro.checkintime }<BR><BR></c:if>
					<c:if test="${detailIntro.checkouttime != null && detailIntro.checkouttime != ''}">º 퇴실 시간 : ${detailIntro.checkouttime }<BR><BR></c:if>
					<c:if test="${detailIntro.parkinglodging != null && detailIntro.parkinglodging != ''}">º 주차시설 : ${detailIntro.parkinglodging }<BR><BR></c:if>
					<c:if test="${detailIntro.pickup != null && detailIntro.pickup != ''}">º 픽업 서비스 : ${detailIntro.pickup }<BR><BR></c:if>
					<c:if test="${detailIntro.chkcooking != null && detailIntro.chkcooking != ''}">º 객실 내 취사여부 : ${detailIntro.chkcooking }<BR><BR></c:if>
					<c:if test="${detailIntro.foodplace != null && detailIntro.foodplace != ''}">º 식음료장 : ${detailIntro.foodplace }<BR><BR></c:if>
					<c:if test="${detailIntro.subfacility != null && detailIntro.subfacility != ''}">º 부대시설 : ${detailIntro.subfacility }<BR><BR></c:if>
					<c:if test="${detailIntro.reservationlodging != null && detailIntro.reservationlodging != ''}">º 예약안내 : ${detailIntro.reservationlodging }<BR><BR></c:if>
					<c:if test="${detailIntro.reservationurl != null && detailIntro.reservationurl != ''}">º 예약 홈페이지 : ${detailIntro.reservationurl }<BR><BR></c:if>
					<c:if test="${detailIntro.infocenterlodging != null && detailIntro.infocenterlodging != ''}">º 문의 및 안내 : ${detailIntro.infocenterlodging }<BR><BR></c:if>
					
				</td>
			</tr>
		</table>
	</c:when>
	<c:when test="${contenttypeid == '38'}">
	<h3>쇼핑</h3>
		<table>
			<tr>
				<td style="text-align:center">주요 정보</td>
				<td style="text-align:center">기타 정보</td>
			</tr>
			<tr style="padding:30px">
				<td style="padding:30px">
					<c:if test="${detailIntro.shopguide != null && detailIntro.shopguide != ''}">º 매장안내 : ${detailIntro.shopguide}<BR><BR></c:if>
					<c:if test="${detailIntro.opentime != null && detailIntro.opentime != ''}">º 영업시간 : ${detailIntro.opentime}<BR><BR></c:if>
					<c:if test="${detailIntro.saleitem != null && detailIntro.saleitem != ''}">º 판매 품목 : ${detailIntro.saleitem}<BR><BR></c:if>
					<c:if test="${detailIntro.restdateshopping != null && detailIntro.restdateshopping != ''}">º 휴일 : ${detailIntro.restdateshopping}<BR><BR></c:if>
					<c:if test="${detailIntro.scaleshopping != null && detailIntro.scaleshopping != ''}">º 규모 : ${detailIntro.scaleshopping}<BR><BR></c:if>
					<c:if test="${detailIntro.parkingshopping != null && detailIntro.parkingshopping != ''}">º 주차시설 : ${detailIntro.parkingshopping}<BR><BR></c:if>
					<c:if test="${detailIntro.chkbabycarringshopping != null && detailIntro.chkbabycarringshopping != ''}">º 유모차 대여 여부 : ${detailIntro.chkbabycarringshopping}<BR><BR></c:if>
					<c:if test="${detailIntro.chkpetshopping != null && detailIntro.chkpetshopping != ''}">º 애완동물 동반 여부 :  ${detailIntro.chkpetshopping}<BR><BR></c:if>
					<c:if test="${detailIntro.chkcreditcardshopping != null && detailIntro.chkcreditcardshopping != ''}">º 신용카드 사용 여부 : ${detailIntro.chkcreditcardshopping}<BR><BR></c:if>
					<c:if test="${detailIntro.fairday != null && detailIntro.fairday != ''}">º 장서는 날 : ${detailIntro.fairday}<BR><BR></c:if>
					<c:if test="${detailIntro.restroom != null && detailIntro.restroom != ''}">º ${detailIntro.restroom}<BR><BR></c:if>
					<c:if test="${detailIntro.culturecenter != null && detailIntro.culturecenter != ''}">º 문화센터 바로가기 : ${detailIntro.culturecenter}<BR><BR></c:if>
					<c:if test="${detailIntro.infocentershopping != null && detailIntro.infocentershopping != ''}">º 문의 및 안내 : ${detailIntro.infocentershopping}<BR><BR></c:if>
				</td>
				<td style="padding:30px">
					<c:forEach var="d" items="${detailInfo }">
						º ${d.infoname }<BR>
						&nbsp&nbsp&nbsp - ${d.infotext }<BR><BR>
					</c:forEach>
				</td>
			</tr>
		</table>
	</c:when>
	<c:when test="${contenttypeid == '39'}">
	<h3>음식점</h3>
		<table>
			<tr>
				<td style="text-align:center">주요 정보</td>
				<td style="text-align:center">기타 정보</td>
			</tr>
			<tr style="padding:30px">
				<td style="padding:30px">
				<c:if test="${detailIntro.restdatefood != null && detailIntro.restdatefood != ''}">º 휴일 : ${detailIntro.restdatefood}<BR><BR></c:if>
				<c:if test="${detailIntro.opentimefood != null && detailIntro.opentimefood != ''}">º 영업시간 : ${detailIntro.opentimefood}<BR><BR></c:if>
				<c:if test="${detailIntro.seat != null && detailIntro.seat != ''}">º 좌석 수 : ${detailIntro.seat}<BR><BR></c:if>
				<c:if test="${detailIntro.scalefood != null && detailIntro.scalefood != ''}">º 규모 : ${detailIntro.scalefood}<BR><BR></c:if>
				<c:if test="${detailIntro.firstmenu != null && detailIntro.firstmenu != ''}">º 대표메뉴 : ${detailIntro.firstmenu}<BR><BR></c:if>
				<c:if test="${detailIntro.discountinfofood != null && detailIntro.discountinfofood != ''}">º 할인정보 : ${detailIntro.discountinfofood}<BR><BR></c:if>
				<c:if test="${detailIntro.chkcreditcardfood != null && detailIntro.chkcreditcardfood != ''}">º 신용카드 사용 여부 : ${detailIntro.chkcreditcardfood}<BR><BR></c:if>
				<c:if test="${detailIntro.packing != null && detailIntro.packing != ''}">º 포장 가능 여부 : ${detailIntro.packing}<BR><BR></c:if>
				<c:if test="${detailIntro.parkingfood != null && detailIntro.parkingfood != ''}">º 주차시설 : ${detailIntro.parkingfood}<BR><BR></c:if>
				<c:if test="${detailIntro.reservationfood != null && detailIntro.reservationfood != ''}">º 예약안내 : ${detailIntro.reservationfood}<BR><BR></c:if>
				<c:if test="${detailIntro.infocenterfood != null && detailIntro.infocenterfood != ''}">º 문의 및 안내 : ${detailIntro.infocenterfood}<BR><BR></c:if>
				</td>
				<td style="padding:30px">
					<c:forEach var="d" items="${detailInfo }">
						º ${d.infoname }<BR>
						&nbsp&nbsp&nbsp - ${d.infotext }<BR><BR>
					</c:forEach>
				</td>
			</tr>
		</table>
	</c:when>
	<c:when test="${contenttypeid == '25'}">
	<h3>여행 코스</h3>
		<table>
			<tr style="padding:30px">
				<td style="padding:30px">
					<c:if test="${detailIntro.distance != null && detailIntro.distance != ''}">º 총 거리 : ${detailIntro.distance }<BR><BR></c:if>
					<c:if test="${detailIntro.taketime != null && detailIntro.taketime != ''}">º 소요시간 : ${detailIntro.taketime }<BR><BR></c:if>
				</td>
			</tr>
		</table><hr>
		<table>
		<c:forEach var="c" items="${detailInfo }" varStatus="i">
			<tr>
				<td colspan="2"><b>${i.count}코스 : ${c.subdetailalt }</b></td>
			</tr>
			<tr>
				<td style="width:500px;height:400px"><img src="${c.subdetailimg }" style="width:450px;height:300px"/></td>
				<td style="padding:30px"><b>코스개요</b><BR><BR>${c.subdetailoverview }</td>
			</tr>
		</c:forEach>
		</table>
		
		
	</c:when>
</c:choose>
<button onclick="history.go(-1)">이전으로</button>
</body>
</html>