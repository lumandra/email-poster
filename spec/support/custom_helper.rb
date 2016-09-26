module CustomHelper
  def create_user_and_reports
    @user = FactoryGirl.create(:user)
    @report = FactoryGirl.create(:report, user_id: @user.id)
    sign_in(@user)
  end
end