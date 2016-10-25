class AddImagesFiledToEmails < ActiveRecord::Migration[5.0]
  def change
    add_column :emails, :images, :json
  end
end
