require 'rails_helper'

RSpec.describe Report, type: :model do

  it { is_expected.to respond_to :title }
  it { is_expected.to respond_to :user }
  it { is_expected.to respond_to :email_to }

  context 'validate' do
    it "is not valid with exist a email_to" do
      Report.create(email_to: 'test@test.com', title: "Test")

      same_report = Report.new(email_to: 'test@test.com', title: "Test")
      expect(same_report).to_not be_valid
    end

    it "is valid with not exist a email_to" do
      Report.create(email_to: 'test@test.com', title: "Test")

      report = Report.new(email_to: 'test1@test.com', title: "Test")
      expect(report).to be_valid
    end
  end

end
