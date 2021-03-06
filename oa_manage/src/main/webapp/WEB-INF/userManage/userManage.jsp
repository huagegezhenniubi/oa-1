<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/layui-v2.1.4/layui/common/base.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
	<meta charset="utf-8" />
	<meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0" />
	<title>受邀用户</title>
	<link rel="stylesheet" href="${basePath }/layui-v2.1.4/layui/css/zoomove.min.css" />
	<link rel="stylesheet" href="${basePath }/layui-v2.1.4/layui/css/layui.css?t=1506699022911" media="all" />
	<style>
	  body{margin: 10px;}
	  .demo-carousel{height: 200px; line-height: 200px; text-align: center;}
	  .layui-table-body.layui-table-main{height:508.99px;}
	  .layui-table-view .layui-table td, .layui-table-view .layui-table th{padding:10px 0;}
	  .layui-input-block .zoo-item .zoo-img{background-size: 100% 100%;}
	</style>
</head>
<body>

<form class="layui-form" action="" target="nm_iframe">
	<blockquote class="layui-elem-quote">
	   	<div class="layui-form-item">
	        <span class="layui-form-label">身份证号码：</span>
		    <div class="layui-input-inline">
		   		<input type="text" id="idcard" autocomplete="off" placeholder="身份证号码" class="layui-input" />
		    </div>
		    <span class="layui-form-label">手机号码：</span>
		    <div class="layui-input-inline">
		   		<input type="text" id="phoneNumber" autocomplete="off" placeholder="手机号码" class="layui-input" />
		    </div>
			<span class="layui-form-label">用户状态：</span>
			<div class="layui-input-inline">
				<select id="status" lay-verify="" >
					<option value="0">--全部--</option>
					<option value="1">注册用户</option>
					<option value="2">未注册用户</option>
				</select>
			</div>
	   		<button type="button" data-method="queryHandler" class="layui-btn" id="query">查询</button>
	    </div>
    </blockquote>

	<blockquote class="layui-elem-quote">
		<button type="button" class="layui-btn layui-btn-warm" id="downLoadTemplateBtn">下载模板</button>
		<button type="button" class="layui-btn layui-btn-normal" id="import">导入数据</button>
		<button type="button" class="layui-btn layui-btn-danger" id="addEmp">新增员工</button>
		<button type="button" class="layui-btn " id="downLoadBtn">下载用户资料表格</button>
	</blockquote>
</form>

<!-- 设置表单容器 --> 
<table id="dateTable" lay-filter="demo"></table>

