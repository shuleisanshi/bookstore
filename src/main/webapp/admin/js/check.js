
function CheckNull(strElem,strName)
{
	if(document.getElementById(strElem).value == "")
	{
		window.alert(strName + " 为必填项");
		document.getElementById(strElem).focus();
		return false;
	}
	
	return true;
}
function CheckMustNum(strElem,strName)
{
	if( document.getElementById(strElem).value == "" || isNaN(document.getElementById(strElem).value))
	{
		window.alert(strName + " 为必填项且必须是数值型");
		document.getElementById(strElem).focus();
		return false;
	}
	return true;
}
function CheckNum(strElem,strName)
{
	if(isNaN(document.getElementById(strElem).value))
	{
		window.alert(strName + " 必须是数值型");
		document.getElementById(strElem).focus();
		return false;
	}
	return true;
}
function CheckNumber(strElem,strName)
{
	var str = document.getElementById(strElem).value ;
	for(var i=0;i<str.length;i++)
	{
		var strTmp = str.charAt(i) ;
		if(strTmp < "0" || strTmp > "9")
		{
			window.alert(strName + " 必须是整数");
			document.getElementById(strElem).focus();
			return false;
		}
	}
	return true ;
}
//只能输入中文字
function CheckChinese(strElem,strName)
{
	var str = document.getElementById(strElem).value ;
	for(var i=0;i<str.length;i++)
	{
		var strTmp = str.charAt(i) ;
		
		if(document.getElementById(strElem).value.indexOf('0123456789qwertyuiopasdfghjklzxcvbnm') != -1)
		{
			window.alert(strName + " 只能填写中文");
			document.getElementById(strElem).focus();
			return false;
		}
	}
	return true ;
}
//只能输入中文和英文
function CheckEC(strElem,strName)
{
	var str = document.getElementById(strElem).value ;
	for(var i=0;i<str.length;i++)
	{
		var strTmp = str.charAt(i) ;
		
		if(document.getElementById(strElem).value.indexOf('0123456789!@#$%^&*()~`,./;') != -1)
		{
			window.alert(strName + " 只能填写中文和英文");
			document.getElementById(strElem).focus();
			return false;
		}
	}
	return true ;
}

function CheckEmail(strElem,strName)
{
	if(document.getElementById(strElem).value.indexOf('@') == -1)
	{
		window.alert("请输入正确的 " + strName);
		document.getElementById(strElem).focus();
		return false;
	}
	return true;
}

function CheckMustDate(strElem,strName)
{
	if(CommCheckDate(document.getElementById(strElem).value))
	{
		return true;	
	}
	else
	{
		window.alert(strName + " 是必填项且为日期型,例:1900-01-01");
		document.getElementById(strElem).focus();
		return false
	}
}
function CheckDate(strElem,strName)
{
	if(document.getElementById(strElem).value == "")
	{
		return true;
	}
	if(CommCheckDate(document.getElementById(strElem).value))
	{
		return true;
	}
	else
	{
		window.alert(strName + " 必须是日期型,例:1900-01-01");
		document.getElementById(strElem).focus();
		return false
	}
}
function CommCheckDate(strValue)
{
	var objRegExp = /^\d{4}(\-)\d{1,2}\1\d{1,2}$/
	if(!objRegExp.test(strValue))
	{
		return false;
	}
	//
	var arrayDate = strValue.split(RegExp.$1); 
	var intDay = parseInt(arrayDate[2],10);
	var intYear = parseInt(arrayDate[0],10);
	var intMonth = parseInt(arrayDate[1],10);
	switch(intMonth)
	{
		case 1:
			if(intDay <= 31 && intDay >0)
			{
				return true;
			}
		case 3:
			if(intDay <= 31 && intDay >0)
			{
				return true;
			}
		case 5:
			if(intDay <= 31 && intDay >0)
			{
				return true;
			}
		case 7:
			if(intDay <= 31 && intDay >0)
			{
				return true;
			}
		case 8:
			if(intDay <= 31 && intDay >0)
			{
				return true;
			}
		case 10:
			if(intDay <= 31 && intDay >0)
			{
				return true;
			}
		case 12:
			if(intDay <= 31 && intDay >0)
			{
				return true;
			}
		case 4:
			if(intDay <=30 && intDay >0)
			{
				return true;
			}
		case 6:
			if(intDay <=30 && intDay >0)
			{
				return true;
			}
		case 9:
			if(intDay <=30 && intDay >0)
			{
				return true;
			}
		case 11:
			if(intDay <=30 && intDay >0)
			{
				return true;
			}
		case 2:
			var booLeapYear = (intYear % 4 == 0 && (intYear % 100 != 0 || intYear % 400 == 0));
			if( ((booLeapYear && intDay <= 29) || (!booLeapYear && intDay <=28)) && intDay >0)
			{
				return true;
			}
		default:
			return false;
	}
	return false;
}

function CompareDate(SmallDate,BigDate)
{
	var intSmallYearLen = SmallDate.indexOf('-');
	var intBigYearLen = BigDate.indexOf('-');
	
	if(intSmallYearLen==-1 || intBigYearLen==-1)
	{
		return true;
	}
	
	var strSmallYear = parseInt(SmallDate.substring(0,intSmallYearLen));
	var strBigYear = parseInt(BigDate.substring(0,intBigYearLen));
	if(strSmallYear > strBigYear)
	{
		return false;
	}
	else if(strSmallYear < strBigYear)
	{
		return true;
	}
	else if(strSmallYear == strBigYear)
	{
		var intSmallMonthLen = SmallDate.indexOf('-',5);
		var intBigMonthLen = BigDate.indexOf('-',5);
		var strSmallMonth = parseInt(SmallDate.substring(intSmallYearLen+1,intSmallMonthLen));
		var strBigMonth = parseInt(BigDate.substring(intBigYearLen+1,intBigMonthLen));
		if(strSmallMonth > strBigMonth)
		{
			return false;
		}
		else if(strSmallMonth < strBigMonth)
		{
			return true;
		}
		else if(strSmallMonth == strBigMonth)
		{
			if(SmallDate.indexOf(':')>0)
			{
				SmallDate = SmallDate.substring(0,SmallDate.length-8);
			}
			if(BigDate.indexOf(':')>0)
			{
				BigDate = BigDate.substring(0,BigDate.length-8);
			}
			var intSmallDay = SmallDate.lastIndexOf('-')+1;
			var intBigDay = BigDate.lastIndexOf('-')+1;
			var strSmallDay = parseInt(SmallDate.substring(intSmallDay,SmallDate.length));
			var strBigDay = parseInt(BigDate.substring(intBigDay,BigDate.length));
			if(strSmallDay > strBigDay || strSmallDay == strBigDay)
			{
				return false;
			}
			else
			{
				return true;
			}
		}
	}
	
}
