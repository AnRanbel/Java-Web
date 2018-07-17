<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!-- 最简单的处理方式 -->
<%-- <% response.setHeader("Access-Control-Allow-Origin","*"); %> --%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>Video</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">

<link rel="stylesheet" type="text/css" href="css/jquery.jscrollpane.css"
	media="all" />
<link rel="stylesheet" type="text/css" href="css/video.css">

<script type="text/javascript" src="js/swfobject.js"></script>
<!-- <script type="text/javascript" src="js/jquery-1.7.min.js"></script> -->
<!-- jQuery -->
<script type="text/javascript" src="js/swfobject.js"></script>
<script type="text/javascript" src="js/jquery-1.7.min.js"></script>
<script type="text/javascript">jQuery.noConflict();</script>
<script type="text/javascript" src="js/jquery.mousewheel.min.js"></script>
<script type="text/javascript" src="js/jquery.jscrollpane.min.js"></script>
<script type="text/javascript" src="js/jquery.easing.1.3.js"></script>
<script type="text/javascript" src="js/jquery.videoGallery.min.js"></script>
<script type="text/javascript">
		
			var jsReady = false;//for flash/js communication
		
			// FLASH EMBED PART
			var flashvars = {};
			var params = {};
			var attributes = {};
			attributes.id = "flashPreview";
			params.quality = "high";
			params.scale = "noscale";
			params.salign = "tl";
			params.wmode = "transparent";
			params.bgcolor = "#111";
			params.devicefont = "false";
			params.allowfullscreen = "true";
			params.allowscriptaccess = "always";
			swfobject.embedSWF("preview.swf", "flashPreview", "100%", "100%", "9.0.0", "expressInstall.swf", flashvars, params, attributes);
			
			// FLASH EMBED PART
			var flashvars2 = {};
			var params2 = {};
			var attributes2 = {};
			attributes2.id = "flashMiniPreview";
			params2.quality = "high";
			params2.scale = "noscale";
			params2.salign = "tl";
			params2.wmode = "transparent";
			params2.bgcolor = "#111";
			params2.devicefont = "false";
			params2.allowfullscreen = "true";
			params2.allowscriptaccess = "always";
			swfobject.embedSWF("preview2.swf", "flashMiniPreview", "100%", "100%", "9.0.0", "expressInstall.swf", flashvars2, params2, attributes2);
			
			//functions called from flash
			function flashVideoEnd() {
				jQuery.videoGallery.flashVideoEnd(); 
			}
			
			function flashVideoStart() {
				jQuery.videoGallery.flashVideoStart(); 
			}
			
			function flashPreviewVideoStart() {
				jQuery.videoGallery.flashPreviewVideoStart(); 
			}
			
			function dataUpdateFlash(bl,bt,t,d) {
				jQuery.videoGallery.dataUpdateFlash(bl,bt,t,d); 
			}
			
			function toggleFlashPreview() {
				jQuery.videoGallery.toggleFlashPreview(); 
			}
			
			function flashVideoPause() {
				jQuery.videoGallery.flashVideoPause(); 
			}
			
			function flashVideoResume() {
				jQuery.videoGallery.flashVideoResume(); 
			}
			
			function isReady() {
				return jsReady;
			}
			
			function videoGallerySetupDone(){
				//console.log('videoGallerySetupDone');
			}
			
			function videoGalleryPlaylistEnd(){
				//console.log('videoGalleryPlaylistEnd');
			}
			
			// SETTINGS
			var settings = {
				/* activePlaylist: set active playlist that will be loaded on beginning (pass element 'id') */
				activePlaylist: 'playlist1',
				/*defaultVolume: 0-1 */
				defaultVolume:0.7,
				/*activeItem: 0 = first video, 1 = second video, 2 = third video etc... Enter -1 for none.  */
				activeItem:0,
				/*autoPlay: true/false */
				autoPlay:false,
				/*autoAdvanceToNextVideo: true/false */
				autoAdvanceToNextVideo:false,
				/*  autoHideControls: auto hide player controls on mouse out: true/false */
				autoOpenDescription:false,
				/*  useLivePreview: true/false (if thue, you need small videos for preview) */
				useLivePreview: false,
				/*  playlistOrientation: vertical/horizontal  */
				playlistOrientation:'vertical',
				/*  playlistType: line/grid  */
				playlistType:'line',
				/*  useRealFullscreen: true/false, otherwise 'full-window'.(html5 experimantal feature, still in development so it might change) */
				useRealFullscreen:true,
				
				/*  special settings just for this file */
				/*  innerPlaylist: true/false  */
				innerPlaylist:true,
				/*  togglePlaylistSide: */
				togglePlaylistSide:'right',
				/*  closePlaylistOnVideoSelect: true / false */
				closePlaylistOnVideoSelect:true,
				/*  autoOpenPlaylist: true/false  */
				autoOpenPlaylist:false
			};
			
			jQuery(window).load(function() {

              jsReady = true;
              jQuery.videoGallery('#componentWrapper', '#flashPreview', '#flashMiniPreview', settings);
              settings = null;
    	    });
		
        </script>

