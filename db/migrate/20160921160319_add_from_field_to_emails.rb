class AddFromFieldToEmails < ActiveRecord::Migration[5.0]
  def change
    add_column :emails, :email_from, :string
  end
end
