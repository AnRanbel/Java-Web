<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" isELIgnored="false"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">		<!-- 即WebRoot根目录 -->

<title>商品信息</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />


<!-- jQuery -->
<script type="text/javascript" src="js/jquery.min.js"></script>

<!-- Custom Theme files -->
<!--theme-style-->
<link href="css/product_bootstrap.css" rel="stylesheet" type="text/css"
	media="all" />

<link href="css/product_style.css" rel="stylesheet" type="text/css"
	media="all" />

<link href="css/pagination_style.css" rel="stylesheet" type="text/css"
	media="all">

<link rel="stylesheet" href="css/font-awesome/css/font-awesome.min.css">

<script type="application/x-javascript">
	addEventListener("load", function() {
		setTimeout(hideURLbar, 0);
	}, false);
	function hideURLbar() {
		window.scrollTo(0, 1);
	}
</script>
<!--fonts-->
<link
	href="http://fonts.useso.com/css?family=Alegreya+Sans+SC:100,300,400,500,700,800,900,100italic,300italic,400italic,500italic,700italic,800italic,900italic' rel='stylesheet' type='text/css">
<link
	href="http://fonts.useso.com/css?family=Lato:100,300,400,700,900,100italic,300italic,400italic,700italic,900italic' rel='stylesheet' type='text/css">
<!--//fonts-->
<script type="text/javascript" src="js/move-top.js"></script>
<script type="text/javascript" src="js/jquery.easing.1.3.js"></script>
<script type="text/javascript">
	jQuery(document).ready(function($) {
		$(".scroll").click(function(event) {
			event.preventDefault();
			$('html,body').animate({
				scrollTop : $(this.hash).offset().top
			}, 1000);
		});
	});
</script>
<!-- start menu -->
<!-- <script src="js/simpleCart.min.js"> </script> -->
<link href="css/product_memenu.css" rel="stylesheet" type="text/css"
	media="all" />
<script type="text/javascript" src="js/memenu.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$(".memenu").memenu();
	});
</script>

<script type="text/javascript">
	$(document).ready(function(){
	//如果特定商品信息不存在，则显示暂无相关信息
	if($("#list_exist").length>0){
		$("#list_none").hide();
	}else{
		$("#list_none").show();
        $(".pagelink").hide();
        $("#output").hide();
	}
});
</script>

<script type="text/javascript">
    //查找商品
    function searchInfo(){
        if(("#list_none").is(':hidden')){
            var url=window.location.href;
            var inputvalue=$("input[name='search']").val();
            var index=url.indexOf("&search");
            if(index<0){
                url=url.substring(0,url.indexOf("&page"));
            }else{
                url=url.substring(0,index);
            }
            url=url+"&search="+inputvalue+"&page=1";
            window.location.href=url;
        }
    }
</script>

<script type="text/javascript">
    //查找商品——绑定回车
    $(document).keydown(function (event) {
        if(event.keyCode==13){
            $("#search_button").click();
        }
    });
</script>

<script type="text/javascript">
    //价格降序
    function price_down(){
        if($("#list_none").is(':hidden')){
            var url=window.location.href;
            var index=url.indexOf("&sort");
            if(index<0){
                url=url+"&sort=desc";
            }else{
                url=url.substring(0,index);
                url=url+"&sort=desc";
            }
            window.location.href=url;
        }
        return false;
    }
</script>

<script type="text/javascript">
    //价格降序
    function price_up(){
        if($("#list_none").is(':hidden')){
            var url=window.location.href;
            var index=url.indexOf("&sort");
            if(index<0){
                url=url+"&sort=asc";
            }else{
                url=url.substring(0,index);
                url=url+"&sort=asc";
            }
            window.location.href=url;
        }
        return false;
    }
</script>

