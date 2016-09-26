require 'rails_helper'

RSpec.describe User, type: :model do

  it { is_expected.to respond_to :email }

  context 'validate' do
    it "is not valid with incorrect email" do
      user1 = User.new(email: 'test@tescom', password: 'password')
      expect(user1).to_not be_valid
    end

    it "is valid with correct email" do
      user = User.new(email: 'test1@test.com', password: 'password')
      expect(user).to be_valid
    end
  end

end