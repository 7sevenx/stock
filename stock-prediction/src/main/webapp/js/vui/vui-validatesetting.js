$.vValidateSetting.addMessages({
	required:"此项必填",
	number:"此项必须为数值",
	digitNumber:"可以是字母、数字、下划线，需以字母开头",
	digit:"此项必须为数字",
	alpha:"此项必须为字母",
	email:"此项必须为Email地址",
	url:"此项必须为url地址",
	ip:"此项必须为IP地址",
	notChinese:"不能为中文！",
	len:"长度必须为 #1",
	maxlen:"长度不能超过 #1",
	minlen:"长度不能少于 #1",
	reg:"不符合要求",
	eq:"必须与\"#1\"相同",
	ge:"数值必须大于等于 #1",
	gt:"数值必须大于 #1",
	le:"数值必须小于等于 #1",
	lt:"数值必须小于 #1"
});

$.vValidateSetting.addGroups({
	userRequiredDigNum:{
		required:true,
		type:"digitNumber",
		action:"loginNameCheckProcess.json?resourceID=100025"
	},
	roleNameRequiredDigNum:{
		required:true,
		action:"roleNameCheckProcess.json?resourceID=100045",
	},
	departmentNameRequiredDigNum:{
		required:true,
		action:"departmentNameCheckProcess.json?resourceID=100035",
	},
	requiredIp:{
		required:true,
		type:"ip"
	},
	requiredNotChinese:{
		required:true,
		type:"notChinese"
	},
	ctmpDigNum:{
		required:true,
		type:"digitNumber",
		action:"ctmIdCheckProcess.json?resourceID=200121"
	},
	ctmpTellerDigNum:{
		required:true,
		type:"digitNumber",
		action:"ctmTellerIdCheckProcess.json?resourceID=200151"
	},
	requiredNum:{
		required:true,
		type:"number"
	},
	checkPbxNumber:{
		required:true,
		type:"number",
		action:"pbxNumberProcess.json?resourceID=200151"
	}
});