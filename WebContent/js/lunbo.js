$(function(){
	//banner轮播图
				function lunbo(){
				var list1 = $("#list3");
				var list2 = $("#list4");
				var oli = $("#list3 li");
				var ali = $("#list4 li");
				
				//复制第一张图到最后
				oli.first().clone(true).appendTo(list1);
				var size = $("#list3 li").size();
				list1.width(1600*size);
				//开启定时器
			var index=0;
			var timer=setInterval(function(){
				index++;
				move();
			},3000);
			//移动函数
			function move(){
				if(index<0){
					list1.css("left", -1600*(size-1));
					index=size-2;
				}
				if(index>=size){
					list1.css("left", 0);
					index=1;
				}
				list1.stop().animate({left:-index*1600}, 500);
				ali.eq(index).addClass("current").siblings().removeClass("current");
					if (index == size-1) {
						ali.eq(0).addClass("current").siblings().removeClass("current");
					}
			}
			//上一张
			$("#fsl").click(function(){
				index--;
				move();
			})
			//下一张
			$("#fsr").click(function(){
				index++;
				move();
			})
			//鼠标移入暂停
			ali.mouseenter(function(){
					index = $(this).index();
					move();
				})
				
				$("#banner-warpper").hover(function(){
					$("#fsl").show();
					$("#fsr").show();
					clearInterval(timer);
				},
				function(){
					$("#fsl").hide();
					$("#fsr").hide();
					timer = setInterval(function(){
						index++;
						move();
					}, 2000);
				})
				
				}
				lunbo();
			})