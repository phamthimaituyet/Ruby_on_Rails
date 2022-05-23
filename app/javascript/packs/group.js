// xử lý request join group
$(".btn-join-group").on('click', function() {
    var user_id = $(this).data("user-id");
    var group_id = $(this).data("group-id");

    var join_group = $(this)

    $.ajax({
        type: "POST",
        url: `/groups/${group_id}/join_group`,
        data: {
            user_id: user_id
        },
        success: function(data) {
            if (data.success){
                if(join_group.hasClass('sended')){
                    join_group.text("Tham gia nhóm");
                }else{
                    join_group.text("Đã gửi yêu cầu tham gia");
                }
                
                join_group.toggleClass("sended");
            } else {
                console.log();
            }
        }
    });
});

// tab pending 
var tabLinks = document.querySelectorAll(".tablinks");
var tabContent =document.querySelectorAll(".tabcontent");

tabLinks.forEach(function(el) {
    el.addEventListener("click", openTabs);
});

function openTabs(el) {
    var btn = el.currentTarget; // lắng nghe sự kiện và hiển thị các element
    var post = btn.dataset.post; // lấy giá trị trong data-post

    tabContent.forEach(function(el) {
        el.classList.remove("active");
    }); //lặp qua các tab content để remove class active

    tabLinks.forEach(function(el) {
        el.classList.remove("active");
    }); //lặp qua các tab links để remove class active

    document.querySelector("#" + post).classList.add("active");
    // trả về phần tử đầu tiên có id="" được add class active
    
    btn.classList.add("active");
    // các button mà click vào sẽ được add class active
}

// Accpect member group
$(".btn-accept-join-group").on('click', function(){
    var status = $(this).data("status");
    var user_id = $(this).data("user-id");
    var group_id = $(this).data("group-id");
    var accept_join_group = $(this)

    $.ajax({
        type: "POST",
        url: `/groups/${group_id}/accept_join_group`,
        data: {
            user_id: user_id,
            status: status
        },
        success: function(data){
            if (data.success){
                accept_join_group.parent().css("display","none");
                alert("Da accept thanh cong!");
            }
        }
    });
});

// reject 
$(".btn-reject-join-group").on('click', function(){
    var status = $(this).data("status");
    var user_id = $(this).data("user-id");
    var group_id = $(this).data("group-id");
    var reject_join_group = $(this)

    $.ajax({
        type: "POST",
        url: `/groups/${group_id}/accept_join_group`,
        data: {
            user_id: user_id,
            status: status
        },
        success: function(data){
            if (data.success){
                reject_join_group.parent().css("display","none");
                alert("Da reject thanh cong!");
            }
        }
    });
});