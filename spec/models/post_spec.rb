require 'rails_helper'

# test db 
RSpec.describe Post, type: :model do
  describe "db schema" do
    context "columns" do
      it { should have_db_column(:title).of_type(:string) }
      it { should have_db_column(:content).of_type(:text) }
    end
  end
end

# test validate 
RSpec.describe Post, type: :model do
    describe Post do
      it { should validate_presence_of(:title) }
      it { should validate_presence_of(:content) }
      end    
end

RSpec.describe Post, type: :model do
  describe "associations" do
    it { should belong_to(:user) }
  end
end