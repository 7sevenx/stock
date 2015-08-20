// VUI vgrid version:0.1
// Author:Qiu Xiaojiang
// Date:2013-4-7
(function($,w) {
	
	$.extend({
		/**
		 * 输出信息到控制台，供开发者查看，便于debug
		 */
		vLog:function(ex){
			if(w.console && w.console.log)
				w.console.log("--VUI日志-- " + ex);
		},
		/**
		 * 统一的Ajax数据接口
		 * @param params
		 */
		vAjax:function(params){
			$.ajax({
				url:params.url,
				data:params.data,
				cache:params.cache || false,
				type:params.type || "POST",
				dataType:params.dataType || "json",
				async:params.async || true,
				success:function(data){
//					if(data.exception){
//						alert(data.exception);
//						return;
//					}
					var response = $('<html />').html(data);
					var $el = response.find("#mainContentContainer");
					if($el.html()){
						alert("登录超时，请重新登录");
						window.location.href = "firstLogin.do";
						return;
					}
					
					if(params.success && typeof params.success === "function")
						params.success(data);
				},
				error:function(jqXhr, textStatus, error){
					$.vLog("数据传输错误！状态码：" + jqXhr.status + ", 错误：" + textStatus + ", " + error);
					if(params.error && typeof params.error === "function")
						params.error(jqXhr, textStatus, error);
				}
			});
		},
		vFilter:function(s){
			s = new String(s);
			return s.replace(/<|>/g,function(a){
				if(a == "<")
					return "&lt;";
				
				return "&gt;";
			});
		},
		/**
		 * 时间格式化字符串
		 */
		vDateToString:function(dateObj){
			var jsDate;
			
			if(dateObj){
			
				if(typeof dateObj === "object"){
					jsDate = new Date(dateObj.time);
				}else{
					jsDate = new Date(dateObj);
				}
				
				return jsDate.getFullYear() + "-" + (jsDate.getMonth() + 1) + "-" + jsDate.getDate();
			}else{
				return "";
			}
		}
	});
	
	
	/**
	 * 获得用户功能权限
	 */
	
	var getUserFunctionPrivilege = (function(){  
		var cache = ""; 
		return {  
			functionPrivilege : function(){  
				if(cache!=""){//如果结果在缓存中  
					return cache;//直接返回缓存中的对象  
				}else{ $.ajax({
					url:"getUserFunctionPrivilege.json?resourceID=100126",
					async: false ,
					type:"post",
					dataType:"json",
					success:function(data){
						cache=data.result;
				}    
           });
				return cache;
           }
       }
    };  
})(); 
	
	/**
	 * 功能按钮是否有权限判断
	 */
	var checkFunctionPrivilege = function(resourceID){
		var privilege =getUserFunctionPrivilege.functionPrivilege();
		for(var i=0;i<privilege.length;i++){
			if($.trim(privilege[i])==resourceID){
				return true;
			}
		}
		return false;
	};
	
	/**
	 *非表格功能按钮权限控制 
	 */
	$.fn.controlFunctionPrivilege = function(){
		var buttons= this;
		if(buttons){
			for(var i = 0,len = buttons.length;i < len;i++){
				var $buttion =$(buttons[i]);
				var resourceID= $buttion.attr("resourceID");
				if(resourceID){
					if(!checkFunctionPrivilege(resourceID)){
						$buttion.remove();
					}
				};
			}
		}
	};
	
	/**
	 * 提示组件
	 */
	$.fn.vtips = function(options){
		var tips = typeof options === "string" ? options : (options["tips"] || "");
		
		var tipsHTML = {
			left:"<div class='vui-tips vui-tips-arrow-right'><span class='vui-tips-Content'>" + tips +"</span><div class='vui-tips-arrow'><span class='vui-tips-arrow-h9'></span><span class='vui-tips-arrow-h7'></span><span class='vui-tips-arrow-h7'></span><span class='vui-tips-arrow-h5'></span><span class='vui-tips-arrow-h5'></span><span class='vui-tips-arrow-h3'></span><span class='vui-tips-arrow-h3'></span><span class='vui-tips-arrow-h1'></span></div></div>",
			right:"<div class='vui-tips'><div class='vui-tips-arrow'><span class='vui-tips-arrow-h1'></span><span class='vui-tips-arrow-h3'></span><span class='vui-tips-arrow-h3'></span><span class='vui-tips-arrow-h5'></span><span class='vui-tips-arrow-h5'></span><span class='vui-tips-arrow-h7'></span><span class='vui-tips-arrow-h7'></span><span class='vui-tips-arrow-h9'></span></div><span class='vui-tips-Content'>" + tips +"</span></div>",
			top:"<div class='vui-tips vui-tips-arrow-topbottom'><span class='vui-tips-Content'>" + tips +"</span><div class='vui-tips-arrow-vertical'><span class='vui-tips-arrow-w9'></span><span class='vui-tips-arrow-w7'></span><span class='vui-tips-arrow-w7'></span><span class='vui-tips-arrow-w5'></span><span class='vui-tips-arrow-w5'></span><span class='vui-tips-arrow-w3'></span><span class='vui-tips-arrow-w3'></span><span class='vui-tips-arrow-w1'></span></div>",
			bottom:"<div class='vui-tips vui-tips-arrow-topbottom'><div class='vui-tips-arrow-vertical'><span class='vui-tips-arrow-w1'></span><span class='vui-tips-arrow-w3'></span><span class='vui-tips-arrow-w3'></span><span class='vui-tips-arrow-w5'></span><span class='vui-tips-arrow-w5'></span><span class='vui-tips-arrow-w7'></span><span class='vui-tips-arrow-w7'></span><span class='vui-tips-arrow-w9'></span></div><span class='vui-tips-Content'>" + tips +"</span></div>"
		};
		
		var settings = {
			mode:"hover",
			position:"top"
		};
		
		if(options){
			$.extend(settings,options);
		}
		
		var setPosition = function($preEl,$el){
			var marginLeft,marginTop;
		
			switch(settings.position){
				case "bottom":
					marginLeft = -$preEl.width();
					marginTop = $preEl.height() + 4;
					break;
				case "top":
					marginLeft = -$preEl.width();
					marginTop = -$preEl.height() - 10;
					break;
				case "right":
					marginLeft = 2;
					marginTop = "auto";
					break;
				case "left":
					marginLeft =  -$preEl.width() - $el.width() - 4;
					marginTop = "auto";
					break;
			}
			
			$el.css("marginLeft",marginLeft);
			$el.css("marginTop",marginTop);
		};
		
		switch(settings.mode){
			case "hover":
				this.hover(
					function(){
						$(this).next(".vui-tips").remove();
						$(this).after(tipsHTML[settings.position]);
						setPosition($(this),$(this).next(".vui-tips"));
					},
					function(){
						$(this).next(".vui-tips").remove();
					}
				);
				break;
			case "validate":
				$(this).next(".vui-tips").remove();
				this.after(tipsHTML[settings.position]);
				setPosition($(this),$(this).next(".vui-tips"));
			
				this.focus(
					function(){
						$(this).next(".vui-tips").remove();
					}
				);
				break;
		}
	};
	
	/**
	 * 表单验证设置
	 */
	var groups={};
	var messages={};
	$.extend({
		vValidateSetting:{
			addGroups:function(obj){
				$.extend(groups,obj);
			},
			getGroup:function(name){
				return groups[name];
			},
			addMessages:function(obj){
				$.extend(messages,obj);
			},
			getMessage:function(name){
				return messages[name];
			}
		},
		parseStringToObject:function (s){
			var arr = s.split(",");
			var obj = {};
			var i = arr.length;
			while(i){
				var property = arr[--i].split(":");
				obj[property[0]] = property[1];
			}
			return obj;
		},
		isEmptyObject:function(obj){
			for(var p in obj){
				if(obj.hasOwnProperty(p))
					return false;
			}
			
			return true;
		}
	});
	
	/**
	 * 表单验证
	 */
	$.fn.vvalidate = function(options){
		var settings = {
			mode:"blur",
			position:"bottom"
		};
		
		if(options){
			$.extend(settings,options);
		}
		
		var $container = this;
		var inputs = $container.find("[vui-name]");
		
		var getRules = function($input){
			var groupName = $input.attr("vui-validate-group");
			var validates = $input.attr("vui-validate");
			var rules = {};
			
			if(groupName)
				$.extend(rules,$.vValidateSetting.getGroup(groupName));
				
			if(validates)
				$.extend(rules,$.parseStringToObject(validates));
			
			return rules;
		};
		
		var check = function($input){	
			var rules = getRules($input);
			var val = $input.val();
			var len = val.length;
			
			if("required" in rules){
				if(rules["required"] && rules["required"] != "false" && !$.trim(val))
					return $.vValidateSetting.getMessage("required");
				else if(!$.trim(val)){
					return;
				}
					
			}else if(!$.trim(val)){
				return;
			}
			
			if("eq" in rules){
				var eqElement = $container.find("[vui-name='" + rules["eq"] + "']");
				if(eqElement && val != eqElement.val()){
					var tips="";
					if($container.find("label[for='" + rules["eq"] + "']").html())
						tips= $container.find("label[for='" + rules["eq"] + "']").html().replace(/:|：/,"");
					return $.vValidateSetting.getMessage("eq").replace(/#1/,tips);
				}
			}
			
			if("reg" in rules){
				var reg = new RegExp(rules["reg"]);
				if(!reg.test(val))
					return $.vValidateSetting.getMessage("reg");
			}
			
			if("type" in rules){
				switch(rules["type"]){
					case "number":
						if(!/^([+-]?)\d*\.?\d+$/.test(val))
							return $.vValidateSetting.getMessage("number");
						if("gt" in rules || "ge" in rules || "lt" in rules || "le" in rules){
							var gt = parseInt(rules["gt"]);
							var ge = parseInt(rules["ge"]);
							var lt = parseInt(rules["lt"]);
							var le = parseInt(rules["le"]);
							var num = parseInt(val);
							
							if(gt && ge){
								$.vLog("表单验证配置错误：同时配置了gt 以及 ge！");
							}else if(lt && le){
								$.vLog("表单验证配置错误：同时配置了lt 以及 le！");
							}else if(ge && (ge >= lt || ge >= le)){
								$.vLog("表单验证配置错误：数值范围不合理！");
							}else if(gt && (gt >=lt || gt >= le)){
								$.vLog("表单验证配置错误：数值范围不合理！");
							}else{
								if(ge && num < ge)
									return $.vValidateSetting.getMessage("ge").replace(/#1/,ge);
								if(gt && num <= gt)
									return $.vValidateSetting.getMessage("gt").replace(/#1/,gt);
								if(le && num > le)
									return $.vValidateSetting.getMessage("le").replace(/#1/,le);
								if(lt && num >= lt)
									return $.vValidateSetting.getMessage("lt").replace(/#1/,lt);
							}
						}
						break;
					case "digitNumber":
						if(!/^[a-zA-Z][a-zA-Z0-9_]*$/.test(val))
							return  $.vValidateSetting.getMessage("digitNumber");
						break;
					case "digit":
						if(!/^-?[1-9]\d*$/.test(val))
							return $.vValidateSetting.getMessage("digit");
						break;
					case "alpha":
						if(!/^[A-Za-z]+$/.test(val))
							return $.vValidateSetting.getMessage("alpha");
						break;
					case "ip":
						if(!/^(([1-9]|([1-9]\d)|(1\d\d)|(2([0-4]\d|5[0-5])))\.)(([1-9]|([1-9]\d)|(1\d\d)|(2([0-4]\d|5[0-5])))\.){2}([1-9]|([1-9]\d)|(1\d\d)|(2([0-4]\d|5[0-5])))$/.test(val))
							return $.vValidateSetting.getMessage("ip");
						break;
					case "notChinese":
						if(/[\u4e00-\u9fa5]/.test(val))
							return $.vValidateSetting.getMessage("notChinese");
						break;
					case "email":
						if(!/\w+((-w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z0-9]+/.test(val))
							return $.vValidateSetting.getMessage("email");
						break;
					case "url":
						if(!/[a-zA-z]+:\/\/[^\s]+\.[A-Za-z0-9]/.test(val))
							return $.vValidateSetting.getMessage("url");
						break;
					case "normal":
					default:
						break;
				}
			}
			
			if("len" in rules){
				if(len != rules["len"])
					return $.vValidateSetting.getMessage("len").replace(/#1/,rules["len"]);
			}else if("maxlen" in rules || "minlen" in rules){
				var maxLen = parseInt(rules["maxlen"]);
				var minLen = parseInt(rules["minlen"]);

				if(maxLen && minLen && maxLen <= minLen){
					$.vLog("表单验证配置错误：最大长度maxlen 小于或者等于最小长度minlen！");
				}else{
					if(maxLen && len > maxLen)
						return $.vValidateSetting.getMessage("maxlen").replace(/#1/,maxLen);
						
					if(minLen && len < minLen)
						return $.vValidateSetting.getMessage("minlen").replace(/#1/,minLen);
				}
			}
			
			if("action" in rules){
				var param = {};
				param[$input.attr("vui-name")] = val;
				var result = false;
				$.ajax({
					url:rules["action"],
					data:param,
					type:"post",
					async: false,
					dataType:"json",
					success:function(data){
						if(data.result)
							data = data.result;
						
						if(data && data != "false")
							result = data;
							
					}
				});
				
				return result;
			}
			
			return false;
		};
		
		var submitCheck = function(){
			var result = true;
			
			for(var i = 0,len = inputs.length; i < len; i++){
				var $input = $(inputs[i]);			
				if(!$.isEmptyObject(getRules($input))){
					var result = check($input);
										
					if(result){
						$input.vtips({mode:"validate",position:settings.position,tips:result});
						$input.attr("vui-validate-status","false");
						result = false;
					}else{
						$input.removeAttr("vui-validate-status");
					}
				}
			}
			
			return result;
		};
		
		for(var i = 0,len = inputs.length; i < len; i++){
			var $input = $(inputs[i]);			
			if(!$.isEmptyObject(getRules($input))){
				$input.on(settings.mode,function(){
					var result = check($(this));
										
					if(result){
						$(this).vtips({mode:"validate",position:settings.position,tips:result});
						$(this).attr("vui-validate-status","false");
					}else{
						$(this).removeAttr("vui-validate-status");
					}
				});
			}
		}
		
		$container.on("validate",function(){
			submitCheck();
		});
	};
	
	/**
	 * 获取表单验证状态
	 */
	$.fn.vgetValidateStatus = function(){
		this.trigger("validate");
		
		var inputs = this.find("[vui-validate-status]");
	
		for(var i = 0, len = inputs.length; i < len; i++){
			var $input = $(inputs[i]);
			if($input.attr("vui-validate-status") == "false")
				return false;
		}
		return true;
	};
	
	/**
	 * 数据表格
	 */
	$.fn.vgrid = function(options){
		//判断是否有配置参数
		if(!options){
			$.vLog("没有配置参数 [options]!");
			return;
		}
		
		//判断参数是否含有 “url”
		if(!options["url"]){
			$.vLog("没有配置参数 [url]!");
			return;
		}
		
		//判断参数是否含有 字段配置
		if(!options["colModel"]){
			$.vLog("没有配置参数 [colModel]!");
			return;
		}
		
		/**
		 * 整合默认配置以及自定义配置
		 */
		var settings = $.extend({
			cachePage:10,
			rowsPerPage:10,
			selectable:true,
			align:"center",
			dataRoot:false,
			resourceID:""
		}, options),
		
		$container = this,//数据表格容器
		$searchContainer,//搜索区容器
		tableData = {},//缓存数据
		searchParam = {},//搜索条件
		optionsData = {},//下拉列表数据
		optionsHTML = {},//下拉列表HTML
		customFunctions = {},
		curEditingRowIndex,//当前修改行索引
		tableHTML,contentHTML,footerHTML,pagerHTML;//分别为：表格结构HTML、表格内容HTML、表尾HTML、分页控制HTML

		/**
		 * 分页信息对象，用于保存、控制分页信息
		 */
		var pager = {
			pageCount:1,//总页数
			curPage:1,//当前页
			rowsPerPage:10,//每页行数
			cachePage:10,//缓存页数
			dataCount:0,//数据总行数
			
			/**
			 * 初始化分页信息
			 */
			init:function(dataCount){
				if(!dataCount){
					$.vLog("分页信息初始化错误! 没有数据条数 [dataCount]!");
					return;
				}
				this.curPage = 1;		
				this.cachePage = settings.cachePage;
				this.rowsPerPage = settings.rowsPerPage;
				this.dataCount = dataCount;
				this.pageCount = this.dataCount % this.rowsPerPage == 0 ? (this.dataCount / this.rowsPerPage) : (parseInt(this.dataCount / this.rowsPerPage) + 1);
				
				if(this.cachePage == "all"){
					this.cachePage = this.pageCount;
				}else if(!settings.cachePage || settings.cachePage == "false"){
					this.cachePage = 1;
				}	
					
				$.vLog("分页信息初始化 - 总页数:" + this.pageCount + "  当前页:" + this.curPage + "  每页行数:" + this.rowsPerPage + "  数据总行数:" + this.dataCount);
			},
			/**
			 * 获取当前页数据的开始行
			 */
			getBegin:function(){
				return (this.curPage - 1) * this.rowsPerPage % (this.rowsPerPage * this.cachePage);
			},
			/**
			 * 获取当前页数据的结束行
			 */
			getEnd:function(){
				if(this.curPage == this.pageCount && this.dataCount % this.rowsPerPage != 0){
					return (this.dataCount % this.rowsPerPage + (this.curPage - 1) * this.rowsPerPage) % (this.rowsPerPage * this.cachePage);
				}
				
				var end = this.curPage * this.rowsPerPage  % (this.rowsPerPage * this.cachePage);
				
				if(end == 0 && this.getBegin() >= 0)
					end = this.getBegin() + this.rowsPerPage;

				return end;
			},
			/**
			 * 获取数据的索引
			 */
			getDataIndex:function(){
				return parseInt((this.curPage-1) * this.rowsPerPage / (this.rowsPerPage * this.cachePage)) * (this.rowsPerPage * this.cachePage) + 1;
			},
			/**
			 * 获取上一单位的数据的索引
			 */
			getPrevDataIndex:function(){
				return this.getDataIndex() - this.rowsPerPage * this.cachePage;
			},
			/**
			 * 获取下一单位的数据的索引
			 */
			getNextDataIndex:function(){
				return this.getDataIndex() + this.rowsPerPage * this.cachePage;
			},
			/**
			 * 获得一个单位的数据的结束行
			 */
			getEndIndex:function(start){
				var end = start + this.rowsPerPage * this.cachePage - 1;
				return end > this.dataCount ? this.dataCount : end;
			},
			/**
			 * 上一页
			 * @returns {Boolean}
			 */
			prev:function(){
				if(this.curPage == 1)
					return false;
					
				this.curPage--;
				return true;
			},
			/**
			 * 下一页
			 * @returns {Boolean}
			 */
			next:function(){
				if(this.curPage == this.pageCount)
					return false;
					
				this.curPage++;
				return true;
			},
			/**
			 * 第一页
			 * @returns {Boolean}
			 */
			first:function(){
				if(this.curPage == 1)
					return false;
				
				this.curPage = 1;
				return true;
			},
			/**
			 * 最后一页
			 * @returns {Boolean}
			 */ 
			last:function(){
				if(this.curPage == this.pageCount)
					return false;
				
				this.curPage = this.pageCount;
				return true;
			},
			/**
			 * 选择某页
			 * @returns {Boolean}
			 */
			set:function(pageNum){
				if(this.curPage == pageNum || pageNum > this.pageCount)
					return false;
					
				this.curPage = pageNum;
				return true;
			},
			/**
			 * 是否需要获取上一单位的数据
			 * @returns {Boolean}
			 */
			needToGetPrevData:function(){
				if(this.cachePage == "all")
					return false;
				
				if((this.curPage - this.cachePage) < 0)
					return false;
				
				var rate = (this.curPage % this.cachePage) / this.cachePage;
				
				if(rate <= 0.2 && rate != 0)
					return true;
				
				return false;
			},
			/**
			 * 是否需要获取下一单位的数据
			 * @returns {Boolean}
			 */
			needToGetNextData:function(){
				if(this.cachePage == "all")
					return false;
				
				if((this.pageCount - this.curPage) <= this.cachePage * 0.2)
					return false;
				
				var rate = (this.curPage % this.cachePage) / this.cachePage;
				
				if(rate >= 0.8)
					return true;
				
				return false;
			}
		};
		
		/**
		 * 表格前是否有控制按钮
		 */
		var hasFrontController = function(){
			if(settings.controller && settings.controller.front){
				var front = settings.controller.front;
				for(var f = 0,fLen = front.length;f < fLen;f++){
					if(settings.functions[front[f]])
						return true;
				}
			}
			return false;
		};
		
		/**
		 * 表格后是否有控制按钮
		 */
		var hasEndController = function(){
			if(settings.controller && settings.controller.end){
				var end = settings.controller.end;
				for(var e = 0,eLen = end.length;e < eLen;e++){
					if(settings.functions[end[e]])
						return true;
				}
			}
			return false;
		};
		
		/**
		 * 表格底部是否有控制按钮
		 */
		var hasBottomController = function(){
			if(settings.controller && settings.controller.bottom){
				var bottom = settings.controller.bottom;
				for(var b = 0,bLen = bottom.length;b < bLen;b++){
					if(settings.functions[bottom[b]])
						return true;
				}
			}
			return false;
		};
		
		/**
		 * 根据值获取名值对应的选项的名称
		 */
		var getNameFromOptions = function(data, value){
			if(!optionsData[data]){
				optionsData[data] = "getting data";
				setTimeout(function(){getOptionsData(data,changeContent);},0);
				return false;
			}else{
				var dataArray = optionsData[data];
				for(var i = 0,len = dataArray.length;i < len;i++){
					if(dataArray[i].value == value)
						return dataArray[i].name;
				}
			}
		};
		
		/**
		 * 生成表格
		 */
		var renderTable = function(){
			var colModel = settings.colModel;
			tableHTML = "";
			
			
			if(settings.caption){
				tableHTML += "<div class='headerFont grayHead head-b'>" + settings.caption + "</div>";
			}else{
				tableHTML += "<div class='headerFont grayHead head-b'>&nbsp;</div>";
			}
			
			tableHTML += "<div class='vui-vgrid-table-body'><table cellspacing='0'>";
			
			tableHTML += "<thead><tr>";
			
			if(settings.selectable){
				tableHTML += "<th><input type='checkbox' vui-control='selectall' /></th>";
			}
			
			if(hasFrontController())
				tableHTML += "<th>操作</th>";
			
			for(var i = 0,len = colModel.length; i < len; i++){
				if(!colModel[i].hidden)
					tableHTML += "<th>" + colModel[i].label + "</th>";
			}
			
			if(hasEndController())
				tableHTML += "<th>操作</th>";
			
			tableHTML += "</tr></thead>";
			
			tableHTML += "<tbody></tbody>";
			
			tableHTML += "</table></div>";
			
			tableHTML += "<div class='vui-loading-img'></div><div class='vui-nodata'>无数据！</div>";
			
			$container.append(tableHTML);
		};
		
		/**
		 * 生成表尾
		 */
		var renderFooter = function(){
			footerHTML = "";
			if(!settings.disableFooter){
				footerHTML += "<div class='vui-vgrid-footer'>";
				
				if(hasBottomController()){
					var bottom = settings.controller.bottom;
					
					footerHTML += "<div class='vui-vgrid-footerController'>";
					
					for(var b = 0,bLen = bottom.length;b < bLen;b++){
						var resourceID=settings.functions[bottom[b]].resourceID;
						if(settings.functions[bottom[b]])
							if(checkFunctionPrivilege(resourceID)){
								footerHTML += "&nbsp;<span vui-control='" + bottom[b] + "'>" + settings.functions[bottom[b]].label + "</span>&nbsp;";
							}else{
								footerHTML += "";
							}
						}
					
					footerHTML += "</div>";
				}
				
				footerHTML += "<div class='vui-vgrid-pager'></div>";
				
				footerHTML += "<div class='vui-vgrid-total'></div>";
				
				footerHTML += "</div>";
			}
			
			footerHTML += "<div class='grayFooter head-s'></div>";
			
			$container.append(footerHTML);
		};
		
		var renderTotal = function(){
			$container.find(".vui-vgrid-total").html("共 " + pager.pageCount + " 页 " + pager.dataCount + " 条数据");
		};
		
		/**
		 * 绑定表尾控制按钮事件
		 */
		var bindFooterEvent = function(){
			if(settings.controller && settings.controller.bottom){
				var bottom = settings.controller.bottom;
				for(var i = 0,len = bottom.length;i < len;i++){
					switch(bottom[i]){
						case "create":
							$(".vui-vgrid-footer").find("[vui-control=create]").click(initCreateForm);
							break;
						case "read":
							$(".vui-vgrid-footer").find("[vui-control=read]").click(initReadForm);
							break;
						case "update":
							$(".vui-vgrid-footer").find("[vui-control=update]").click(initUpdateForm);
							break;
						case "delete":
							$(".vui-vgrid-footer").find("[vui-control=delete]").click(deleteRows);
							break;
						default:
							$(".vui-vgrid-footer").find("[vui-control=" + bottom[i] + "]").click(generateEventFunction(settings.functions[bottom[i]]));
							break;
					}
				}
			}
		};
		
		/**
		 * 解析使用点选法（object.property）配置的字段
		 */
		var getValueOfProperty = function(data,property,type){
			var propertyArray = property.split(".");

			if(type && type == "root" && propertyArray.length > 1){
				for(var p = 1,pLen = propertyArray.length;p < pLen;p++){
					data = data[propertyArray[p]];
				}
			}else{
				for(var p = 0,pLen = propertyArray.length;p < pLen;p++){
					data = data[propertyArray[p]];
				}
			}
			
			return data;
		};
		
		var renderFrontEndController = function(position,curData){
			var front = settings.controller[position];
			var contentHTML = "<td>";
			
			for(var f = 0,fLen = front.length;f < fLen;f++){
				var resourceID=settings.functions[front[f]].resourceID;
				var func = settings.functions[front[f]];
				if(func){
					if(func.statusRule){
						if(func.statusRule.apply(curData)){
							if(checkFunctionPrivilege(resourceID)){
								contentHTML += "&nbsp;<span vui-control='" + front[f] + "'>" + settings.functions[front[f]].label + "</span>&nbsp;";
							}else{
								contentHTML += " ";
							}
						}
						continue;
					}
					if(checkFunctionPrivilege(resourceID)){
						contentHTML += "&nbsp;<span vui-control='" + front[f] + "'>" + settings.functions[front[f]].label + "</span>&nbsp;";
					}else{
						contentHTML += " ";
					}
				}
			}
			
			contentHTML += "</td>";
			return contentHTML;
		};
		
		var getDeleteDisable = function(curData){
			var func = settings.functions["delete"];
			if(func){
				if(func.statusRule){
					if(func.statusRule.apply(curData)){
						return "";
					}
					return "disabled";
				}
				return "";
			}
		};
		
		/**
		 * 生成表格内容
		 */
		var renderContent = function(){
			var colModel = settings.colModel;
			
			var index = pager.getDataIndex();
			$.vLog("当前缓存数据索引 [tableData index]:" + index);
			var curData;
			
			if(tableData[index]){
				curData = tableData[index];
			}
			else{
				showLoading();
				//getSomeData(index);
				getDataCount(pager.curPage);
				return;
			}
			
			contentHTML = "";
			
			$.vLog("当前显示数据范围: 从 " + pager.getBegin() + " 至 " + (pager.getEnd() - 1));

			for(var i = pager.getBegin(),len = pager.getEnd(); i < len; i++){
				if(i % 2 != 0){
					contentHTML += "<tr>";
				}else{
					contentHTML += "<tr class='oddRow'>";
				}
				
				if(settings.selectable){
					contentHTML += "<td><input vui-control='select' type='checkbox' value='" + i + "' "+getDeleteDisable(curData[i])+" /></td>";
				}
				contentHTML += "<input type='hidden' vui-control='dataIndex' value='" + i + "' />";
				
				if(hasFrontController()){
					contentHTML += renderFrontEndController("front",curData[i]);
				}
				
				for(var j = 0,colLen = colModel.length; j < colLen; j++){
					if(!colModel[j].hidden){
						var curCell = curData[i];
	
						curCell = getValueOfProperty(curCell,colModel[j].name);
						
						if(curCell && colModel[j].type && colModel[j].type.toLowerCase() == "date"){
							curCell = $.vDateToString(curCell);
						}
						
						if(!curCell && curCell != 0)
							curCell = "&nbsp;";
						
						if(colModel[j].data){
							curCell = getNameFromOptions(colModel[j].data, curCell) || curCell;
						}
						
						var align = colModel[j].align || settings.align;
						if(curCell.length>20){
							curCell=curCell.substring(0, 15)+"...";
						}
						contentHTML += "<td style='text-align:" + align + "'>" + $.vFilter(curCell) + "</td>";
					}
				}
				
				if(hasEndController()){
					contentHTML += renderFrontEndController("end",curData[i]);
				}
				
				contentHTML += "</tr>";
			}
		};
		
		/**
		 * 生成分页控制按钮
		 */
		var renderPager = function(){
			if(!settings.disablePager){
				pagerHTML = "<button vui-control='first'>首页</button>&nbsp;&nbsp;<button vui-control='prev'>上一页</button>&nbsp;&nbsp;";
				
				pagerHTML += "<select vui-control='pageselect'>";
				
				for(var i = 1,len = pager.pageCount; i <= len; i++){
					pagerHTML += "<option value='" + i + "'>第 " + i + " 页</option>";
				}
				
				pagerHTML += "</select>";
				
				pagerHTML += "&nbsp;&nbsp;<button vui-control='next'>下一页</button>&nbsp;&nbsp;<button vui-control='last'>最后一页</button>";
				
				$container.find(".vui-vgrid-pager").html(pagerHTML);
				renderTotal();
			}
		};
		
		/**
		 * 关闭“加载中”
		 */
		var closeLoading = function(){
			$container.find(".vui-loading-img").css("display","none");
		};
		
		/**
		 * 显示“加载中”
		 */
		var showLoading = function(){
			$container.find(".vui-loading-img").css("display","block");
		};
		
		var showNodata = function(){
			$container.find(".vui-vgrid-total").html("");
			pager.dataCount = 0;

			$container.find("tbody").html("");
			$container.find(".vui-vgrid-pager").css("display","none");
			$container.find(".vui-nodata").css("display","block");
			closeLoading();
		};
		
		var closeNodata = function(){
			$container.find(".vui-nodata").css("display","none");
			$container.find(".vui-vgrid-pager").css("display","block");
		};
		
		/**
		 * 改变表格内容
		 */
		var changeContent = function(){
			renderContent();
			$container.find("tbody").html(contentHTML);
			bindInRowControlEvent();
		};
		
		/**
		 * 上一页动作
		 */
		var prevPage = function(){
			if(pager.prev()){
				if(!settings.cachePage || settings.cachePage == "false"){
					getData();
				}else{
					changeContent();
					setSelectPageAndSelectAll();
					
					if(pager.needToGetPrevData()){
						var prevIndex = pager.getPrevDataIndex();
						if(!tableData[prevIndex])
							getSomeData(prevIndex);
					}
				}
			}
		};
		
		/**
		 * 下一页动作
		 */
		var nextPage = function(){
			if(pager.next()){
				if(!settings.cachePage || settings.cachePage == "false"){
					getData();
				}else{
					changeContent();
					setSelectPageAndSelectAll();
					
					if(pager.needToGetNextData()){
						var nextIndex = pager.getNextDataIndex();
						if(!tableData[nextIndex])
							getSomeData(nextIndex);
					}
				}
			}
		};
		
		/**
		 * 首页动作
		 */
		var firstPage = function(){
			if(pager.first()){
				if(!settings.cachePage || settings.cachePage == "false"){
					getData();
				}else{
					changeContent();
					setSelectPageAndSelectAll();
				}
			}
		};
		
		/**
		 * 最后一页动作
		 */
		var lastPage = function(){
			if(pager.last()){
				if(!settings.cachePage || settings.cachePage == "false"){
					getData();
				}else{
					changeContent();
					setSelectPageAndSelectAll();
				}
			}		
		};
		
		/**
		 * 选择某页动作
		 */
		var selectPage = function(){
			var pageNumber = $container.find("[vui-control=pageselect]").val();
			
			if(pager.set(pageNumber)){
				if(!settings.cachePage || settings.cachePage == "false"){
					getData();
				}else{
					changeContent();
					setSelectPageAndSelectAll();
				}
			}
		};
		
		/**
		 * 重置选择页以及全选框
		 */
		var setSelectPageAndSelectAll= function(){
			$container.find("[vui-control=pageselect]").val(pager.curPage);
			if($container.find("[vui-control=selectall]").length > 0)
				$container.find("[vui-control=selectall]")[0].checked = false;
		};
		
		/**
		 * 全选
		 */
		var selectAll = function(){
			var checked = $container.find("[vui-control=selectall]")[0].checked;

			var checkboxs = $container.find("[vui-control=select]");
			
			for(var i = 0,len = checkboxs.length;i < len;i++){
				if(!checkboxs[i]["disabled"])
					checkboxs[i].checked = checked;
			}
		};
		
		/**
		 * 绑定分页控制按钮事件
		 */
		var bindPagerEvent = function(){
			$container.find("[vui-control=selectall]").click(selectAll);
			$container.find("[vui-control=prev]").click(prevPage);
			$container.find("[vui-control=next]").click(nextPage);
			$container.find("[vui-control=first]").click(firstPage);
			$container.find("[vui-control=last]").click(lastPage);
			$container.find("[vui-control=pageselect]").change(selectPage);
		};
		
		var getSelectedIndex = function(el){
			var dataIndex = $(el).parent().parent().find("[vui-control=dataIndex]").val();

			if(!dataIndex){
				dataIndex = $container.find("tbody [vui-control=select]:checked");

				if(dataIndex.length > 1){
					alert("请勿选择多项！");
					return false;
				}
				
				if(dataIndex.length < 1){
					alert("请选择一项！");
					return false;
				}
				
				dataIndex = dataIndex.val();
			}
			
			return dataIndex;
		};
		
		/**
		 * 初始化新建表单
		 */
		var initCreateForm = function(){
			if($(".vui-vgrid-inputForm")){
				var $inputForm = $("#popWindowContent");
				setPopWindowContent({
					header:settings.functions.create.label,
					content:$(".vui-vgrid-inputForm").clone(true).css("display","block")
				});
				
				var inputs = $inputForm.find("[vui-name]");
				
				for(var i = 0,len = inputs.length;i < len;i++){
					$input = $(inputs[i]);
					$input.val("");

					if($input.attr("vui-createable") == "false")
						$input.parent().parent().css("display","none");
				}
				
				$inputForm.find("[vui-control=submit]").addClass("btn primary").click(createRow);
				$inputForm.find("[vui-control=cancel]").addClass("btn cancel").click(closePopWindow);
				
				if(settings.formInitFunc && typeof settings.formInitFunc === "function")
					settings.formInitFunc();
				
				$inputForm.vvalidate();
				
				showPopWindow();
				
			}else{
				$.vLog("输入表单没有配置!");
			}
		};
		
		/**
		 * 初始化查看表单
		 */
		var initReadForm = function(e){
			var dataIndex = getSelectedIndex(e.target);
			
			if(!dataIndex)
				return;
			
			var curData = tableData[pager.getDataIndex()][dataIndex];
			
			var readParams = {resourceID:settings.functions.read.resourceID || ""};
			var tempParams = settings.functions.read.param;
			
			for(var i = 0,len = tempParams.length;i < len;i++){
				readParams[tempParams[i]] = curData[tempParams[i]];
			}
			
			$.vAjax({
				url:settings.functions.read.url,
				data:readParams,
				success:function(data){
					if(data){
						curData = data;
						
						if($(".vui-vgrid-inputForm")){
						
							var $inputForm = $("#popWindowContent");
							setPopWindowContent({
								header:settings.functions.read.label,
								content:$(".vui-vgrid-inputForm").clone(true).css("display","block")
							});
							
							var inputs = $inputForm.find("[vui-name]");
							
							for(var i = 0,len = inputs.length;i < len;i++){
								var $input = $(inputs[i]);
								
								if($input.attr("vui-readable") == "false"){
									$input.parent().parent().css("display","none");
								}else{
									var originValue = getValueOfProperty(curData,$input.attr("vui-name"));
									
									if(originValue === "" || originValue === null||!originValue)
										originValue = "&nbsp;";
									
									if(originValue && $input.attr("vui-type") && $input.attr("vui-type").toLowerCase() == "date"){
										originValue = $.vDateToString(originValue);
									}
									if($input.attr("vui-data")){										
										originValue = getNameFromOptions($input.attr("vui-data"), originValue) || "&nbsp;";
									}
									if($input.attr("vui-data-else")){
										if(originValue==null){
											originValue = getNameFromOptions($input.attr("vui-data-else"), originValue) || "&nbsp;";
										}
									}
									if(originValue.length>40){
										$input.after("<div class='remark-input'><span class='remark-input'>" + originValue + "</span></div>").css("display","none");
									}else{
										$input.after("<span>" + originValue + "</span>").css("display","none");
									}
								}
							}
							
							$inputForm.find("[vui-control=submit]").css("display","none");
							$inputForm.find("[vui-control=cancel]").addClass("btn cancel").click(closePopWindow);
							
							showPopWindow();
						}else{
							$.vLog("输入表单没有配置!");
						}
					}
				}
			});
		};
		
		/**
		 * 初始化修改表单
		 */
		var initUpdateForm = function(e){
			var dataIndex = getSelectedIndex(e.target);
			
			if(!dataIndex)
				return;
			
			curEditingRowIndex = dataIndex;
			var curData = tableData[pager.getDataIndex()][dataIndex];
			
			var readParams = {resourceID:settings.functions.read.resourceID || ""};
			var tempParams = settings.functions.update.param;
			
			for(var i = 0,len = tempParams.length;i < len;i++){
				readParams[tempParams[i]] = curData[tempParams[i]];
			}

			$.vAjax({
				url:settings.functions.read.url,
				data:readParams,
				success:function(data){
					if(data){
						curData = data;
						
						if($(".vui-vgrid-inputForm")){
							
							var $inputForm = $("#popWindowContent");
							setPopWindowContent({
								header:settings.functions.update.label,
								content:$(".vui-vgrid-inputForm").clone(true).css("display","block")
							});
							
							var inputs = $inputForm.find("[vui-name]");
							
							for(var i = 0,len = inputs.length;i < len;i++){
								var $input = $(inputs[i]);
								
								var originValue = getValueOfProperty(curData,$input.attr("vui-name"));
								
								if(originValue && $input.attr("vui-type") && $input.attr("vui-type").toLowerCase() == "date"){
									originValue = $.vDateToString(originValue);
								}
								
								$input.val(originValue);
								
								if($input[0].tagName.toLowerCase() == "select"){
									if($input.attr("vui-editable") == "display"){
										$input.parent().parent().find("#required").before().removeClass("bishu");
										$input.after("<span>" + originValue + "</span>").css("display","none");
									}else{
										$input.attr("vui-select-value", originValue);
									}
								}
								
								
								if($input.attr("vui-editable") == "hidden"){
									$input.parent().parent().css("display","none");
								}else if($input.attr("vui-editable") == "display"){
									$input.prop({
										disabled: true
									});
									$input.removeAttr("vui-validate");
									$input.removeAttr("vui-validate-group");
									$input.parent().parent().find("#required").before().removeClass("bishu");
								}else if($input.attr("vui-editable") == "disable"){
									$input.parent().parent().find("#required").before().removeClass("bishu");
									if(originValue.length>40){
										$input.after("<div class='remark-input'><span class='remark-input'>" + originValue + "</span></div>").css("display","none");
									}else{
										$input.after("<span>" + originValue + "</span>").css("display","none");
									}
								}
							}
							
							$inputForm.find("[vui-control=submit]").addClass("btn primary").click(updateRow);
							$inputForm.find("[vui-control=cancel]").addClass("btn cancel").click(closePopWindow);
							
							if(settings.formInitFunc && typeof settings.formInitFunc === "function")
								settings.formInitFunc();
							
							$inputForm.vvalidate();
							
							showPopWindow();
							
						}else{
							$.vLog("输入表单没有配置!");
						}
					}
				}
			});
		};
		
		/**
		 * 新建行
		 */
		var createRow = function(){
			var createParams = {resourceID:settings.functions.create.resourceID || ""};
			
			var $inputForm = $("#popWindowContent");
			
			if($inputForm.vgetValidateStatus()){
				if($inputForm){				
					var inputs = $inputForm.find("[vui-name]");
					
					for(var i = 0,len = inputs.length;i < len;i++){
						var $input = $(inputs[i]);
						if(!$input.attr("vui-createable") || ($input.attr("vui-createable") && $input.attr("vui-createable") != "false")){
							createParams[$input.attr("vui-name")] = $.vFilter($input.val());
						}
					}
				}else{
					$.vLog("输入表单没有配置!");
				}
			
				$.vAjax({
					url:settings.functions["create"].url,
					data:createParams,
					success:function(data){
						if(data.errorMsg){
							alert(data.errorMsg);
						}else{
							if(data.result){
								alert("保存成功！");
								closePopWindow();
								getData();
							}else{
								alert("保存失败！");
							}
						}
					},
					error:function(jqXhr, textStatus, error){
						alert("保存失败！");
					}
				});
			}
		};
		
		/**
		 * 修改行
		 */
		var updateRow = function(){
			var updateParams = {resourceID:settings.functions.update.resourceID || ""};
			
			var curData = tableData[pager.getDataIndex()][curEditingRowIndex];

			var tempParams = settings.functions.update.param;
			
			for(var i = 0,len = tempParams.length;i < len;i++){
				updateParams[tempParams[i]] = curData[tempParams[i]];
			}
			
			var $inputForm = $("#popWindowContent");
			
			if($inputForm.vgetValidateStatus()){
				if($inputForm){				
					var inputs = $inputForm.find("[vui-name]");
					
					for(var i = 0,len = inputs.length;i < len;i++){
						var $input = $(inputs[i]);
						if(!$input.attr("vui-editable") || ($input.attr("vui-editable") && $input.attr("vui-editable") != "display" && $input.attr("vui-editable") != "hidden")){
							updateParams[$input.attr("vui-name")] = $.vFilter($input.val());
						}
					}
				}else{
					$.vLog("输入表单没有配置!");
				}
				$.vAjax({
					url:settings.functions["update"].url,
					data:updateParams,
					success:function(data){
						if(data.errorMsg){
							alert(data.errorMsg);
						}else{
							if(data.result){
								alert("保存成功！");
								closePopWindow();
								getData();
							}else{
								alert("保存失败！");
							}
						}
					},
					error:function(jqXhr, textStatus, error){
						alert("保存失败！");
					}
				});
			}
		};
		
		/**
		 * 删除行
		 */
		var deleteRow = function(e){
			
			var dataIndex = $(e.target).parent().parent().find("[vui-control=dataIndex]").val();
			
			//var dataIndex = getSelectedIndex(e.target);
			
			var curData = tableData[pager.getDataIndex()][dataIndex];
			
			if(confirm("删除后，数据将不能恢复！\n是否确认删除？")){
				var deleteParams = {resourceID:settings.functions["delete"].resourceID || ""};
				
				var tempParams = settings.functions["delete"].param;
				
				for(var i = 0,len = tempParams.length;i < len;i++){
					deleteParams[tempParams[i]] = curData[tempParams[i]];
				}
				
				$.vAjax({
					url:settings.functions["delete"].url,
					data:deleteParams,
					success:function(data){
						if(data.errorMsg){
							alert(data.errorMsg);
							return;
						}
						if(data.result){
							alert("删除成功！");
							getData();
						}else{
							alert("删除失败！");
						}
					},
					error:function(jqXhr, textStatus, error) {
						alert("删除失败！");
					}
				});
			}
		};
		
		/**
		 *删除多行
		 */
		var deleteRows = function(){
			var selectedRows = $container.find("tbody [vui-control=select]:checked");
			if(selectedRows.length == 0){
				alert("请选择要删除的数据！");
				return;
			}
			var resourceID =settings.functions["delete"].resourceID;
			var ids = "";
			var curData = tableData[pager.getDataIndex()];
			var key = settings.functions["delete"].param[0];
			for(var i = 0,len = selectedRows.length;i < len;i++){
				ids += curData[selectedRows[i].value][key] + ",";
			}
			ids = ids.slice(0,ids.length - 1);
			if(confirm("删除后，数据将不能恢复！\n是否确认删除？")){
				var deleteUrl = settings.functions["delete"].url + "?" + key + "=" + ids+"&resourceID="+ resourceID;
				$.getJSON(deleteUrl,function(data){
					if(data.errorMsg){
						alert(data.errorMsg);
						return;
					}
					if(data.result){
						alert("删除成功！");
						getData();
					}else{
						alert("删除失败！");
					}
				}).error(function(jqXhr, textStatus, error) {
					$.vLog("数据传输错误！ Ajax Error - " + textStatus + ", " + error);
					alert("删除失败！");
				});
			}
		};
		
		/**
		 * 生成自定义功能事件
		 */
		var generateEventFunction = function(func){
			if(func && typeof func.url === "function"){
				if(customFunctions[func.label])
					return customFunctions[func.label];
				
				var f = function(e){
					var e = e || w.event;

					var params = [];//{resourceID:func.resourceID || ""};
					params.push(func.resourceID || "");
					if(func.param && func.param.length > 0){
						var dataIndex = getSelectedIndex(e.target);
						
						if(!dataIndex)
							return;
						
						var curData = tableData[pager.getDataIndex()][dataIndex];
						
						for(var i = 0,len = func.param.length;i < len;i++){
							params.push(curData[func.param[i]]);
							//params[func.param[i]] = curData[func.param[i]];
						}
					}
					
					func.url.apply({},params);
				};
				
				customFunctions[func.label] = f;
				
				return f;
			}
		};
		
		/**
		 * 绑定行内控制按钮事件
		 */
		var bindInRowControlEvent = function(){
			var functions = settings.functions;
			for(var p in functions){
				if(functions.hasOwnProperty(p) && functions[p]){
					switch(p){
						case "create":
							$container.find("tbody [vui-control=create]").click(initCreateForm);
							break;
						case "read":
							$container.find("tbody [vui-control=read]").click(initReadForm);
							break;
						case "update":
							$container.find("tbody [vui-control=update]").click(initUpdateForm);
							break;
						case "delete":
							$container.find("tbody [vui-control=delete]").click(deleteRow);
							break;
						default:
							$container.find("tbody [vui-control=" + p + "]").click(generateEventFunction(settings.functions[p]));
							break;
					}
				}
			}
		};
		
		//-----Data------
		/**
		 * 获取所有数据
		 */
		var getAllData = function(){
			var params = $.extend({
				resourceID:settings.resourceID
			},searchParam);
			
			$.vAjax({
				url:settings.url,
				data:params,
				success:function(data){
					if(settings.dataRoot)
						data = data[settings.dataRoot];
					
					if(data.length > 0){
						closeNodata();
						pager.init(data.length);
						renderPager();
						bindPagerEvent();
						tableData[1] = data;
						changeContent();		
						closeLoading();
						
						if(typeof settings.afterLoad === "function")
							settings.afterLoad();
						
					}else{
						showNodata();
					}
				}
			});
		};
		
		/**
		 * 获取包含分页信息的数据
		 */
		var getDataAndPagination = function(){
			var curPage = pager.curPage || 1;
			
			var params = $.extend({
				resourceID:settings.resourceID,
				"pagination.pageNo":curPage,
				"pagination.order":"asc",
				"pagination.pageSize":settings.rowsPerPage,
				"pagination.orderBy":settings.orderBy || ""
			},searchParam);
			
			$.vAjax({
				url:settings.url,
				data:params,
				success:function(data){
					if(data.totalCount > 0){
						closeNodata();
						
						if(pager.dataCount != data.totalCount){
							pager.init(data.totalCount);
							renderPager();
							bindPagerEvent();
						}
						
						if(pager.curPage != data.currentPage){
							pager.set(data.pageNo);
							setSelectPageAndSelectAll();
						}
						
						tableData[pager.getDataIndex()] = data[settings.dataRoot];
						changeContent();		
						closeLoading();
					}else{
						showNodata();
					}
				}
			});
		};
		
		/**
		 * 获取指定范围的数据
		 */
		var getSomeData = function(start){				
			var countParams = $.extend({
				resourceID:settings.resourceID,
				command:"read",
				from:start,
				to:pager.getEndIndex(start)
			},searchParam);
			var u=settings.url;
			if(Object.prototype.toString.apply(u)!="[object Array]"){
			$.vAjax({
				url:settings.url,
				data:countParams,
				success:function(data){
					if(settings.dataRoot)
						data = data[settings.dataRoot];
//					if(data.length < (pager.getEndIndex(start) - start + 1)){
//						$.vLog("接收到的数据行数少于请求行数!");
//						getDataCount(pager.curPage);
//					}else 
						if(data.length > 0){
						closeNodata();
						tableData[start] = data;
						changeContent();		
						closeLoading();
					}else{
						showNodata();
					}
				}
			});
			}else{
				var data=settings.url;
				closeNodata();
				tableData[start] = data;
				changeContent();		
				closeLoading();
			}
		};
		
		/**
		 * 获取数据行数
		 */
		var getDataCount = function(pageNo){
			var countParams = $.extend({
				resourceID:settings.resourceID,
				command:"count"
			},searchParam);
			var u=settings.url;
			if(Object.prototype.toString.apply(u)!="[object Array]"){
			$.vAjax({
				url:settings.url,
				data:countParams,
				async:false,
				success:function(data){
					if(data.count){
						closeNodata();
						if(data.count != pager.dataCount){
							$.vLog("数据已经变更，将重新查询!");
							tableData = {};
							pager.init(data.count);
							renderPager();
							bindPagerEvent();
							
							if(pageNo && !pager.set(pageNo))
								pager.last();
							
							setSelectPageAndSelectAll();
						}						
	
						getSomeData(pager.getDataIndex());
					}else{
						showNodata();
					}
				}
			});
			}else{
				var len=settings.url.length;
				closeNodata();
				if(len != pager.dataCount){
					$.vLog("数据已经变更，将重新查询!");
					tableData = {};
					pager.init(len);
					renderPager();
					bindPagerEvent();
					
					if(pageNo && !pager.set(pageNo))
						pager.last();
					
					setSelectPageAndSelectAll();
				}						

				getSomeData(pager.getDataIndex());
			}
		};
		
		/**
		 * 获取数据
		 */
		var getData = function(){
			tableData = {};
			
			if(settings.cachePage == "all"){
				getAllData();
			}else if(!settings.cachePage || settings.cachePage == "false"){
				getDataAndPagination();
			}
			else{
				getDataCount();
			}
		};
		
		var saveOptionsData = function(name,data,el){
			optionsData[name] = data;
			var html = "<option value=''>请选择</option>";
			
			for(var d = 0,dLen = data.length;d < dLen;d++){
				html += "<option value='" + data[d].value + "'>" + data[d].name + "</option>";
			}
			optionsHTML[name] = html;
			
			if(el){
				if(typeof el === "function"){
					el();
				}
				else if(el instanceof $){
					el.html(html);
				}else{
					$.vLog("Function[getOptionsData] - 不可接受的参数!");
				}
			}	
		};
		
		/**
		 * 获取选项数据
		 */
		var getOptionsData = function(name,el){
			if(settings.options && settings.options[name]){
				if(typeof settings.options[name] === "string"){
					$.vAjax({
						url:settings.options[name],
						type:"GET",
						success:function(data){
							if(data.result)
								data = data.result;
							if(data.length > 0){
								//optionsData[name] = data;
								saveOptionsData(name,data,el);								
							}else{
								$.vLog("Function[getOptionsData] - 没有数据!");
							}
						}
					});
				}else if(Object.prototype.toString.apply(settings.options[name]) === "[object Array]"){
					saveOptionsData(name,settings.options[name],el);
				}
			}else{
				$.vLog("选项数据: " + name + " 没有配置");
			}
		};
		//-----end-----
		
		
		/**
		 * 初始化选项及时间
		 */
		var initSelectAndDate = function($element){
			var inputs = $element.find("[vui-data]");
			
			for(var i = 0,len = inputs.length;i < len;i++){
				var $selectElement = $(inputs[i]);
				var optionsData = $selectElement.attr("vui-data");
				
				if(optionsHTML[optionsData]){
					var selectedVal = $selectElement.val();
					$selectElement.html(optionsHTML[optionsData]);
					$selectElement.val(selectedVal);
				}else{
					getOptionsData(optionsData,$selectElement);
				}
			}
			
			//暂时添加ctmteller
			var inputsElse = $element.find("[vui-data-else]");
			
			for(var i = 0,len = inputsElse.length;i < len;i++){
				var $selectElement = $(inputsElse[i]);
				var optionsData = $selectElement.attr("vui-data-else");
				if(optionsHTML[optionsData]){
					var selectedVal = $selectElement.val();
					$selectElement.html(optionsHTML[optionsData]);
					$selectElement.val(selectedVal);
				}else{
					getOptionsData(optionsData,$selectElement);
				}
			}
			
			var dateInputs = $element.find("[vui-type=date]");
			
			for(var i = 0,len = dateInputs.length;i < len;i++){
				/*var datePickerOptions = {};
				if($(dateInputs[i]).attr("vui-range")){					
					var ranges = $(dateInputs[i]).attr("vui-range").split(",");
					
					for(var j = 0,jLen = ranges.length;j < jLen;j++){
						var propertyName = ranges[j].split(":")[0];
						var properties = ranges[j].split(":")[1].split("|");
					}
				}*/
				var datePicker = function(){WdatePicker({})};
				$(dateInputs[i]).focus(datePicker).click(datePicker).addClass("Wdate");		
			}
		};
		
		/**
		 * 初始化搜索区
		 */
		var initSearchForm = function(){		
			initSelectAndDate($searchContainer);
			$searchContainer.find("[vui-control=submit]").addClass("btn primary").click(searchClick);
		};
		
		/**
		 * 搜索按钮事件
		 */
		var searchClick = function(){
			searchParam = {};
			var inputs = $searchContainer.find("[vui-name]");
			
			for(var i = 0,len = inputs.length;i < len;i++){
				var paramValue = $(inputs[i]).val();
				if(paramValue != '' && paramValue !=null)
					searchParam[$(inputs[i]).attr("vui-name")] = $.vFilter(paramValue);
			}
			
			setSelectPageAndSelectAll();
			getData();
			$container.css("display","block");
		};
		
		
		/**
		 * 初始化数据表格
		 */
		var init = function(){
			$.vLog("vgrid 初始化开始");
			
			$container.addClass("base nopadding vui-vgrid-table");
			renderTable();
			renderFooter();
			
			bindFooterEvent();
			
			if(settings.displayMode == "displayAfterSearch")
				$container.css("display","none");
			else
				getData();
			
			if(settings.searchContainer){
				$searchContainer = $("#" + settings.searchContainer);
				$searchContainer.addClass("base vui-vgrid-search");
				initSearchForm();	
			}else if(settings.displayMode == "displayAfterSearch"){
				$.vLog("没有定义搜索区，请勿使用 displayAfterSearch 模式！");
			}
			
			if($(".vui-vgrid-inputForm")){
				initSelectAndDate($(".vui-vgrid-inputForm"));
			}
			
			$container.on("reloadGrid",function(){getData();});
			
			if(settings.afterInit && typeof settings.afterInit === "function")
				settings.afterInit();
		};
		
		init();
	};
})(jQuery,window);
