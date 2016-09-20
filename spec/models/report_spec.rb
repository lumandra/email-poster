require 'rails_helper'

RSpec.describe Report, type: :model do

  it { is_expected.to respond_to :title }
  it { is_expected.to respond_to :users }
  it { is_expected.to respond_to :email_to }

  context 'validate' do
    it "is not valid with exist a email_to" do
      Report.create(email_to: 'test@test.com')

      same_report = Report.new(email_to: 'test@test.com')
      expect(same_report).to_not be_valid
    end

    it "is valid with not exist a email_to" do
      Report.create(email_to: 'test@test.com')

      report = Report.new(email_to: 'test1@test.com')
      expect(report).to be_valid
    end
  end

end
