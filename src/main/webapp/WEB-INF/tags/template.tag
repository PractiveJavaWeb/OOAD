
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@attribute name="header" fragment="true"%>
<%@attribute name="footer" fragment="true"%>
<!-- *******************HEADER************************ -->
<div id="pageheader">
	<title>WELCOME TO ICSSE 2017</title>
	<link href="<c:url value='/resources/CSS/bootstrap.css' />"
		rel="stylesheet"></link>
	<link href="<c:url value='/resources/CSS/app.css' />" rel="stylesheet"></link>
	<link href="/resources/CSS/show_img.css" rel="stylesheet"
		type="text/css" />
	<script type="text/javascript"
		src="/resources/Portlets/PanelBar/js/jquery-1.7.2.min.js"></script>
	<script src="/resources/Scripts/Common.js" type="text/javascript"></script>
	<script src="/resources/Scripts/PagingContent.js"
		type="text/javascript"></script>
	<link rel="shortcut icon" type="image/png"
		href="/resources/Resources/Imagephoto/logo.png" />
	<link href="/resources/Components/lightbox/css/lightbox.css"
		rel="stylesheet" type="text/css" />
	<script src="/resources/Components/lightbox/js/lightbox.min.js"
		type="text/javascript"></script>
	<link href="/resources/CSS/search_Article.css" rel="stylesheet" />
	<script src="/resources/assets/WebResource9.axd" type="text/javascript"></script>
	<script src="/resources/assets/Telerik.Web.UI.WebResource.axd"
		type="text/javascript"></script>
	<script src="/resources/Services/PortletProxy.asmx/jsdebug"
		type="text/javascript"></script>
	<script src="/resources/Services/ModuleProxy.asmx/jsdebug"
		type="text/javascript"></script>
	<script src="/resources/Services/CMS.asmx/jsdebug"
		type="text/javascript"></script>
	<script src="/resources/Services/WeatherService.asmx/jsdebug"
		type="text/javascript"></script>
	<link href="/resources/Resources/ImagesPortal/PhongBan/main.css"
		rel="stylesheet" />
	<link href="/resources/CSS/mainPortlets.css" rel="stylesheet" />
	<!-- script ckeditor -->
	<script type="text/javascript" src="/resources/ckeditor/ckeditor.js"></script>
	<!-- script banner -->
	<link href="/resources/Portlets/NivoSlider/CSS/nivo-slider.css"
		rel="stylesheet" />
	<link
		href="/resources/Portlets/NivoSlider/CSS/themes/default/default.css"
		rel="stylesheet" />
	<script
		src="/resources/Portlets/NivoSlider/Scripts/jquery.nivo.slider.js"></script>
	<script>
		$(document).ready(function() {
			$(".nivoSlider").nivoSlider({
				effect : 'random',
				slices : 15,
				boxCols : 8,
				boxRows : 4,
				animSpeed : 500,
				pauseTime : 3000,
				startSlide : 0,
				directionNav : true,
				controlNav : true,
				controlNavThumbs : false,
				pauseOnHover : true,
				manualAdvance : false,
				prevText : 'Prev',
				nextText : 'Next',
				randomStart : false,
				beforeChange : function() {
				},
				afterChange : function() {
				},
				slideshowEnd : function() {
				},
				lastSlide : function() {
				},
				afterLoad : function() {
				}
			});
			$('.nivoSlider').css('height', '350px');
			$('.nivoSlider img').css('height', '350px');
		})
	</script>
	<div class="gray">
		<div class="wrapper">
			<table cellspacing="0" cellpadding="0" border="0">
				<tr>
					<td colspan="2">
						<div id="pnTop">
							<div id="pnTopDisplay" style="width: 1000px; float: left">
								<div id='ctl06_portlet_83a3e05a-eb99-4512-bd1a-5af90706fcf3'
									style="width: 574px; float: left">
									<div>
										<!-- Logo top -->
										<div class="P_top">
											<div class="P_logo">
												<div class="anh_logo">
													<img alt=""
														src="/resources/Resources/Images/SubDomain/icsse2017/Banner Hoi nghi quoc te sua.jpg"
														style="width: 800px; height: 188px;" /><br />
												</div>
												<div class="name_ute"></div>
											</div>
										</div>
										<!-- Logo top -->
									</div>
								</div>
								<!-- Link website and search -->
								<div id='ctl06_portlet_6299a742-1878-4325-8536-4faefa3c1b4c'
									style="width: 199px; float: right">
									<div>
										<div class="search_phong">
											<input class="bgsearch_phong" id="txtSearchArticle"
												onkeydown="return SearchProcess(event);" type="text" /> <input
												class="btsearch_phong"
												onclick="OnSearch(document.getElementById('txtSearchArticle').value);"
												type="button" />
										</div>
										<div class="link_trang">
											<a href="http://icsse2017.hcmute.edu.vn">http://icsse2017.hcmute.edu.vn</a>
										</div>

									</div>
								</div>
								<!-- end Link website and search -->
								<!-- banner -->
								<div id='banner' style="width: 1000px; float: left">
									<div class="col-md-12" style="height: auto;">
										<div class="slider-wrapper theme-default">
											<div id="slider" class="nivoSlider">
												<a href="#" target="_blank"> <img
													src="/resources/Resources/imagesPortlet/banner/HNQT3.jpg"
													title="" /></a> <a href="" target="_blank"> <img
													src="/resources/Resources/imagesPortlet/baner/HNQT2.jpg"
													title="" /></a> <a href="" target="_blank"> <img
													src="/resources/Resources/imagesPortlet/baner/HNQT1.jpg"
													title="" /></a>

											</div>
										</div>
									</div>

								</div>
							</div>
							<!-- end banner -->
							<!-- Menu -->
							<div id='ctl06_portlet_800886a8-ccb5-40dd-813a-2c02ac0d2e92'
								style="padding: 10px 0px 0px 0px; width: 1000px; float: left">
								<div>

									<link href="/resources/Portlets/MenuRad/Menu.Green.css"
										rel="stylesheet" type="text/css" />
									<div
										id="ctl06_portlet_800886a8-ccb5-40dd-813a-2c02ac0d2e92_RadMenu"
										class="RadMenu RadMenu_Green rmSized"
										style="height: 40px; z-index: 1; width: 100%;">
										<ul class="rmRootGroup rmHorizontal">
											<li class="rmItem rmFirst"><a href="news-10"
												class="rmLink rmRootLink"> <span class="rmText">Home</span>
											</a></li>
											<li class="rmItem " style="z-index: 0;"><a href="#"
												class="rmLink rmRootLink"> <span
													class="rmText rmExpandDown">About</span>
											</a>
												<div class="rmSlide"
													style="visibility: visible; height: 102px; width: 139px; display: none; overflow: hidden; left: 0px; top: 40px; z-index: 10;">
													<ul class="rmVertical rmGroup rmLevel1"
														style="display: block; top: -102px; left: 0px; visibility: visible;">
														<li class="rmItem rmFirst"><a
															href="/Default.aspx?ArticleId=f9111384-c9ad-46ac-ba10-037bf3d691a4"
															class="rmLink" style="width: 139px;"> <span
																class="rmText">icsse</span>
														</a></li>
														<li class="rmItem "><a
															href="/Default.aspx?ArticleId=c8018710-9562-44c6-bef0-2a0f22e73f6b"
															class="rmLink" style="width: 139px;"> <span
																class="rmText">HCMUTE</span>
														</a></li>
														<li class="rmItem rmLast"><a
															href="/Default.aspx?ArticleId=dd21088d-cb55-4f9d-ac9c-73553c715cae"
															class="rmLink" style="width: 139px;"> <span
																class="rmText">Committees</span>
														</a></li>

													</ul>
												</div></li>
											<li class="rmItem "><a href="news-12"
												class="rmLink rmRootLink"> <span class="rmText">Call
														for papers</span>
											</a></li>
 											<sec:authorize access="hasRole('USER')">
											<li class="rmItem "><a href="news-13"
												class="rmLink rmRootLink"> <span class="rmText">Submission</span>
											</a></li>
											<li class="rmItem "><a href="news-14"
												class="rmLink rmRootLink"> <span class="rmText">Registration</span>
											</a></li>
											<li class="rmItem "><a href="news-15"
												class="rmLink rmRootLink"> <span class="rmText">Keynote
														Speakers</span>
											</a></li>
											<li class="rmItem "><a
												href="/resources/Portlets/MenuRad/#"
												class="rmLink rmRootLink"> <span class="rmText">Program</span>
											</a></li>
											<li class="rmItem "><a href="news-16"
												"
												class="rmLink rmRootLink"> <span
													class="rmText">Venue & Hotel</span>
											</a></li>
											</sec:authorize>
											<!-- <li class="rmItem rmLast" style="z-index: 0;"><a
												href="#" class="rmLink rmRootLink"> <span
													class="rmText rmExpandDown">More</span>
											</a>
												<div class="rmSlide"
													style="visibility: visible; height: 102px; width: 139px; display: none; overflow: hidden; left: 0px; top: 40px; z-index: 10;">
													<ul class="rmVertical rmGroup rmLevel2"
														style="display: block; top: -102px; left: 0px; visibility: visible;">
														<li class="rmItem rmFirst"><a
															href="/Default.aspx?ArticleId=62bc2b02-e1ca-41ca-b0da-928ed1ccfb25"
															class="rmLink" style="width: 139px;"> <span
																class="rmText">Login</span>
														</a></li>
														<li class="rmItem "><a
															href="/Default.aspx?ArticleId=b3639c73-c24b-42ed-97e7-06a3e0cf8b23"
															class="rmLink" style="width: 139px;"> <span
																class="rmText">Edit</span>
														</a></li>
														<li class="rmItem rmLast"><a
															href="Default.aspx?ArticleId=b4031ebe-e802-4402-a49a-5769943872a5"
															class="rmLink rmRootLink"> <span class="rmText">Contact</span>
														</a></li>
													</ul>
												</div></li>
 -->
 											   <sec:authorize access="hasRole('ADMIN') or hasRole('DBA')">
 											   <li class="rmItem "><a href="list"
												class="rmLink rmRootLink"> <span class="rmText">User manage</span>
											</a></li>
 											  
											<li class="rmItem "><a href="managenews"
												class="rmLink rmRootLink"> <span class="rmText">Manage
														Ckeditor</span>
											</a></li>
										 </sec:authorize>
												<div class="authbar">
													<li class="rmItem "><a href="logout"
												class="rmLink rmRootLink"> <span class="rmText">Logout</span>
												</div>

										</ul>
										<input
											id="ctl06_portlet_800886a8-ccb5-40dd-813a-2c02ac0d2e92_RadMenu_ClientState"
											name="ctl06_portlet_800886a8-ccb5-40dd-813a-2c02ac0d2e92_RadMenu_ClientState"
											type="hidden" />
									</div>

								</div>
							</div>

							<!-- end Menu -->
						</div>
						</div>
					</td>
				</tr>
				<!-- *******************HEADER************************ -->

				<!-- *******************BODY************************ -->
				<div id="body">
					<tr valign="top">
						<td>
							<!-- *******************LEFTBODY************************ -->
							<div id="leftbody">
								<jsp:doBody />
							</div> <!-- *******************LEFTBODY************************ -->
						</td>
						<!-- *******************SIDEBAR************************ -->
						<div id="sidebar">

							<td><div id="pnRight">
									<div id="pnRightDisplay"
										style="padding: 0px 0px 0px 6px; width: 300px; float: right">
										<div id='ctl06_portlet_b633be64-8363-4e53-9952-6acf34d3e9e9'
											style="float: left;">
											<div>

												<style type="text/css">