<body>
	<div class="top-header">
		<div class="container">
			<div class="top-header-main">
				<div class="col-md-4 top-header-left">
					<div class="search-bar">
						<input type="text" name="search" value="${search}" onfocus="this.value = '';"
							onblur="if (this.value == '') {this.value = 'Search';}">
						<input id="search_button" type="button" value="" onclick="searchInfo()">

                        <!--<script type="text/javascript" src="js/atest.js"></script>-->
                        <script type="text/javascript">
                            $(document).ready(function(){
                                $search=$("input[name='search']");
                                if($search.val()==""){
                                    $search.val("Search");
                                }
                            });
                        </script>
					</div>
				</div>
				<div class="col-md-4 top-header-middle">
					<img src="img/logo-4.png" alt="" />
				</div>
				<div class="col-md-4 top-header-right">
					<div class="cart box_1">
						<h3>
							<div>您好,
								<c:choose>
									<c:when test="${not empty username}">
										<a href="servlet/GetUserInfo" class="username"><c:out value="${username}"></c:out></a>&nbsp;
										<a href="servlet/QuitUserServlet?condition=quit" class="quit">退出</a>
									</c:when>
									<c:otherwise>
										<a href="<%=basePath%>" class="quit">请登录</a>
									</c:otherwise>
								</c:choose>
							</a>
							</div>
						</h3>
						<a href="servlet/ViewCartInfo" style="color:#702428;">
							<h3>
								<div class="total">
									<span class="simpleCart_total">我的购物车</span>
								</div>
								<img src="img/cart-1.png" alt="" />
							</h3>
						</a>
						<a href="servlet/ViewFavoritesInfo" style="color:#702428;">
							<h3>
								<div class="favorites">
									<span class="simpleCart_total">我的收藏夹</span>
								</div>
								<img src="" alt="" />
							</h3>
						</a>
						<p>
							<a href="servlet/DeleteCartInfo?delete_id=ALL"
								class="simpleCart_empty" onclick="return clear_cart();">清空购物车</a>		<!-- onclick与href冒泡执行,onclick返回false则阻碍href跳转 -->
						</p>
						<p>
							<a href="servlet/DeleteFavoritesInfo?delete_id=ALL"
								class="simpleCart_empty" onclick="return clear_favorites();">清空收藏夹</a>
						</p>
						<div class="clearfix"></div>
					</div>
				</div>
				<div class="clearfix"></div>
			</div>
		</div>
	</div>
	<!--top-header-->
	<!--bottom-header-->
	<div class="header-bottom">
		<div class="container">
			<div class="top-nav">
				<ul class="memenu skyblue">
					<li class="active"><a href="servlet/GetProductInfo?flag=ALL&page=1">Home</a></li>
					<li class="grid"><a href="#">News</a></li>
					<li class="grid"><a href="#">China League</a>
						<div class="mepanel" style="left:38.5%">
							<div class="row">
								<div class="col1 me-one">
									<ul>
										<li><a href="#">Women's League</a></li>
										<li><a href="#">Men's League</a></li>
									</ul>
								</div>
							</div>
						</div></li>
					<li class="grid"><a href="#">Volleyball</a>
						<div class="mepanel" style="left:52%">
							<div class="row">
								<div class="col1 me-one">
									<ul>
										<li><a href="#">Female Volleyball</a></li>
										<li><a href="#">Male Volleyball</a></li>
										<li><a href="#">Beach Volleyball</a></li>
										<li><a href="#">Mass Volleyball</a></li>
									</ul>
								</div>
							</div>
						</div></li>
					<li class="grid"><a href="#">Contact</a></li>
					<li class="grid"><a href="video.jsp">Video</a></li>
				</ul>
			</div>
			<div class="clearfix"></div>
		</div>
	</div>
	<!--bottom-header-->
	<!--start-breadcrumbs-->
	<div class="breadcrumbs">
		<div class="container">
			<div class="breadcrumbs-main">
				<ol class="breadcrumb">
					<li>Home</li>
					<li class="active"><c:out value="${param.flag0}->"></c:out><c:out value="${param.flag}"></c:out></li>
                    <li>&nbsp; 排序&nbsp;
                        <a href="javascript:void(0)" onclick="return price_down();"><i class="fa fa-long-arrow-down" aria-hidden="true"></i></a>
                        <a href="javascript:void(0)" onclick="return price_up();"><i class="fa fa-long-arrow-up" aria-hidden="true"></i></a>
                    </li>
				</ol>
			</div>
		</div>
	</div>
	<!--end-breadcrumbs-->
	<!--start-product-->
	<div class="product">
		<div class="container">
			<div class="product-main">
				<div class="col-md-9 p-left">
					<!-- 商品循环开始 -->
						<c:forEach items="${infolist }" var="post" varStatus="status">
							<div class="col-md-4 product-left single-left" id="list_exist">
								<div class="p-one simpleCart_shelfItem" style="height:55%;">
									<a href="servlet/ViewProductInfo?id=${post.id}"> <img src="img/product/${post.product_img}" alt="图片不存在" />
										<div class="mask mask1">
											<span>Quick View</span>
										</div>
									</a>
									<span class="product_title">${post.product_info}</span>
									<div>
										<p>
											<a class="item_add" href="#"><i></i> <span
												class=" item_price">${post.new_price}</span></a>
										</p>
									</div>
								</div>
							</div>

							<c:if test="${status.count%3==0}">

							</c:if>
						</c:forEach>
						<div class="col-md-4 product-left single-left" id="list_none">
							<span>暂无相关信息</span>
						</div>
					<!-- 商品循环结束 -->
				</div>
				<div class="col-md-3 p-right single-right">
					<a href="servlet/GetProductInfo?flag=ALL&page=1" style="text-decoration:none;"><h3 style="color:#FF3333;">ALL</h3></a>
				</div>
				<div class="col-md-3 p-right single-right">
					<h3>Categories</h3>
						<ul class="product-categories">
							<li><a href="servlet/GetProductInfo?flag0=Categories&flag=Volleyball&index=1&page=1">Volleyball</a> <span class="count">(<c:out value="${countlist[0]}"></c:out>)</span></li>
							<li><a href="servlet/GetProductInfo?flag0=Categories&flag=Volleyball Court&index=2&page=1">Volleyball Court</a> <span class="count">(<c:out value="${countlist[1]}"></c:out>)</span></li>
							<li><a href="servlet/GetProductInfo?flag0=Categories&flag=Sport Shoes&index=3&page=1">Sport Shoes</a> <span class="count">(<c:out value="${countlist[2]}"></c:out>)</span></li>
							<li><a href="servlet/GetProductInfo?flag0=Categories&flag=Sport Suit&index=4&page=1">Sport Suit</a> <span class="count">(<c:out value="${countlist[3]}"></c:out>)</span></li>
							<li><a href="servlet/GetProductInfo?flag0=Categories&flag=Categories_Other&index=5&page=1">Other</a> <span class="count">(<c:out value="${countlist[4]}"></c:out>)</span></li>
						</ul>
						<h3>Brands</h3>
						<ul class="product-categories">
							<li><a href="servlet/GetProductInfo?flag0=Brands&flag=Mikasa&index=1&page=1">Mikasa(米卡萨)</a> <span class="count">(<c:out value="${countlist[5]}"></c:out>)</span></li>
							<li><a href="servlet/GetProductInfo?flag0=Brands&flag=ASICS&index=2&page=1">ASICS(阿斯克斯)</a> <span class="count">(<c:out value="${countlist[6]}"></c:out>)</span></li>
							<li><a href="servlet/GetProductInfo?flag0=Brands&flag=NIKE&index=3&page=1">NIKE(耐克)</a> <span class="count">(<c:out value="${countlist[7]}"></c:out>)</span></li>
							<li><a href="servlet/GetProductInfo?flag0=Brands&flag=Adidas&index=4&page=1">Adidas(阿迪达斯)</a> <span class="count">(<c:out value="${countlist[8]}"></c:out>)</span></li>
							<li><a href="servlet/GetProductInfo?flag0=Brands&flag=Li-Ning&index=5&page=1">Li-Ning(李宁)</a> <span class="count">(<c:out value="${countlist[9]}"></c:out>)</span></li>
							<li><a href="servlet/GetProductInfo?flag0=Brands&flag=ANTA&index=6&page=1">ANTA(安踏)</a> <span class="count">(<c:out value="${countlist[10]}"></c:out>)</span></li>
							<li><a href="servlet/GetProductInfo?flag0=Brands&flag=XTEP&index=7&page=1">XTEP(特步)</a> <span class="count">(<c:out value="${countlist[11]}"></c:out>)</span></li>
							<li><a href="servlet/GetProductInfo?flag0=Brands&flag=Brands_Other&index=8&page=1">Other(其他)</a> <span class="count">(<c:out value="${countlist[12]}"></c:out>)</span></li>
						</ul>
						<h3>Price</h3>
						<ul class="product-categories p1">
							<li><a href="servlet/GetProductInfo?flag0=Price&flag=0$-200$&index=1&page=1">0$-200$</a> <span class="count">(<c:out value="${countlist[13]}"></c:out>)</span></li>
							<li><a href="servlet/GetProductInfo?flag0=Price&flag=200$-400$&index=2&page=1">200$-400$</a> <span class="count">(<c:out value="${countlist[14]}"></c:out>)</span></li>
							<li><a href="servlet/GetProductInfo?flag0=Price&flag=400$-600$&index=3&page=1">400$-600$</a> <span class="count">(<c:out value="${countlist[15]}"></c:out>)</span></li>
							<li><a href="servlet/GetProductInfo?flag0=Price&flag=600$-800$&index=4&page=1">600$-800$</a> <span class="count">(<c:out value="${countlist[16]}"></c:out>)</span></li>
							<li><a href="servlet/GetProductInfo?flag0=Price&flag=800$-1000$&index=5&page=1">800$-1000$</a> <span class="count">(<c:out value="${countlist[17]}"></c:out>)</span></li>
							<li><a href="servlet/GetProductInfo?flag0=Price&flag=1000以上&index=6&page=1">1000以上</a> <span class="count">(<c:out value="${countlist[18]}"></c:out>)</span></li>
						</ul>
					<div class="footer">
						<div class="container">
							<div class="footer-top">
								<div class="col-md-3 footer-left" style="padding:0px;width:65%">
									<h4>相关链接</h4>
									<ul>
										<li><a href="http://www.volleychina.org/">中国排球协会官方网站</a></li>
										<li><a href="http://www.fivb.com/">国际排联官方网站</a></li>
										<li><a href="http://asianvolleyball.net/">亚洲排球联合会</a></li>
										<li><a href="http://www.volleymasters.ch/en">瑞士女排精英赛</a></li>
										<li><a href="http://www.volleychina.org/">中华人民共和国第十三届亚运会</a></li>
									</ul>
								</div>
								<!-- <div class="col-md-3 footer-left"
									style="padding:0px 0px 0px 20px;width:35%;">
									<h4>账户</h4>
									<ul>
										<li><a href="account.html">个人信息</a></li>
										<li><a href="servlet/ViewCartInfo">购物信息</a></li>
										<li><a href="contact.html">浏览记录</a></li>
										<li><a href="#">注销</a></li>
									</ul>
								</div> -->
								<div class="clearfix"></div>
							</div>
						</div>
					</div>
				</div>
				<div class="clearfix"></div>
			</div>
		</div>
	</div>

	<!--start-pagelink-->
	<div class="pagelink">
		<input type="hidden" name="elements" value="${elements}">
		<input type="hidden" name="currentpage" value="${page}">
		<ul id="paging" class="pagination modal-2">
			<li>&lt; </li>
			<li> first </li>
			<li> #n</li>
			<li> #n</li>
			<li> #c</li>
			<li> #n</li>
			<li> #n</li>
			<li> #n</li>
			<li> #n</li>
			<li> last </li>
			<li> &gt;</li>
		</ul>
	</div>
	<div id="output"></div>
	<script type="text/javascript" src="js/jquery.paging.js"></script>
	<!--<script type="text/javascript" src="js/atest.js"></script>-->

    <script type="text/javascript">
        elements=parseInt($("input[name='elements']").val());	//总元素
        currentpage_str=$("input[name='currentpage']").val();	//当前page/初始page
        if(currentpage_str===""){
            currentpage=1;
        }else{
            currentpage=parseInt(currentpage_str);
        }

        var $li=$(".pagination").children("li");
        var masks = {};
        var format_buff="";
        $li.each(function(i) {
            if (0 === i) {
                masks.prev = this.innerHTML;
                format_buff += "<";
            } else if(1 === i) {
                masks.first = this.innerHTML;
                format_buff += "["
            } else if (i === $li.length - 2) {
                masks.last=this.innerHTML;
                format_buff += "]"
            } else if (i + 1 === $li.length) {
                masks.next = this.innerHTML;
                format_buff += ">";
            } else {
                masks[i-1] = this.innerHTML.replace(/#[nc]/, function(str) {
                    format_buff += str.replace("#", "");
                    return "([...])";
                });
            }
        });

        pages = 1 + Math.ceil((elements - 16) / (16 - 0));    //总页数
        $("#output").html("You are on page "+currentpage+"/"+pages);

        var pager=$("#paging").paging(elements,{
            perpage:16,
            page:currentpage,
            format:format_buff,

            //Set up onclick handler
            onClick:function(ev){
                ev.preventDefault();    //阻止元素发生默认的行为，比如表单的提交、URL的打开
                var cpage=$(this).data('page');

                //Call asynchronously,could be ajax,or whatever
                window.setTimeout(function(){   //500毫秒后......
                    pager.setPage(cpage);

                    var url=window.location.href;
                    var temp="";
                    if(url.indexOf("&sort")>-1){    //sort存在
                        temp=url.substring(url.indexOf("&sort"),url.length);
                    }
                    //去掉多余的&page
                    url=url.substring(0,url.indexOf("&page"));
                    url=url+"&page="+cpage+temp;
                    window.location.href=url;
                    //$("input[name='currentpage']").attr("value",page);		//刷新后当然page/初始page不变
                },500);
            },

            //Typical onFormat handler
            onFormat:function(type){
                var value = "";
                switch (type) {
                    case 'block':
                        value = masks[this["pos"]].replace("([...])", this["value"]);
                        //没有被激活
                        if (!this['active'])
                            return '<li><a href="#">' + value + '</a></li>';
                        //已经激活，但不是初始的current，需要跳转
                        if (this["page"] !== this["value"])
                            return '<li><a href="#' + this["value"] + '">' + value + '</a></li>';
                        //已经激活，初始的current
                        return '<li><a href="#" class="current">' + value + '</a></li>';
                    case 'next':
                        if (!this['active'])
                            return '<li><a href="#" class="next">' + masks[type] + '</a></li>';
                        return '<li><a href="#' + this["value"] + '" class="next">' + masks[type] + '</a></li>';
                    case 'prev':
                        if (!this['active'])
                            return '<li><a href="#" class="prev">' + masks[type] + '</a></li>';
                        return '<li><a href="#' + this["value"] + '" class="prev">' + masks[type] + '</a></li>';
                    case 'first':
                        if (!this['active'])
                            return '<li><a href="#" class="first">' + masks[type] + '</a></li>';
                        return '<li><a href="#' + this["value"] + '" class="first">' + masks[type] + '</a></li>';
                    case 'last':
                        if (!this['active'])
                            return '<li><a href="#" class="last">' + masks[type] + '</a></li>';
                        return '<li><a href="#' + this["value"] + '" class="last">' + masks[type] + '</a></li>';
                }
            }
        });
    </script>

	<!--end-pagelink-->
	<!--end-product-->

	<!--start-footer-->

	<!--end-footer-->

	<!--end-footer-text-->
	<div class="footer-text">
		<div class="container">
			<div class="footer-main">
				<p class="footer-class">
					Copyright &copy; 2018 <a href="https://github.com/AnRanbel/Java-Web"
						target="_blank" title="Wang Ying">Wang Ying</a> All Rights Reserved.
				</p>
			</div>
		</div>

		<script type="text/javascript">
			$(document).ready(function() {

				$().UItoTop({
					easingType : 'easeOutQuart'
				});

			});
		</script>
		<a href="#home" id="toTop" class="scroll" style="display: block;">
			<span id="toTopHover" style="opacity: 1;"> </span>
		</a>
	</div>
	<!--end-footer-text-->

	<!-- 确认清空购物车提示框 -->
	<script type="text/javascript">
		function clear_cart(){
			if(confirm("Clear all cart?")){
				return true;
			}else{
				return false;
			}
		}
	</script>

	<!-- 确认清空收藏夹提示框 -->
	<script type="text/javascript">
		function clear_favorites(){
			if(confirm("Clear all favorites?")){
				return true;
			}else{
				return false;
			}
		}
	</script>

</body>

</html>
