/*$(function(){
				var flag1=false;
				var flag2=false;
				var flag3=false;
				$("#dlm").keyup(function(){
					var str=this.value;
					var reg= /^.{6,20}$/;
					if(reg.test(str)==true){
						$("#toast").css("color","green");
						$("#toast").html("登录名输入合法！");
						flag1=true;
					}
					else{
						$("#toast").css("color","red");
						$("#toast").html("登录名输入不合法！");
						flag1=false;
					}
				})
				$("#mm").keyup(function(){
					var str1=this.value;
					var reg1=/^.{6,20}$/;
					if(reg1.test(str1)==true){
						$("#toast").css("color","green");
						$("#toast").html("密码输入合法！");
						flag2=true;
					}
					else{
						$("#toast").css("color","red");
						$("#toast").html("密码输入不合法！");
						flag2=false;
					}
				})
				$("#btn,#change").click(function(){
					var str = "";
				for (var i=0; i<4; i++) {
				var b = Math.random()>0.4 ? true : false;
				var c = Math.random()>0.5 ? true : false;
				if (b) {
					str += parseInt(Math.random()*10); //数字 0~9
				}
				else {
					//65~90
					if(c){
					str += String.fromCharCode(parseInt(Math.random()*26) + 65);
					}
					//97~122
					else{
						str += String.fromCharCode(parseInt(Math.random()*26) + 97);
					}
					}
				}
					$("#btn").val(str);
				
				})
				$("#yzm").keyup(function(){
					var str=this.value;
					if(str==$("#btn").val()){
						$("#toast").css("color","green");
						$("#toast").html("验证码输入一致！");
						flag3=true;
					}
					else{
						$("#toast").css("color","red");
						$("#toast").html("验证码输入不一致！");
						flag3=false;
					}
				})
				$("#button").click(function(){
            	if(flag1==true&&flag2==true&&flag3==true){
            		$("#toast").css("color","green");
            		$("#toast").html("恭喜你，登录成功!");
                       location.href="index.html";
               	}
            	else if(flag1==false){
            		$("#toast").css("color","red");
            		$("#toast").html("登录名输入不合法！");
            	}
            	else if(flag2==false){
            		$("#toast").css("color","red");
            		$("#toast").html("密码输入不合法！");
            	}
            	else if(flag3==false){
            		$("#toast").css("color","red");
            		$("#toast").html("验证码输入不一致！");
            	}
            })
		})*/