</style>
												<div class="thongbao_phong">

													<div class="topictb_phong_blue">
														<h4 style="color: white; text-align: center;">Latest
															news</h4>

														<a class="wobble-horizontal" href="#"> <img
															src="/resources/Resources/ImagesPortal/PhongBan/arrow_all_phong.png">
														</a>
													</div>
													<div class="listtb_phong">

														<ul>
															<c:forEach items="${news}" var="news">
																<li>
																	<h5 style="color: Red">${news.datepost}</h5> <a
																	href="/news-${news.id}">
																		<h5>${news.title}</h5>
																</a>
																</li>
															</c:forEach>
														</ul>

													</div>
													<!--end listtb_phong-->
												</div>

											</div>
										</div>
										<div id='ctl06_portlet_9d945843-6c22-4daf-9b88-835da3891673'
											style="float: left">
											<div>
												<table>
													<tbody>
														<tr>
															<td
																style="text-align: left; width: 350px; height: 40px; vertical-align: middle; background-color: #ff0000;">&nbsp;<span
																style="font-size: 20px; color: #ffff00;"><strong>IMPORTANT
																		DEADLINES</strong></span></td>
														</tr>
													</tbody>
												</table>
												<p style="text-align: justify;">
													<span style="font-size: 12px; color: #002060;"><strong><br />
													</strong></span>
												</p>
												<div style="text-align: center;">
													<strong><strong style="text-align: left;"><span
															style="font-size: 16px;"><span
																style="text-decoration: line-through;">March 7,
																	2017</span><br /> <strong><span
																	style="color: #c00000;">Extended untill March
																		19, 2017</span></strong><br /> </span></strong></strong>
												</div>
												<span style="font-size: 16px; color: #002060;"><strong>
												</strong> </span>
												<div style="text-align: center;">
													<span style="font-size: 16px; color: #002060;"><span
														style="text-align: left; font-size: 16px;">2-Pages
															&nbsp;Extended Abstract&nbsp;</span><span
														style="font-size: 16px;">Submission</span></span>
												</div>
												<div style="text-align: center;">
													<span style="font-size: 16px; color: #002060;"><br />
													</span>
												</div>
												<span style="font-size: 16px; color: #002060;">
													<div style="text-align: center;">
														<strong style="text-align: left;">March 30, 2017</strong>
													</div>
													<div style="text-align: center;">
														<span style="text-align: left; font-size: 16px;">Notification
															of Acceptance</span>
													</div>
												</span>
												<div style="text-align: center;">
													<span style="font-size: 16px; color: #002060;"><br />
													</span>
												</div>
												<span style="font-size: 16px; color: #002060;">
													<div style="text-align: center;">
														<strong style="text-align: left;">May 10, 2017</strong>
													</div>
													<div style="text-align: center;">
														<span style="text-align: left; font-size: 16px;">2-6
															Pages Final Papers Submission</span>
													</div>
												</span><span style="font-size: 16px;"><span
													style="font-size: 16px; color: #002060;"> </span>
													<div style="text-align: center;">
														<span style="font-size: 16px; color: #002060;"><br />
														</span>
													</div> <span style="font-size: 14px;"><span
														style="font-size: 16px; color: #002060;"> </span>
														<div style="text-align: center;">
															<span style="font-size: 16px; color: #002060;"><strong
																style="font-size: medium; text-align: left;">May
																	30, 2017</strong><span
																style="text-align: left; font-size: 16px;">:&nbsp;</span></span>
														</div> <span style="font-size: 16px; color: #002060;"><span
															style="font-size: 16px;"> </span>
															<div style="text-align: center;">
																<span style="text-align: left; font-size: 16px;">Online
																	Registration</span>
															</div> </span> </span> <br /> </span>

											</div>
										</div>
										<div id='ctl06_portlet_553574d9-9245-4da8-a214-baf51898689a'
											style="float: left;">
											<div>
												<table>
													<tbody>
														<tr>
															<td
																style="width: 350px; height: 40px; background-color: #92d050;"><strong><span><span
																		style="font-size: 20px; color: #c00000;">SPECIAL
																			SESSION</span><br /> </span></strong></td>
														</tr>
													</tbody>
												</table>
												<span
													style="font-size: 10.5pt; letter-spacing: 0.85pt; font-family: &amp; amp;"><strong
													style="font-weight: bold; color: #002060; font-family: &amp; amp; amp; amp; amp; amp; amp; amp; quot; times new roman&amp;amp; amp; amp; amp; amp; amp; amp; quot; , serif; font-size: 14px; letter-spacing: 1.13333px;"><strong><br />
															<a
															href="https://easychair.org/conferences/?conf=icsse2017specialsess"
															target="_blank">SPECIAL SESSION SUBMISSION LINK</a>&nbsp;</strong></strong><br />
													<span style="font-size: 14px;"><br />
														<div style="text-align: center;">
															<strong
																style="letter-spacing: 0.85pt; background-color: #ffff00;"><span
																style="color: #002060;"><strong
																	style="letter-spacing: 1.13333px;"><strong>SPECIAL
																			SESSION&nbsp;</strong></strong>01</span></strong>
														</div> <strong>
															<div style="text-align: center;">
																<strong style="letter-spacing: 0.85pt;"><span
																	style="background-color: #ffff00; color: #002060;">INTELLIGENT
																		HEALTHCARE SYSTEMS</span></strong>
															</div>
													</strong></span>
													<div
														style="font-weight: bold; color: #002060; text-align: center;">
														<span style="font-size: 10.5pt; letter-spacing: 0.85pt;"><a
															href="/resources/Resources/Docs/SubDomain/icsse2017/SS02 - call4pp.pdf">CALL
																FOR PAPERS</a></span>
													</div> <br />
													<div style="text-align: center;">
														<strong
															style="font-size: 10.5pt; letter-spacing: 0.85pt; margin: 0px; padding: 0px;"><span
															style="margin: 0px; padding: 0px; font-size: 20px;"><strong
																style="margin: 0px; padding: 0px;"><span
																	style="margin: 0px; padding: 0px; font-size: 14px; background-color: #ffff00; color: #002060;"><strong
																		style="font-family: &amp; amp; amp; amp; amp; amp; amp; amp; quot; times new roman&amp;amp; amp; amp; amp; amp; amp; amp; quot; , serif; font-size: 14px; letter-spacing: 0.85pt; text-align: -webkit-center; background-color: #ffff00;"><span
																			style="color: #002060;"><strong
																				style="letter-spacing: 1.13333px;"><strong>SPECIAL
																						SESSION&nbsp;</strong></strong></span></strong>02<br /> FUZZY SYSTEMS &amp; ITS
																		APPLICATIONS</span></strong></span></strong>
													</div> <strong
													style="margin: 0px; padding: 0px; font-size: 14px;">
														<div style="text-align: center;">
															<strong
																style="letter-spacing: 0.85pt; margin: 0px; padding: 0px;"><a
																href="/resources/Resources/Docs/SubDomain/icsse2017/SS02 - call4pp.pdf"
																style="margin: 0px; padding: 0px; text-decoration: none;">CALL
																	FOR PAPER</a></strong>
														</div>
												</strong> <br /> </span>

											</div>
										</div>
										<div id='ctl06_portlet_78439b67-a318-4ced-ac29-33d02da2a0fb'
											style="float: left;">
											<div>
												<table>
													<tbody>
														<tr>
															<td
																style="text-align: left; width: 350px; vertical-align: middle; height: 40px; background-color: #002060;">&nbsp;<span
																style="font-size: 20px; color: #ffff00;"><strong>KEY
																		LINKS</strong></span></td>
														</tr>
													</tbody>
												</table>
												<br />
												<ul>
													<c:forEach items="${listdocuments}" var="listdocuments">
														<li style="color: #002060; font-size: 16px;"><strong>
																<a
																href="<c:url value='/download-document-${newslist.id}-${listdocuments.id}' />">${listdocuments.description}</a>
														</strong></li>
													</c:forEach>
												</ul>

											</div>
										</div>
									</div>
								</div></td>
					</tr>
				</div>
				<!-- *******************SIDEBAR************************ -->
				</div>
				</div>
				<!-- *******************BODY************************ -->

				<!-- *******************FOOTER************************ -->
				<div id="pagefooter">

					<tr>
						<td colspan="2">
							<div id="pnBottom">
								<div id="pnBottomDisplay"
									style="clear: both; background: url(/resources/Resources/ImagesPortal/PhongBan/bgfooter_phong.png) repeat-x; width: 1000px; height: 110px;">
									<div id='bottomVisit' style="float: right">
										<div>

											<div class="truycap_ute">
												<p>
													<%!int count = 0;%>
													<%
														count++;
													%>
													Visit month:<span id="visit month"><%=count%></span>
												</p>
												<p class="line_footer"></p>
												<p>
													Visit total:<span id="visit total">6,182</span>
												</p>
											</div>

										</div>
									</div>
									<div id='bottomIfo' style="float: left;">
										<div>
											<div class="addute">
												<p>
													<span style="font-size: 14px; color: #ffffff;">2017
														IEEE International Conference on System Science and
														Engineering<br /> <span style="font-size: 14px;">HCMC
															University of Technology and Education</span><br /> Add: No 1
														Vo Van Ngan Street, Linh Chieu Ward, Thu Duc District, Ho
														Chi Minh City<br /> Tel: (+84.8) 37 221 223 - Ext: 8161 /
														8163<br /> E-mail: icsse2017@hcmute.edu.vn
													</span>
												</p>
											</div>

										</div>
									</div>
								</div>
							</div>
						</td>
					</tr>
				</div>

				<!-- *******************FOOTER************************ -->
				</div>