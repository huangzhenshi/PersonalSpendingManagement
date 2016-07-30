var isSessionInvalid = false;
	$.ajaxSetup({   
	    contentType:"application/x-www-form-urlencoded;charset=utf-8",   
	    cache:false ,  
	   /* beforeSend:function(XHR,settings){
	    	debugger;
	    	settings.data;
	    	return true;
	    },*/
	    complete:function(data,TS){
	    	var status = data.status;
	    	if(status==403){
	    		warning("您没有权限，请联系系统管理员开通！");
	    		return;
	    	}
	    	try{
		    	if(data.responseText&&data.responseText.indexOf("isSessionInvalid")==-1&&data.responseText.indexOf("login@tag")!=-1&&!isSessionInvalid){
		    		isSessionInvalid = true;
		    		$.confirm("登陆已超时，是否重新登录？", function(r) {
		    			if (r) {
				    		window.location.href= ctx + "/login?login_error=2";
		    			}else{
		    				isSessionInvalid = false;
		    			}
		    		});
		    		return;
		    	}
	    	}catch(e){
	    		
	    	}
	        //对返回的数据data做判断，
	        //session过期的话，就location到一个页面
	    },
	    error:function(e){
	    	error(e);
	    }
	});