<!-- 设置编辑页面 -->
<div style="display: none" id="detail" lay-filter="test22">
	<!-- <table id="activityDetail" lay-filter="activityDetail"></table> -->
	<form class="layui-form layui-form-pane" action="#### style="margin-right: 5%; margin-top: 10px;height: 500px"  id="itemAddForm">

		<div class="layui-form-item" pane>
			<label class="layui-form-label">真实姓名:</label>
			<div class="layui-input-block">
				<input type="text" id="realName" autocomplete="off" class="layui-input" />
			</div>
		</div>

		<div class="layui-form-item">
			<label class="layui-form-label">性别:</label>
			<div class="layui-input-block">
				<input type="radio" name="sex" value="1" title="男">
				<input type="radio" name="sex" value="2" title="女">
			</div>
		</div>

		<div class="layui-form-item" pane>
			<label class="layui-form-label">出生年月日:</label>
			<div class="layui-input-block">
				<input type="text" id="date1" autocomplete="off" class="layui-input" />
			</div>
		</div>

		<div class="layui-form-item" pane>
			<label class="layui-form-label">出生地:</label>
			<div class="layui-input-block">
				<input type="text" id="growingPlace" autocomplete="off" class="layui-input" />
			</div>
		</div>



		<div class="layui-form-item" pane>
			<label class="layui-form-label">学历:</label>
			<div class="layui-input-block">
				<input type="text" id="education" autocomplete="off"  class="layui-input" />
			</div>
		</div>

		<div class="layui-form-item" pane>
			<label class="layui-form-label">身高:</label>
			<div class="layui-input-block">
				<input type="text" id="height" autocomplete="off" class="layui-input" />
			</div>
		</div>

		<div class="layui-form-item" pane>
			<label class="layui-form-label">身份证号码:</label>
			<div class="layui-input-block">
				<input type="text" id="idcard_2" autocomplete="off" class="layui-input" />
			</div>
		</div>

		<div class="layui-form-item" pane>
			<label class="layui-form-label">手机号码:</label>
			<div class="layui-input-block">
				<input type="text" id="phone" autocomplete="off" class="layui-input" />
			</div>
		</div>

		<hr>

		<div class="layui-form-item" pane>
			<label class="layui-form-label">民族:</label>
			<div class="layui-input-block">
				<input type="text" id="nation" autocomplete="off" class="layui-input" />
			</div>
		</div>

		<div class="layui-form-item" pane>
			<label class="layui-form-label">籍贯:</label>
			<div class="layui-input-block">
				<input type="text" id="birthplace" autocomplete="off" class="layui-input" />
			</div>
		</div>

		<div class="layui-form-item" pane>
			<label class="layui-form-label">政治面貌:</label>
			<div class="layui-input-block">
				<input type="text" id="face" autocomplete="off" class="layui-input" />
			</div>
		</div>

		<div class="layui-form-item" pane>
			<label class="layui-form-label">婚姻状况:</label>
			<div class="layui-input-block">
				<input type="text" id="maritalStatus" autocomplete="off" class="layui-input" />
			</div>
		</div>

		<div class="layui-form-item" pane>
			<label class="layui-form-label">工作单位:</label>
			<div class="layui-input-block">
				<input type="text" id="workUnit" autocomplete="off" class="layui-input" />
			</div>
		</div>

		<div class="layui-form-item" pane>
			<label class="layui-form-label">单位属性:</label>
			<div class="layui-input-block">
				<input type="text" id="unitAttribute" autocomplete="off" class="layui-input" />
			</div>
		</div>

		<div class="layui-form-item" pane>
			<label class="layui-form-label">岗位性质:</label>
			<div class="layui-input-block">
				<input type="text" id="postNature" autocomplete="off" class="layui-input" />
			</div>
		</div>


	</form>
</div>



	<!-- 设置操作按钮 -->
<script type="text/html" id="barDemo">
	<a class="layui-btn layui-btn-mini" lay-event="edit">编辑</a>

	<a class="layui-btn layui-btn-danger layui-btn-mini" lay-event="del">删除</a>
</script>



	<!--
	<a class="layui-btn layui-btn-mini" lay-event="edit">编辑</a>

	-->

<!-- 下载模板提交表单 -->
<form id="downLoadTemplateForm" action="/InvitationUser/downLoadTemplate">
	<input type="hidden" name="" />
</form>

<!-- 下载用户资料表格 -->
<form id="downLoadForm" action="/InvitationUser/downloadUserData" method="post">
	<input type="hidden" name="idcard" id="idcard2" />
	<input type="hidden" name="phone" id="phone2" />
	<input type="hidden" name="status" id="userId2"/>
</form>

