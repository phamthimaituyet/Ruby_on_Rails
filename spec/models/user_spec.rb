require 'rails_helper'


# test validate 
RSpec.describe User, type: :model do
    describe User do
      it { should validate_presence_of(:email) }
      it { should validate_presence_of(:password) }
      it { should validate_length_of(:password) }
      end    
end

#test associations 
RSpec.describe User, type: :model do
  describe "associations" do
    it { should have_many(:posts) }
  end
end