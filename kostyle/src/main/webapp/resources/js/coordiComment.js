var commentService = (function(){

	//댓글 시간 처리
    function displayTime(timeValue) {

        var today = new Date();
        var gap = today.getTime() - timeValue;
        var dateObj = new Date(timeValue);
        var str = "";

        //24시간이 지나지 않은 댓글 (hh:mi:ss)
        if(gap < (1000 * 60 * 60 * 24)){
            var hh = dateObj.getHours();
            var mi = dateObj.getMinutes();
            var ss = dateObj.getSeconds();

            return[(hh>9?'':'0')+hh, ':', (mi>9?'':'0')+mi, ':', (ss>9?'':'0')+ss].join('');
        }

        //24시간이 지난 댓글 (yyyy/MM/dd)
        else{
            var yy = dateObj.getFullYear();
            var mm = dateObj.getMonth();
            var dd = dateObj.getDate();

            return [yy, '/', (mm>9?'':'0')+mm, '/', (dd>9?'':'0')+dd].join('');
        }
    };



    //댓글 목록 가져오기
    function getCommentList(params, callback) {

        var cno = params.cno;
        var page = params.page || 1;
        
       $.ajax({
        url : '/coordiComments/',
        type : 'get',
        data:{
        	cno:cno,
        	page:page
        },
        dataType : 'json',
        success : function(data) {

            console.log("댓글 목록 가져오기 성공")

            if(callback){
                callback(data.c_count, data.list)
            }    
        }      
       })
    };
    
     //댓글 작성
    function addComment(comment, callback) {
        
        $.ajax({
            url:'/coordiComments/register/',
            type:'post',
            data:JSON.stringify(comment),
            contentType:"application/json; charset=utf-8",
            success:function (data, status) {
            	console.log("댓글 등록 성공")
            	callback(data)             
            },
            error:function (xhr) {
					self.location = "/auth/login"
					console.log(xhr)   
			}
        })        
    }
    
    //댓글 삭제
    function removeComment(ccno, callback) {
        $.ajax({
            url:'/coordiComments/' + ccno,
            type:'delete',
            success:function (data,status) {
            	console.log(data);
			  	callback() 
            }
        });
    }
    



    return {
    	displayTime : displayTime,
        getCommentList : getCommentList,
        addComment : addComment,
        removeComment : removeComment
    };

})();