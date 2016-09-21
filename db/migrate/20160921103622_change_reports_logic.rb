class ChangeReportsLogic < ActiveRecord::Migration[5.0]
  def change
    drop_table :reports_users

    remove_column :emails, :user_id
    add_column :emails, :status, :integer, default: 0
    add_column :emails, :error_message, :string

    add_column :reports, :user_id, :integer
  end
end
