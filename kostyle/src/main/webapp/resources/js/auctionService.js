var auctionService = function (){

    function register(auction, callback, error) {

        $.ajax({
            url: "/admin/auctions/register",
            type: 'post',
            data: JSON.stringify(auction),
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
    
    function update(auction, callback, error) {

        $.ajax({
            url: "/admin/auctions/" + auction.apno,
            type: 'put',
            data: JSON.stringify(auction),
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
    
    function deleteAuction(auction, callback, error) {

        $.ajax({
            url: "/admin/auctions/" + auction,
            type: 'delete',
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

    return {register:register, update:update, deleteAuction:deleteAuction};
}();