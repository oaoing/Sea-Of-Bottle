/**
 * 게시글 리플과 관련된 javascript 모듈화+
 */

console.log("Reply Module..............");


var replyService = (function() {

	function add(reply, callback, error) {
		console.log("reply.......");
		$.ajax({
			type : 'post',
			url : '/replies/new',
			data : JSON.stringify(reply),
			contentType : "application/json; charset=utf-8",
			success : function(result, status, xhr) {
				if (callback) {
					callback(result);
				}
			},
			error : function(result, status, xhr) {
				if (error) {
					error(er);
				}
			}
		})
	}

	function getList(param, callback, error) {
		var bno = param.labelid;
		console.log(bno);
		$.getJSON("/replies/pages/" + bno + ".json",
				function(data) {
					if (callback) {
						callback(data);
					}
				}).fail(function(xhr, status, err) {
			if (error) {
				error();
			}
		});
	}
	
	function getMyList(param, callback, error) {
		var bno = param.customerno;
		console.log(bno);
		$.getJSON("/replies/my/" + bno + ".json",
				function(data) {
					if (callback) {
						callback(data);
					}
				}).fail(function(xhr, status, err) {
			if (error) {
				error();
			}
		});
	}
	
	function displayTime(timeValue){
		var dateObj = new Date(timeValue);
		var year=dateObj.getFullYear();//네자리수 연도
		var month=dateObj.getMonth()+1;//월은 0부터 시작해서 1을 더해줘야함
		var day=dateObj.getDate();
		var hour = dateObj.getHours();
		var minute = dateObj.getMinutes();
		var second = dateObj.getSeconds();
		
		return year+"/"+month+"/"+day;
		
		
	}
	
	function remove(replyno, callback, error){
		$.ajax({
			type: 'delete',
			url: '/replies/del/' + replyno,
			success: function(deleteResult, status, xhr){
				if(callback){
					callback(deleteResult);
				}
			},
			error: function(xhr, status, err){
				if(error){
					error(err);
				}
			}
		});
	}
	
	
	return {
		add : add,
		getList : getList,
		displayTime : displayTime,
		getMyList : getMyList,
		remove : remove
	};
})();
