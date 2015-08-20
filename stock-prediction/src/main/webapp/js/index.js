var setPopWindowContent = function(params){
	$("#popWindowHeader").empty();
	$("#popWindowContent").empty();
	if(params){
		if(params["header"]){
			$("#popWindowHeader").append(params["header"]);
		}
		if(params["content"]){
 			$("#popWindowContent").append(params["content"]);
		}
		if(params["initFunc"]){
			params["initFunc"]($("#popWindowContent"));
		}
	}
};

var showPopWindow = function(){
	$("#mainContentContainer").css("overflow","hidden");
	$("#popWindowContainer").fadeIn(600);
	
	setPopWindow();
};

var setPopWindow = function(){
	var $popWindowContentContainer =$("#popWindowContentContainer");
	
	var marginTop = $popWindowContentContainer.height();
	marginTop = marginTop > $("body").height() ? $("body").height() / 2 : marginTop / 2;
	$popWindowContentContainer.css("marginLeft",-($popWindowContentContainer.width()/2));
	$popWindowContentContainer.css("marginTop",-marginTop);
};

var closePopWindow = function(){
	$("#mainContentContainer").css("overflow","auto");
	$("#popWindowContainer").fadeOut(600,function(){
		$("#popWindowHeader").empty();
		$("#popWindowContent").empty();
	});
	
};

var loadPage = function(action,resource){
	$.ajax({
		url:action,
		data:{"resourceID":resource},
		dataType:"html",
		type : "post",
		global : false,
		async : false,
		success:function(data){
			$("#changeContent").html(data);
		},
		error:function() {
			alert("加载页面失败！");
		}
	});
};

$("[vui-link]").click(function(e){
	var $el = $(e.target);
	var $parent = $el.parent().parent();
	$el.siblings().removeClass("subMenu-selected");
	$el.siblings().removeClass("menutest");
	$el.parent().removeAttr("style");
	$el.siblings().removeAttr("style");
	$el.removeAttr("style");
	$el.addClass("subMenu-selected");
	$el.siblings().children().hide("slow");
	if($parent.parent().parent()){
		var firtMenuName=$parent.parent().parent().text().split(" ")[0];
	}
	var secondMenuName =$parent.text().split(" ")[0];
	var thirdMenuName =$el.html();
	if($parent[0].tagName.toLowerCase() == "li"){
		$parent.siblings().removeClass("menu-selected");
		$parent.parent().parent().siblings().removeClass("menu-selected");
		if(($parent.parent().parent())[0].tagName.toLowerCase() == "li"){
			$parent.parent().parent().addClass("menu-selected");
		}else{
			$parent.addClass("menu-selected");
		}
		var thirdMenu=$parent.children().clone(true);
		$("#subMenuContent").html("");
		$("#subMenuContent").append(thirdMenu).children().children().children().hide();

		if($("#subMenu").css("display") == "none"){
			$("#subMenu").children().children().children().attr("vui-menu","");
			$("#subMenu").children().children().children().children().children().siblings().attr("vui-thirdmenu","");
			$("#subMenu").slideDown(600);
		}
		if(($parent.parent().parent())[0]&&($parent.parent().parent())[0].tagName.toLowerCase() == "li"){
			$("#navMenu").html("/&nbsp;&nbsp;"+firtMenuName);
			$("#navSubMenu").html("/&nbsp;&nbsp;"+secondMenuName);
			$("#navThirdMenu").html("/&nbsp;&nbsp;"+thirdMenuName);
		}else{
			if($el.attr("class").split(" ")[0]=="tMenu"){
				$("#navSubMenu").html("/&nbsp;&nbsp;"+secondMenuName );
				$("#navThirdMenu").html("/&nbsp;&nbsp;"+thirdMenuName);
			}else{
				$("#navThirdMenu").html("");
				$("#navMenu").html("/&nbsp;&nbsp;"+secondMenuName );
				$("#navSubMenu").html("/&nbsp;&nbsp;" + thirdMenuName);
			}
		}
	}
	if($el.attr("class").split(" ")[0]=="tMenu"){
		$("#navThirdMenu").html("/&nbsp;&nbsp;"+thirdMenuName);
	}else{
		$("#navSubMenu").html("/&nbsp;&nbsp;" +thirdMenuName);
		$("#navThirdMenu").html("");
	}
	loadPage($el.attr("vui-link"),$el.attr("vui-resource"));
});

$("[vui-menu]").click(function(e){
	var $el = $(e.target);
	var $parent=$el.parent().parent();
	if($parent.attr("id")=="subMenuContent"){
		if($el.children()){
			$el.parent().children().removeClass("subMenu-selected");
			$el.children().children().siblings().removeClass("subMenu-selected");
			$el.siblings().removeClass("menutest");
			$el.addClass("subMenu-selected");
			$el.removeClass("have-third-menu");
			$el.children().css("margin-left","-20px").css("background","#fff");
			$el.children().children().css("margin-left","20px");
			$el.children().toggle("slow");
			$el.siblings().children().hide("slow");
		}
	}
});

$("#subMenu").click(function(e){
	var $el = $(e.target);
	if($el.attr("class").split(" ")[0]=="tMenu"){
		$el.siblings().removeClass("subMenu-selected");
		$el.addClass("subMenu-selected");
		$("#navThirdMenu").html("/&nbsp;&nbsp;"+$el.html());
		loadPage($el.attr("vui-link"),$el.attr("vui-resource"));
	}
});

var vuiErrorMsg = function(msg){
	var message = "<label>"+msg+"</label>";
	setPopWindowContent({
		header:"提示信息",
		content:message
	});
	showPopWindow();
};

$("#logout").click(function(){
	if(confirm("是否退出？")){
		window.location.href = "logoutProcess.do";	
	}
});