<script src="${basePath }/layui-v2.1.4/layui/jquery-2.1.1.min.js" type="text/javascript"></script>
<script src="${basePath }/layui-v2.1.4/layui/zoomove.min.js" type="text/javascript"></script>   
<script src="${basePath }/layui-v2.1.4/layui/layui.js?t=1506699022911"></script>
<script type="text/html" id="titleTpl">
	{{# if(d.sex =='1'){ }}
		男
	{{#  } else { }}
		女
	{{#  } }}
</script>
<script type="text/html" id="titleTpl2">
	{{#
		var fn = function(date){
			return date.substring(0,11);
		};
	}}
	{{# if(d.birthTime != '' ){ }}
		{{ fn(d.birthTime)  }}
	{{#  } else { }}
		d.birthTime
	{{#  } }}
</script>

<script>
var currentPage=1;
//该方法的函数其实返回了所加载的模块接口，所以你其实也可以不通过layui对象赋值获得接口（这一点跟Sea.js很像哈）：
layui.use(['layedit', 'jquery','laydate', 'laypage', 'layer','form', 'table', 'carousel', 'upload', 'element'], function(){
	var $ = layui.jquery;  			//引用自身的JQuery
    var form = layui.form;
    var laydate = layui.laydate 	//日期
  	,laypage = layui.laypage 		//分页
  	,layer = layui.layer 			//弹层
  	,table = layui.table 			//表格
  	,carousel = layui.carousel 		//轮播
 	,upload = layui.upload 			//上传
 	,layedit = layui.layedit 		//文本编辑器
 	,element = layui.element; 		//元素操作
 	var editorFirst;				//富文本编辑器 全局变量!
  	//向世界问个好
//  layer.msg('Hello World');
  
 	
 	//================数据渲染     方法一Start====================
 	function queryDynamic(){	
	table.render({//向后台发送数据 
		  elem: '#dateTable' 		//指定原始表格元素选择器（推荐id选择器）
		  ,height: 590 		 		//容器高度
		  ,page:true 		 		//开启分页 
		  ,even: true 				//开启隔行背景
		  ,method:'post'
		  ,request: {		 		//分页   设置分页名称
			  pageName: 'page' 		//页码的参数名称，默认：page
		 	 ,limitName: 'pageSize' //每页数据量的参数名，默认：limit
		  }
			  	  					//分页参数设置  	
	  	  ,limits:[10]
	  	  ,limit: 10 				//默认采用60	
		  ,response: {
			  statusName: 'code'  	//数据状态的字段名称，默认：code
			  ,statusCode: 200 		//成功的状态码，默认：0
			  ,msgName: 'msg'  		//状态信息的字段名称，默认：msg
			  ,countName: 'total' 	//数据总数的字段名称，默认：count
			  ,dataName: 'data' 	//数据列表的字段名称，默认：data
		  } 	
	 	  ,where:{queryRestraintJson:getQueryParam()}
	 	  ,url: js_path+'/InvitationUser/queryDynamic'
	 	  //设置表头  进行数据渲染
	 	  ,cols:[[
				{field: 'realName', title: '真实姓名', width: 180, align:'center'}
			   ,{field: 'sex', title: '性别',templet:'#titleTpl', width: 100,align:'center'}
			   ,{field: 'nation', title: '民族', width: 100, align:'center'}
			   ,{field: 'birthTime', title: '出生日期',templet:"#titleTpl2", width: 100, align:'center'}
			   ,{field: 'birthplace', title: '籍贯', width: 100, align:'center'}
			   ,{field: 'growingPlace', title: '出生地', width: 100, align:'center'}
			   ,{field: 'politicalVisage', title: '政治面貌', width: 100, align:'center'}
			   ,{field: 'education', title: '学历', width: 100, align:'center'}
			   ,{field: 'maritalStatus', title: '婚姻状态', width: 100, align:'center'}
			   ,{field: 'height', title: '身高', width: 100, align:'center'}
			   ,{field: 'idcard', title: '身份证号码', width: 80, align:'center'}
			   ,{field: 'phone', title: '手机号码', width: 80, align:'center'}
		       ,{field: 'workUnit', title: '工作单位', width: 120, align:'center' }
			   ,{field: 'unitAttribute', title: '单位属性', width: 120, align:'center' }
               ,{field: 'postNature', title: '岗位性质', width: 120, align:'center' }
			   ,{fixed: 'right', width:120, align:'center',title:'操作',toolbar:'#barDemo'}
	 		    ]]
  		  // 数据渲染完的回调   无论是异步请求数据，还是直接赋值数据，都会触发该回调.
	 	  ,done: function(res, curr, count){
	 		  //如果是异步请求数据方式，res即为你接口返回的信息。
	 		  //如果是直接赋值的方式，res即为：{code: 200, msg: "查询成功", total: 17, data: Array(10)} 
	 		  console.log(res);
	 		  //得到当前页码
	 		  console.log(curr);
	 		  //得到数据总量
	 		  console.log(count);
		  }
	}); 
 	}	  		  
	//================数据渲染   end======================

	// 初始化加载查询方法	
	queryDynamic();
	
	//查询按钮事件
	$('#query').click(function(e){
		queryDynamic();
	});
	
	

	//监听工具条
	table.on('tool(demo)', function(obj){ //注：tool是工具条事件名，test是table原始容器的属性 lay-filter="对应的值"
		var data = obj.data 		//获得当前行数据
		,layEvent = obj.event; 		//获得 lay-event 对应的值
		if(layEvent === 'edit'){//编辑
			//给详情页面赋值
			$('#realName').val(data.realName);
			$('#date1').val(data.birthTime.substring(0,10));
			$('#growingPlace').val(data.growingPlace);

			$("#education").val(data.education);
			$('#height').val(data.height);
			$("#idcard_2").val(data.idcard);
			$("#phone").val(data.phone);

			if(data.sex == 1){
                $("input[name='sex'][value=1]").prop("checked",true);
			}else{
                $("input[name='sex'][value=2]").prop("checked",true);
			}
			$("#nation").val(data.nation);					//民族
            $('#face').val(data.politicalVisage);  			//政治面貌
			$("#birthplace").val(data.birthplace);			//籍贯
			$("#workUnit").val(data.workUnit); 			//工作单位
			$("#maritalStatus").val(data.maritalStatus);
			$("#unitAttribute").val(data.unitAttribute);	//单位属性
			$("#postNature").val(data.postNature);			//岗位性质

			form.render();
			
            // 打开详情页面;可用于编辑和新增员工弹出框
            layer.open({
                type: 1
                ,skin: 'demo-class'
                ,title: '认证信息详情'
                ,area: ['800px', '400px']
                ,offset: '100px' 			//只定义top坐标，水平保持居中
                ,shade:['0.3','#000']
                ,maxmin: true
                ,content:$('#detail')
                ,btn: ['确认','取消']
                ,yes: function(index,layero){
                    $.ajax({
                        type:"POST",
                        dataType: 'json',
                        url:js_path+'/InvitationUser/update',
                        data:{'id':data.id,'json':JSON.stringify(getEntity())},
                        success: function(data) {
                            if(data.code == 200){
                                layer.msg('修改成功!', {icon: 6});
                                queryDynamic();
							}
                        }
                    });
                    layer.closeAll();
                }
            });
            //日期选择器
            laydate.render({
                elem: '#date1'
                ,type: 'date' //默认，可不填
            });
		}else if(layEvent == 'del'){
		    //打开一个询问框
            layer.confirm('确定要删除?删除后数据不可恢复！', {icon: 3, title:'提示'}, function(index){
                $.ajax({
                    type:"POST",
                    dataType: 'json',
                    url:js_path+'/InvitationUser/delete',
                    data:{'id':data.id},
                    success: function(data) {
                        if(data.code == 200){
                            layer.msg('删除成功!!!', {icon: 6});
                            queryDynamic();
                        }
                    },
                });
                layer.close(index);
            });
		}
	});
	
	//新增员工
    $("#addEmp").click(function(){
    	//弹出新增员工框
    	  layer.open({
              type: 1//layer提供了5种层类型。可传入的值有：0（信息框，默认）1（页面层）2（iframe层）3（加载层）4（tips层）。 若你采用layer.open({type: 1})方式调用，则type为必填项（信息框除外）
              ,skin: 'demo-class'//样式类名
              ,title: '新增员工'//标题
              ,area: ['800px', '400px']
              ,offset: '100px' 			//只定义top坐标，水平保持居中
              ,shade:['0.3','#000']//默认是0.3透明度的黑色背景（'#000'）。如果你想定义别的颜色，可以shade: [0.8, '#393D49']；如果你不想显示遮罩，可以shade: 0
              ,maxmin: true//该参数值对type:1和type:2有效。默认不显示最大小化按钮。需要显示配置maxmin: true即可
              ,content:$('#detail')//要弹的层detail
              ,btn: ['确认','取消']//按钮
    	      ,yes: function(index,layero){//类型：Function，默认：null
    	    	 // 该回调携带两个参数，分别为当前层索引、当前层DOM对象。如：
				//JSON.stringify() 方法用于将 JavaScript 值转换为 JSON 字符串。
			
               $.ajax({
                   type:"POST",
                   dataType: 'json',
                   url:js_path+'/InvitationUser/add',
                   data:{'json':JSON.stringify(getEntity())},
                   success: function(data) {
                       if(data.code == 200){
                           layer.msg('添加成功!', {icon: 6});// 提示框3秒消失 
                           queryDynamic();//把数据渲染到首页
						}
                   }
               });
               layer.closeAll();
           }

          });
 	   
    });
	

	
	//下载模板
    $("#downLoadTemplateBtn").click(function(){
 	   $('#downLoadTemplateForm').submit();
    });

	
    //下载用户资料
	$("#downLoadBtn").on("click",function(){
	    $("#idcard2").val($.trim($("#idcard").val()));
        $("#phone2").val($.trim($("#phoneNumber").val()));
        $("#userId2").val($.trim($("#status").val()));
		$("#downLoadForm").submit();
	});

	//数据导入
    upload.render({
        url: js_path+'/InvitationUser/import'
        ,elem: '#import' 		//指定原始元素，默认直接查找class="layui-upload-file"
        ,method: 'post' 		//上传接口的http类型
        ,accept:'file'			//允许上传类型可选值有：images（图片）、file（所有文件）、video（视频）、audio（音频）
        ,before: function(obj){
        	console.log(obj);
        	layer.msg('正在导入,请稍后...', {icon: 6}); 
        },done: function(res, index, upload){  //上传成功之后的回调
        	if(res.code == 200){
        		layer.msg('导入成功!', {icon: 6}); 
        		queryDynamic();
        	}
        }
    });

	//将日期直接嵌套在指定容器中
	laydate.render({ 
		elem: '#birthdateId'
		,type: 'date'
		//,range: true //或 range: '~' 来自定义分割字符
	});

    //获取修改的信息
    function getEntity(){
        var entity = new Object();
        entity.realName=$('#realName').val();
        entity.sex=$('input:radio[name=sex]:checked').val();
        entity.birthTime = $("#date1").val()+" 10:00:00";
        entity.growingPlace = $("#growingPlace").val();
        entity.education = $("#education").val();
        entity.height = $("#height").val();
        entity.idcard = $("#idcard_2").val();
        entity.phone = $("#phone").val();

		entity.nation = $("#nation").val();
		entity.politicalVisage = $("#face").val();
		entity.birthplace = $("#birthplace").val();
		entity.workUnit = $("#workUnit").val();
		entity.maritalStatus = $('#maritalStatus').val();
        entity.unitAttribute=$("#unitAttribute").val();	//单位属性
        entity.postNature=$("#postNature").val();			//岗位性质

        return entity;
    }
	
	// 获取查询参数
	function getQueryParam(){
		//此处仅供测试，实际需要读取标签值
		var t = new Object();
		var invitationUserVo = new Object();
		invitationUserVo.page=currentPage;
		invitationUserVo.pageSize=10;
		// 认证表，默认查询待审核状态的
		t.idcard=$.trim($("#idcard").val());
		t.phone=$.trim($("#phoneNumber").val());
		t.userId = $.trim($("#status").val());
		invitationUserVo.t=t;
		return JSON.stringify(invitationUserVo);
	}

});
</script>
</body>
</html>