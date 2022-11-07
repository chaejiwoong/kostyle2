    var authService = (function(){
        console.log("auth Module.......");
        function insert(member, callback, error){
            $.ajax({
                type : "post",
                url : "/auth/register",
                data : JSON.stringify(member),
                contentType : "application/json; charset=UTF-8",
                success: function (result, status, xhr) {
                    if (callback) {
                        callback(result);
                    }
                },
                error: function (xhr, status, er) {
                    if (error) {
                        error(xhr);
                    }
                }
            })
        }

        function findId(member, callback, error) {
            $.ajax({
                type: 'post',
                url: "/auth/findId",
                data: JSON.stringify(member),
                contentType : "application/json; charset=UTF-8",
                success: function (result, status, xhr) {
                    if (callback) {
                        callback(result);
                    }
                },
                error: function (xhr, status, er) {
                    if (error) {
                        error(xhr);
                    }
                }
            })
        }

        function changePw(member, callback, error) {
            $.ajax({
                type: 'put',
                url: "/auth/updatePw",
                data: JSON.stringify(member),
                contentType : "application/json; charset=UTF-8",
                success: function (result, status, xhr) {
                    if (callback) {
                        callback(result);
                    }
                },
                error: function (xhr, status, er) {
                    if (error) {
                        error(xhr);
                    }
                }
            })
        }

        return {insert:insert, findId: findId, changePw: changePw};
    })();// 즉시 실행함수