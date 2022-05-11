$(".btn-join-group").on('click', function() {
    var user_id = $(this).data("user-id");
    var group_id = $(this).data("group-id");

    $.ajax({
        type: "POST",
        url: `/groups/${group_id}/join_group`,
        data: {
            user_id: user_id
        },
        success: function(data) {
            if (data.success){
                $(".btn-join-group").text("Đã gửi yêu cầu tham gia");
            } else {
                console.log();
            }
        }
    });
});