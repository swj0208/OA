jQuery.extend({
	pageBeanParam:{
		pages:1,
		pageSize:10,
		total:0
	},
	
	createPageBar:function(pageBean,pageBarId){
		pageBeanParam=jQuery.extend({},jQuery.pageBeanParam,pageBean);
		var total=pageBeanParam.total;
		var pages=pageBeanParam.pages;
		var pageSize=pageBean.pageSize;
		
		var totalpages=0;
		if(total%pageSize==0){
			totalpages=total/pageSize;
		}else{
			totalpages=parseInt(total/pageSize)+1;
		}
		
		var nextpage=0;
		var prepage=0;
		if(pages<totalpages){
			nextpage=pages+1;
		}else{
			nextpage=totalpages;
		}
		if(pages>1){
			prepage=pages-1;
		}else{
			prepage=1;
		}
		
		var pagestr='<span>当前页数:['+pages+'/'+totalpages+']';
		pagestr+='总记录数:'+total+'条/每页'+pageSize;
		pagestr+='<a href="javascript:gopage(1)">首页</a>';
		pagestr+='<a href="javascript:gopage('+prepage+')">上一页</a>';
		pagestr+='<a href="javascript:gopage('+nextpage+')">下一页</a>';
		pagestr+='<a href="javascript:gopage('+totalpages+')">末页</a></span>';
		
		if(pageBarId){
			$("#"+pageBarId).html(pagestr);
		}
	}
});