$(function(){
				var flag1=false;
				var flag2=false;
				var flag3=false;
				var flag4=false;
				var flag5=false;
				var flag6=false;
				var flag7=false;
				$("#yhm").keyup(function(){
					var str=this.value;
					var reg= /^.{6,20}$/;
					if(reg.test(str)==true){
						flag1=true;
					}
					else{
						flag1=false;
					}
				})
				$("#sjh").keyup(function(){
					var str=this.value;
					var reg= /^((13[0-9])|(14[5|7])|(15([0-3]|[5-9]))|(18[05-9]))\d{8}$/;
					if(reg.test(str)==true){
						flag2=true;
					}
					else{
						flag2=false;
					}
				})
				$("#mm").keyup(function(){
					var str1=this.value;
					var reg1=/^.{6,20}$/;
					if(reg1.test(str1)==true){
						flag3=true;
					}
					else{
						flag3=false;
					}
				})
				$("#qrmm").keyup(function(){
					var str1=this.value;
					if(str1==$("#mm").val()){
						flag4=true;
					}
					else{
						flag4=false;
					}
				})
				$("#yx").keyup(function(){
					var str=this.value;
					var reg= /^.{6,20}$/;
					if(reg.test(str)==true){
						flag5=true;
					}
					else{
						flag5=false;
					}
				})
				$("#btn").click(function(){
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
						flag6=true;
					}
					else{
						flag6=false;
					}
				})
				$("#ty").click(function(){
					if($("#ty").prop("checked")){
						flag7=true;
					}
					else{
						flag7=false;
					}
				})
				//如果都正确，注册成功
				$("#button").click(function(){
            	if(flag1==true&&flag2==true&&flag3==true&&flag4==true&&flag5==true&&flag6==true&&flag7==true){
            		alert("恭喜你，注册成功!");
                    location.href="login.html";
               }
            })
		})