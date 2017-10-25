$(function(){
//+
				$(".shopcart-con").on("click", "#add", ()=>{
								var index=$(this).index('.cart-form');
								console.log(index)
								var val=$(this).children('#val').val();
								val++;
								$(this).children('#val').val(val);
				})
				
				//-
				$(".shopcart-con").on("click", "#less", ()=>{
								var index=$(this).index(".cart-form");
								console.log(index)
								var val=$(this).children('#val').val();
								val--;
								$(this).children('#val').val(val);
								if (val < 2) {
									val = 1;
									$(this).children('#val').val(val);
									$(this).children('#less').css("background","#f2f2f2");
									$(this).children('#less').css("cursor","not-allowed");
								}
				})
				$("#add-list li").each(function(index){
						    $(this).find("input").click(function(){
						        var _index = index;
						        $('#add-list li').eq(_index).css({'background-position-x':'-427px'}).css({'background-position-y':'-630px'}).siblings().css({'background-position-x':'-519px'}).css({'background-position-y':'-398px'})
						    });
						});
		})