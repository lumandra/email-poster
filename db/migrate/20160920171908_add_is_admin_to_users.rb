class AddIsAdminToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :is_admin, :boolean, default: false

    user = User.new email: "admin@user.com", password: '1qaz!QAZ', password_confirmation: '1qaz!QAZ', is_admin: true
    user.skip_confirmation!
    user.save!
  end
end