</head>

<body>

	<div class="holder">

		<div id="header">排球精彩瞬间</div>
		<!--<div class="btn-holder"><a class="button" href="#">垂直播放列表</a> <a  class="button" href="index2.html">水平播放列表</a> </div>-->

		<!-- wrapper for the whole component -->
		<div id="componentWrapper" style="margin-top: 40px;">


			<!-- for video code -->
			<div class="mediaWrapper">
				<div class="mediaHolder"></div>
				<!-- flash embed part -->
				<div id="flashPreview">
					<a href="http://www.adobe.com/go/getflashplayer"> <img
						src="http://www.adobe.com/images/shared/download_buttons/get_flash_player.gif"
						alt="Get Adobe Flash player" />
					</a>
				</div>
				<!-- preview image -->
				<div class="mediaPreview"></div>
				<div class="big_play"></div>

				<div class="playerControls">
					<a class="player_control player_play player_playControl"> <span
						class="player_control_tooltip">Play / Pause</span>
					</a>
					<div class="seekbar player_seekbar">
						<div class="progress_bg seekbar_bg">
							<div class="load_level"></div>
							<div class="progress_level level"></div>

						</div>
					</div>
					<a class="player_control player_fullscreen"> <span
						class="player_control_tooltip">Fullscreen</span>
					</a> <a class="player_control player_playlist"> <span
						class="player_control_tooltip">Show Playlist</span>
					</a> <a class="player_control player_info"> <span
						class="player_control_tooltip">Show Info</span>
					</a>
					<div class="player_control player_resolution">
						<a class="player_control resolution_hd inactive"> <span
							class="player_control_tooltip">High Quality</span>
						</a> <a class="player_control resolution_sd active enabled"> <span
							class="player_control_tooltip">Low Quality</span>
						</a>
					</div>
					<div class="player_control player_volume">
						<div class="volume_seekbar seekbar">
							<div class="volume_bg seekbar_bg">
								<div class="volume_level level"></div>
							</div>
						</div>
						<a class="player_volume_icon"></a>

					</div>
					<div class="player_mediaTime">0:00 / 0:00</div>
					<a class="player_control player_repeat"> <span
						class="player_control_tooltip">Repeat</span>
					</a>
				</div>

				<!-- media description -->
				<div class="infoHolder"></div>

				<div class="playlistHolder">

					<div class="componentPlaylist">

						<!--                         <div id="flashMiniPreview">
                             <a href="http://www.adobe.com/go/getflashplayer">
                                <img src="http://www.adobe.com/images/shared/download_buttons/get_flash_player.gif" alt="Get Adobe Flash player" />
                             </a>
                         </div>-->

						<!-- playlist_inner: container for scroll -->
						<div class="playlist_inner">

							<!--
                          LIST OF PLAYLISTS. 
                          All these playlist NEED to have 'display:none' in CSS on 'ul' element!
                         
                          data-width, data-height: width and height of video (OPTIONAL but recommended!)
                           -->

							<ul id="playlist1">
								<li class="playlistNonSelected" data-path="media/1/huiruoqi"
									data-path-hd="media/1/huiruoqi" data-width="960"
									data-height="536"
									data-description="<span class='infoTitle'>惠若琪里约周期精彩集锦</span><br/><br/>惠若琪,前中国女子排球运动员兼中国女排队长,身高191cm,司职主攻手,披12号球衣.">
									<div class="playlistThumb">
										<img class="thumb" src="media/1/huiruoqi.jpg" width="32"
											height="32" alt="" />
									</div>
									<div class="playlistTitle">惠若琪里约周期精彩集锦</div>
									<div class="playlistContent"
										title="惠若琪,前中国女子排球运动员兼中国女排队长,身高191cm,司职主攻手,身披12号球衣.">惠若琪,前中国女子排球运动员兼中国女排队长,身高191cm,司职主攻手,身披12号球衣.</div>
								</li>

								<li class="playlistNonSelected" data-path="media/3/zhuting"
									data-path-hd="media/3/zhuting" data-width="960"
									data-height="536"
									data-description="<span class='infoTitle'>朱婷联赛精彩集锦</span><br/><br/>朱婷,现效力于土超球队瓦基弗银行女排,现时亦担任中国女排队长,成为FIVB历史上夺得最多正规世界赛MVP的运动员.">
									<div class="playlistThumb">
										<img class="thumb" src="media/3/zhuting.jpg" width="120"
											height="76" alt="" />
									</div>
									<div class="playlistTitle">朱婷联赛精彩集锦</div>
									<div class="playlistContent"
										title="朱婷,现效力于土超球队瓦基弗银行女排,现时亦担任中国女排队长,身披2号球衣,成为FIVB历史上夺得最多正规世界赛MVP的运动员.">朱婷,现效力于土超球队瓦基弗银行女排,现时亦担任中国女排队长,身披2号球衣,成为FIVB历史上夺得最多正规世界赛MVP的运动员.</div>
								</li>

								<li class="playlistNonSelected"
									data-path="media/7/Pleumjit Thinkaow"
									data-path-hd="media/7/Pleumjit Thinkaow" data-width="960"
									data-height="536"
									data-description="<span class='infoTitle'>Pleumjit Thinkaow</span><br/><br/>普莱姆基特,现泰国女排队员兼队长,司职副攻,身穿5号球衣.">
									<div class="playlistThumb">
										<img class="thumb" src="media/7/Pleumjit Thinkaow.jpg"
											width="120" height="76" alt="" />
									</div>
									<div class="playlistTitle">Pleumjit Thinkaow</div>
									<div class="playlistContent"
										title="普莱姆基特,现泰国女排队员兼队长,司职副攻,身披5号球衣.">普莱姆基特,现泰国女排队员兼队长,司职副攻,身披5号球衣.</div>
								</li>

								<li class="playlistNonSelected"
									data-path="media/8/Nootsara Tomkom"
									data-path-hd="media/8/Nootsara Tomkom" data-width="960"
									data-height="536"
									data-description="<span class='infoTitle'>Nootsara Tomkom</span><br/><br/>努特萨拉,现泰国女排队员,司职二传,身穿13号球衣。现效力于费内巴切女排俱乐部.">
									<div class="playlistThumb">
										<img class="thumb" src="media/8/Nootsara Tomkom.jpg"
											width="120" height="76" alt="" />
									</div>
									<div class="playlistTitle">Nootsara Tomkom</div>
									<div class="playlistContent"
										title="努特萨拉,现泰国女排队员,司职二传,身披13号球衣。现效力于费内巴切女排俱乐部.">努特萨拉,现泰国女排队员,司职二传,身披13号球衣。现效力于费内巴切女排俱乐部.</div>
								</li>

								<li class="playlistNonSelected"
									data-path="media/9/Kim Yeon-Koung"
									data-path-hd="media/9/Kim Yeon-Koung" data-width="960"
									data-height="536"
									data-description="<span class='infoTitle'>Kim Yeon Koung</span><br/><br/>金软景,现韩国女排队员兼队长,司职主攻,身穿10号球衣。现效力于上海光明优倍女排俱乐部.">
									<div class="playlistThumb">
										<img class="thumb" src="media/9/Kim Yeon-Koung.jpg"
											width="120" height="76" alt="" />
									</div>
									<div class="playlistTitle">Kim Yeon-Koung</div>
									<div class="playlistContent"
										title="金软景,现韩国女排队员兼队长,司职主攻,身穿10号球衣。现效力于上海光明优倍女排俱乐部.">金软景,现韩国女排队员兼队长,司职主攻,身穿10号球衣。现效力于上海光明优倍女排俱乐部.</div>
								</li>

								<li class="playlistNonSelected"
									data-path="media/10/Tijana Bošković"
									data-path-hd="media/10/Tijana Bošković" data-width="960"
									data-height="536"
									data-description="<span class='infoTitle'>Tijana Bošković</span><br/><br/>博斯科维奇,塞尔维亚国家女子排球队队员,司职接应,身披18号球衣,现效力于伊萨奇巴希女排俱乐部.">
									<div class="playlistThumb">
										<img class="thumb" src="media/10/Tijana Bošković.jpg"
											width="120" height="76" alt="" />
									</div>
									<div class="playlistTitle">Tijana Bošković</div>
									<div class="playlistContent"
										title="博斯科维奇,塞尔维亚国家女子排球队队员,司职接应,身披18号球衣,现效力于伊萨奇巴希女排俱乐部.">博斯科维奇,塞尔维亚国家女子排球队队员,司职接应,身披18号球衣,现效力于伊萨奇巴希女排俱乐部.</div>
								</li>

								<li class="playlistNonSelected" data-path="media/11/Libero"
									data-path-hd="media/11/Libero" data-width="960"
									data-height="536"
									data-description="<span class='infoTitle'>Libero</span><br/><br/>自由人,是专职防守的球员,负责接扣球和接发球防守的部分。通常自由人具有全队最快和反映速度最好的一传技术.">
									<div class="playlistThumb">
										<img class="thumb" src="media/11/Libero.jpg" width="120"
											height="76" alt="" />
									</div>
									<div class="playlistTitle">Libero</div>
									<div class="playlistContent"
										title="自由人,是专职防守的球员,负责接扣球和接发球防守的部分。通常自由人具有全队最快和反映速度最好的一传技术.">自由人,是专职防守的球员,负责接扣球和接发球防守的部分。通常自由人具有全队最快和反映速度最好的一传技术.</div>
								</li>

								<li class="playlistNonSelected"
									data-path="media/2/TOP 20 Best Volleyball Quick Spikes"
									data-path-hd="media/2/TOP 20 Best Volleyball Quick Spikes"
									data-width="960" data-height="536"
									data-description="<span class='infoTitle'>TOP 20 Best Volleyball Quick Spikes</span><br/><br/>TOP 20 Best Volleyball Quick Spikes.">
									<div class="playlistThumb">
										<img class="thumb"
											src="media/2/TOP 20 Best Volleyball Quick Spikes.jpg"
											width="120" height="76" alt="" />
									</div>
									<div class="playlistTitle">TOP 20 Best Volleyball Quick
										Spikes</div>
									<div class="playlistContent"
										title="TOP 20 Best Volleyball Quick Spikes.">TOP 20 Best
										Volleyball Quick Spikes.</div>
								</li>

								<li class="playlistNonSelected"
									data-path="media/4/China Volleyball_1"
									data-path-hd="media/4/China Volleyball_1" data-width="960"
									data-height="536"
									data-description="<span class='infoTitle'>里约奥运会夺冠记-逆战</span><br/><br/>央视纪录片之星耀征途——中国女排里约奥运会夺冠记-逆战.">
									<div class="playlistThumb">
										<img class="thumb" src="media/4/China Volleyball_1.jpg"
											width="120" height="76" alt="" />
									</div>
									<div class="playlistTitle">里约奥运会夺冠记-逆战</div>
									<div class="playlistContent"
										title="央视纪录片之星耀征途——中国女排里约奥运会夺冠记-逆战.">央视纪录片之星耀征途——中国女排里约奥运会夺冠记-逆战.</div>
								</li>

								<li class="playlistNonSelected"
									data-path="media/5/China Volleyball_2"
									data-path-hd="media/5/China Volleyball_2" data-width="960"
									data-height="536"
									data-description="<span class='infoTitle'>里约奥运会夺冠记-绝战</span><br/><br/>央视纪录片之星耀征途——中国女排里约奥运会夺冠记-绝战.">
									<div class="playlistThumb">
										<img class="thumb" src="media/5/China Volleyball_2.jpg"
											width="120" height="76" alt="" />
									</div>
									<div class="playlistTitle">里约奥运会夺冠记-绝战</div>
									<div class="playlistContent"
										title="央视纪录片之星耀征途——中国女排里约奥运会夺冠记-绝战.">央视纪录片之星耀征途——中国女排里约奥运会夺冠记-绝战.</div>
								</li>

								<li class="playlistNonSelected"
									data-path="media/6/China Volleyball_3"
									data-path-hd="media/6/China Volleyball_3" data-width="960"
									data-height="536"
									data-description="<span class='infoTitle'>里约奥运会夺冠记-决战</span><br/><br/>央视纪录片之星耀征途——中国女排里约奥运会夺冠记-决战.">
									<div class="playlistThumb">
										<img class="thumb" src="media/6/China Volleyball_3.jpg"
											width="120" height="76" alt="" />
									</div>
									<div class="playlistTitle">里约奥运会夺冠记-决战</div>
									<div class="playlistContent"
										title="央视纪录片之星耀征途——中国女排里约奥运会夺冠记-绝战.">央视纪录片之星耀征途——中国女排里约奥运会夺冠记-决战.</div>
								</li>
							</ul>
						</div>

					</div>

				</div>

			</div>

		</div>


		<div id="news">Latest news</div>
		<div class="row">
			<div class="hol">
				<div class="home-thumb">
					<img src="img/new_1.jpg" alt="News" title="News" width="210px;"/>
				</div>
				<h2 class="home-post-title">中国女排亚运会+世锦赛</h2>
				<p>休息回来重新投入工作，心中更多了几分期待，走在训练局的林荫道上，
				脚步禁不住加快，因为——很想早一点见到排球馆里那些可爱的人们，很想
				说一声：好久不见，真的很想念。</p>
			</div>
			<!-- end hol -->
			<div class="hol">
				<div class="home-thumb">
					<img src="img/new_2.jpg" alt="News" title="News" width="210px;"/>
				</div>
				<h2 class="home-post-title">郎导:女排精神是做好每一天 大赛当前和时间赛跑</h2>
				<p>中国女排姑娘们在音乐声中绕着场地跑步热身，大声喊着“加油！”、“嗨！”，
				一整天的训练就这样开始了，一如集训的每一天。</p>
			</div>
			<!-- end hol -->
			<div class="hol">
				<div class="home-thumb">
					<img src="img/new_3.jpg" alt="News" title="News" width="210px;"/>
				</div>
				<h2 class="home-post-title">女排亚俱杯江苏1-3日本NEC 小组第3八强战PK印尼</h2>
				<p>代表中国出战的江苏女排在小组赛第三回合1-3不敌日本女排联赛冠军NEC火箭女排俱乐部名列小组第三，
				两连胜的日本NEC名列小组第一，泰国春武里至尊女排排名小组第二。</p>
			</div>
			<!-- end hol -->
			<div class="hol last">
				<div class="home-thumb">
					<img src="img/new_4.jpg" alt="News" title="News" width="210px;"/>
				</div>
				<h2 class="home-post-title">女排宿敌现妈妈级球员</h2>
				<p>在日本女排出征亚运会的大名单，34岁老将荒木绘里香再度入选让人有些意外。
				这名妈妈级的球员将又一次代表日本女排出战世界大赛，不得不让人钦佩。</p>
			</div>
			<!-- end hol -->
		</div>

		<div id="footer">
			<div id="copy">
				Copyright &copy; <a
					href="https://github.com/AnRanbel/Java_Web_Examples">WangYing</a>.
				All rights reserved.
			</div>
		</div>

	</div>
	<!--end holder-->

</body>
</html>
