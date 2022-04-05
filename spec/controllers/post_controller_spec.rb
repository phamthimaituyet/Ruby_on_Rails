require 'rails_helper'


RSpec.configure do |config|
    config.include Devise::Test::ControllerHelpers, type: :controller
  end

# test action new 

RSpec.describe PostsController, type: :controller do
  describe "POST #new" do
    it "new post" do
        get :new
        expect(assigns(:post)).to be_a_new(Post)
    end
  end
end