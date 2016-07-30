/**
 * 负责控制登录界面位于屏幕中心
 * @author Reamy(杨木江)
 */
function centerLoginPanel() {
	var loginPanel = document.getElementById('loginPanel');
	var bgImg = document.getElementById('bgImg');
	var body = (document.compatMode && document.compatMode!="BackCompat")? document.documentElement : document.body;
	var left = body.clientWidth/2;
	var top = body.clientHeight/2 + 20;

	//更改位置
	loginPanel.style.left = ((left<383)?383:left) + 'px';
	loginPanel.style.top = ((top<320)?320:top) + 'px';
	
	bgImg.style.width = body.clientWidth + 'px';
	bgImg.style.height = body.clientHeight + 'px';
	bgImg.style.width = Math.max(document.body.scrollWidth,document.documentElement.scrollWidth) + 'px';
	bgImg.style.height = Math.max(document.body.scrollHeight,document.documentElement.scrollHeight) + 'px';
};

Xarch.addEvent(window,"load",centerLoginPanel);
Xarch.addEvent(window,"resize",centerLoginPanel);