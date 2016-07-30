var str = '';
if (!!window.ActiveXObject || "ActiveXObject" in window){
	str += '<object id="WebOffice" style="position:relative;z-index: 4;" width="100%" height="100%" classid="clsid:8B23EA28-2009-402F-92C4-59BE0E063499" codebase="iWebOffice2009.cab#version=10,8,4,6">';
	str += '</object>';
}else if (navigator.userAgent.indexOf('Firefox') >= 0){
	//var copyright="上海市司法局[专用];V5.0S0xGAAEAAAAAAAAAEAAAACYBAAAwAQAALAAAAEH2/J+izynWRxk3vHHZHvBFDBAmKRaJgXUSaUdluaRAkp05VlKktp07/RphR4b4iQdkR3ifFt+Bme0LIDsVkfgBBq2c7eIctKr3KnqA5GAJESxUtpJpOB7aM+89MWwymcpBldnslfAQBmBKSxdQ+7ccNsHIyC0lFVuTX5/lVMPyL25K5YSxKunM7wXtVypOqCbJBsBg7ipK4S+5fUxQStG7x9LVhUveFlgc8i4/kYWKD3R4RIthvNWbiihR4lhGJNzUDc4CKZQmiHdEsDwxei25jmYJ1dI2lbfle5/5/Qqm+mvDs061vIHhhJkrgoveBUk/JO8/jOLNdz5JuWVzjDypWfQPsFtWHhsaHrrPlbrFmpWb1wYreayZY45drw8QpcKToRQg5+XGHfn4c8wal4oikGEY49zgp3wq/fA1CEe+";
	var copyright="上海市司法局[专用];V5.0S0xGAAEAAAAAAAAAEAAAACYBAAAwAQAALAAAAEH2/J+izynWRxk3vHHZHvBFDBAmKRaJgXUSaUdluaRAkp05VlKktp07/RphR4b4iQdkR3ifFt+Bme0LIDsVkfgBBq2c7eIctKr3KnqA5GAJESxUtpJpOB7aM+89MWwymcpBldnslfAQBmBKSxdQ+7ccNsHIyC0lFVuTX5/lVMPyL25K5YSxKunM7wXtVypOqCbJBsBg7ipK4S+5fUxQStG7x9LVhUveFlgc8i4/kYWKD3R4RIthvNWbiihR4lhGJNzUDc4CKZQmiHdEsDwxei25jmYJ1dI2lbfle5/5/Qqm+mvDs061vIHhhJkrgoveBUk/JO8/jOLNdz5JuWVzjDypWfQPsFtWHhsaHrrPlbrFmpWb1wYreayZY45drw8QpcKToRQg5+XGHfn4c8wal4oikGEY49zgp3wq/fA1CEe+";
	//var copyright="";
	str += '<embed id="WebOffice" ';

	str += ' width="100%"';
	str += ' height="100%"';

	if ((window.ActiveXObject!=undefined) || (window.ActiveXObject!=null) ||"ActiveXObject" in window)
	{
		str += ' CLASSID="clsid:8B23EA28-2009-402F-92C4-59BE0E063499"  codebase="iWebOffice2009.cab#version=10,8,4,6"';
		str += '>';
		
	}
	else
	{
		str += ' progid="iWebOffice2009.HandWriteCtrl"';
		str += ' type="application/iwebplugin"';
		str += ' OnMenuClick="OnMenuClick"';
		str	+= ' OnToolsClick="OnToolsClick"';
		str += ' OnExecuteScripted="OnExecuteScripted"';
		str += ' Copyright="' + copyright + '"';
		str += '>';
	}
	str += '</embed>';
}
var iHeight="5";
var iWidth="20";
var iTop = (window.screen.availHeight - 20 - iHeight) / 2; 
var iLeft = (window.screen.availWidth - 10 - iWidth) / 2;	
var canshu = "dialogWidth:"+iWidth+"px;dialogHeight:"+iHeight+"px;dialogTop:"+iTop+"px;dialogLeft:"+iLeft+"px;center=yes;help=no;resizable=no;status=no;location=no;titlebar=no";
window.showModalDialog("loading.html",window,canshu);	

document.write(str);
