<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<html>
<head>
<title>注册卡列表</title>
<style type="text/css">
    .modal-dialog{
        max-width: 420px;
    }
    .pagination{
    	float: right;
    }
    #searchForm{
    	margin: 0px 5px 5px 5px;
    }
    #searchForm .form-group{
    	margin: 5px;
    }
</style>
</head>
<body>
	
	<form class="form-inline" action="" method="get" id="searchForm">
		<div class="form-inline">
			<div class="form-group">
				<label for="inputkeysetid">卡类</label>
				<select class="form-control" name="keysetid" id="inputkeysetid">
					<option value=''>全部</option>
					<c:forEach items="${keysets}" var="keyset">
					<option value="${keyset.id}">${keyset.keyname}</option>
					</c:forEach>
				</select>
			</div>
			<div class="form-group">
				<label for="inputadminid">管理员</label>
				<select class="form-control" name="adminid" id="inputadminid">
					<option value=''>全部</option>
					<c:forEach items="${admins}" var="admin">
					<option value="${admin.id}">${admin.username}</option>
					</c:forEach>
				</select>
			</div>
			<div class="form-group">
				<label for="inputstatus">状态</label>
				<select class="form-control" name="status" id="inputstatus">
					<option value=''>全部</option>
					<option value=0>激活</option>
					<option value=1>已锁定</option>
					<option value=2>已删除</option>
					<option value=3>已使用</option>
				</select>
			</div>
		</div>
		<div class="form-inline">
			<div class="form-group">
				<label for="inputusername">用户名</label>
				<input type="text" class="form-control" id="inputusername" name="username" placeholder="用户名">
			</div>
			<div class="form-group">
				<label for="inputcdkey">注册卡</label>
				<input type="text" class="form-control" id="inputcdkey" name="cdkey" placeholder="注册卡">
			</div>
			<div class="form-group">
				<label for="inputtag">标签</label>
				<input type="text" class="form-control" id="inputtag" name="tag" placeholder="标签">
			</div>
			<div class="form-group">
				<label for="inputordernum">订单号</label>
				<input type="text" class="form-control" id="inputordernum" name="ordernum" placeholder="订单号">
			</div>
			<div class="form-group">
				<button type="submit" class="btn btn-primary">搜索</button>
			</div>
		</div>
	</form>
		
	<div class="table-responsive">
		<div class="form-inline">
			<button class="btn btn-default" type="button" data-toggle="modal" data-target="#delselModal"><span class="glyphicon glyphicon-minus"></span>删除</button>
			<button class="btn btn-default" type="button" data-action="locksel" title="锁定"><span class="glyphicon glyphicon glyphicon-ban-circle" tabindex="0" role="button"></span>锁定</button>
			<button class="btn btn-default" type="button" data-action="unlocksel" title="解锁"><span class="glyphicon glyphicon glyphicon-ok-circle" tabindex="0" role="button"></span>解锁</button>
		</div>
		<table class="table table-striped table-hover" id="cdkeytable">
			<thead>
				<tr>
					<th><input type="checkbox" /></th>
					<th>id</th>
					<th>所属</th>
					<th>卡类</th>
					<th>生成时间</th>
					<th>卡号</th>
					<th>标签</th>
					<th>天数</th>
					<th>使用时间</th>
					<th>用户名</th>
					<th>订单号</th>
					<th>操作</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${cdkeys}" var="cdkey">
					<tr>
						<td><input type="checkbox" /></td>
						<td>${cdkey.id}</td>
						<td>${cdkey.adminname}</td>
						<td>${cdkey.keyname}</td>
						<td><fmt:formatDate value="${cdkey.addtime}" pattern="YYYY-MM-dd HH:mm" /></td>
						<td>${cdkey.cdkey}</td>
						<td>${cdkey.tag}</td>
						<td>${cdkey.cday}</td>
						<td><fmt:formatDate value="${cdkey.usedtime}" pattern="YYYY-MM-dd HH:mm" /></td>
						<td data-userid="${cdkey.userid}">${cdkey.username}</td>
						<td>${cdkey.ordernum}</td>
						<td>
							 <a data-action="del" data-toggle="modal" data-target="#delselModal" href="#" title="删除"><span class="glyphicon glyphicon-remove" tabindex="0" role="button" data-trigger="focus"></span></a>
							 <c:choose>
							 <c:when test="${cdkey.status eq '已锁定'}">
							 	<a data-action="lock" data-toggle="modal" href="#" title="解锁"><span class="glyphicon glyphicon-ok-circle" tabindex="0" role="button" data-trigger="focus"></span></a>
							 </c:when>
							 <c:when test="${cdkey.status eq '激活'}">
							 	<a data-action="lock" data-toggle="modal" href="#" title="锁定"><span class="glyphicon glyphicon-ban-circle" tabindex="0" role="button" data-trigger="focus"></span></a>
							 </c:when>
							 </c:choose>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<ul id="pagination" class="pagination"></ul>
	</div>

	<div class="modal fade" id="delselModal" tabindex="-1" role="dialog" aria-labelledby="delselModalLabel">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="delselModalLabel">删除</h4>
				</div>
				<div class="modal-body">
					<p id="delcontent">确认删除这一行么</p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
					<button type="button" class="btn btn-primary" data-action="delsel">删除</button>
				</div>
			</div>
		</div>
	</div>
	
	
	<script src="/static/js/checkbox.js"></script>
	<script src="/static/js/cdkeylist.js"></script>
	<script type="text/javascript">
	softid= ${softid};
	$(function() {
		param={
				keysetid:"${search.keysetid}",
				adminid:"${search.adminid}",
				status:"${search.status.code}",
				username:"${search.username}",
				cdkey:"${search.cdkey}",
				tag:"${search.tag}",
				ordernum:"${search.ordernum}"
		};
		
		$('#inputkeysetid').multiselect({nonSelectedText:"请选择",disableIfEmpty: true}).multiselect('select', [param.keysetid]).multiselect('refresh');
		$('#inputadminid').multiselect({nonSelectedText:"请选择",disableIfEmpty: true}).multiselect('select', [param.adminid]).multiselect('refresh');
		$('#inputstatus').multiselect().multiselect('select', [param.status]).multiselect('refresh');
		$('#inputusername').val(param.username);
		$('#inputcdkey').val(param.cdkey);
		$('#inputtag').val(param.tag);
		$('#inputordernum').val(param.ordernum);
		
		var searchstr = $("#searchForm").serialize();

		/* 初始化页数 */
		var results = '${count}';
		$('#pagination').twbsPagination({
			totalPages : Math.floor(results / 20 + 1),
			visiblePages : 5,
			href : '?pageNo={{pageNo}}&pageSize=20&'+$("#searchForm").serialize(),
			hrefVariable : '{{pageNo}}',
			onPageClick : function(event, page) {
			}
		});
		
	});
	</script>
</body>

</html>