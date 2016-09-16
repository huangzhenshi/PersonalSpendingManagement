function login(){
			$("#mesBox").hide().empty();
			if(!$("#username").val()){
				$("#mesBox").append("<span><img src='"+ctx+"/res/resource/style/images/login/fail.png'/></span><span>用户名不能为空！</span>").show();
				return;
			}

			if(!$("#password").val()){
				$("#mesBox").append("<span><img src='"+ctx+"/res/resource/style/images/login/fail.png'/></span><span>密码不能为空！</span>").show();
				return;
			}

			if(!$("#validateCode").val()){
				$("#mesBox").append("<span><img src='"+ctx+"/res/resource/style/images/login/fail.png'/></span><span>验证码不能为空！</span>").show();
				return;
			}
			var pwd = $("#password").val();
			pwd = window.md5(pwd);
			var hashObj = new jsSHA("SHA-1", "TEXT",{numRounds: parseInt(1, 10)});
			hashObj.update(pwd);
			pwd=hashObj.getHash("HEX");
			$("#password").val(pwd)
			$('#loginForm').submit();

		}
