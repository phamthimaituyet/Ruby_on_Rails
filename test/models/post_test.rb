require "test_helper"

class PostTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "Thuoc tinh co ton tai hay khong" do
    post = Post.new                     
    assert post.invalid?                
    # kiểm tra xem các thuộc tính của lớp tương ứng có hợp lệ hay không 
    # dựa trên các phương thưcs validates -> không hợp lệ vì k có giá trị 
    # -> trong rails sẽ gán 1 chuỗi thông báo lỗi ứng với từng thuộc tính vào thuộc tính errors 
    assert post.errors[:title].any?
    # thông qua phương thức any? -> kiểm tra xem các phần tử của mỗi thuộc tính tương ứng trong errors có tồn tại hay không 
  end

  test "Luu bai viet" do
    post = Post.new
    assert_not post.save 
  end
end
