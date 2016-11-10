class ChangeColumnInEmails < ActiveRecord::Migration[5.0]
  def change
    change_column :emails, :images, :text
    rename_column :emails, :images, :html
  end
end
