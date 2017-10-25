			$(function(){
				var scale=parseInt($("#bigImg").width()/$(".small-box").width());
			$(".small-box").mousemove(function(e){
				$(".hover").show();
				$(".big-box").show();
				
				var e=e||event;
				//放大区域的位置，
				var x=e.pageX-$(".small-box").offset().left-$(".hover").width()/2;
				var y=e.pageY-$(".small-box").offset().top-$(".hover").height()/2;
				//判断左边界
				if(x<0){
					x=0;
				}
				//判断右边界
				else if(x>$(".small-box").width()-$(".hover").width()){
					x = $(".small-box").width()-$(".hover").width();
				}
				//判断上边界
				if(y<0){
					y=0
				}
				//判断下边界
				else if(y>$(".small-box").height()-$(".hover").height()){
					y=$(".small-box").height()-$(".hover").height();
				}
				$(".hover").css({left:x,top:y});
				$("#bigImg").css({left:-scale*x,top:-scale*y});
				
			})
			$(".small-box").mouseleave(function(){
				$(".hover").hide();
				$(".big-box").hide();
			})
			  $(".list").find("li").each(function() {
                $(this).mouseenter(function() {
                	//出现马赛克
//                  $(".small-box img").attr('src', 'images/detail/detail'+($(this).index() + 1)+'.jpg');
//                  $(".big-box img").attr('src', 'images/detail/detail'+($(this).index() + 1)+'.jpg');
					$(this).removeClass().addClass("item-cur").siblings().removeClass("item-cur");
                	$(this).css("border-color","#eb6100").siblings().css("border-color","#999");
                })
           })
			  $(".color ul").find("li").each(function() {
                $(this).click(function() {
                	$(this).css("border-color","#eb6100").siblings().css("border-color","#999");
                })
           })
			   $(".size ul").find("li").each(function() {
                $(this).click(function() {
                	$(this).css("border-color","#eb6100").siblings().css("border-color","#999");
                })
           })
				//+
							$("#addbtn").click(function(){
								$("#lessbtn").css("background","#fff");
								$("#lessbtn").css("cursor","pointer");
								var val=$("#numinput").val();
								val++;
								$("#numinput").val(val);
								if (val > 11) {
									val = 11;
									$("#numinput").val(val);
									$("#addbtn").css("background","#f2f2f2");
									$("#addbtn").css("cursor","not-allowed");
								}
							})
							
							//-
							$("#lessbtn").click(function(){
								$("#addbtn").css("background","#fff");
								$("#addbtn").css("cursor","pointer");
								var val=$("#numinput").val();
								val--;
								$("#numinput").val(val);
								if (val < 2) {
									val = 1;
									$("#numinput").val(val);
									$("#lessbtn").css("background","#f2f2f2");
									$("#lessbtn").css("cursor","not-allowed");
								}
							})
							//失去焦点判断
							$("#numinput").blur(function(){
								var val=$("#numinput").val();
								if (val < 2) {
									val = 1;
									$("#numinput").val(val);
									$("#addbtn").css("background","#fff");
									$("#addbtn").css("cursor","pointer");
									$("#lessbtn").css("background","#f2f2f2");
									$("#lessbtn").css("cursor","not-allowed");
								}
								if (val > 5) {
									val = 6;
									$("#numinput").val(val);
									$("#lessbtn").css("background","#fff");
									$("#lessbtn").css("cursor","pointer");
									$("#addbtn").css("background","#f2f2f2");
									$("#addbtn").css("cursor","not-allowed");
								}
							})
			})