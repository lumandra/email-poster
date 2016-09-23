class AddColumnUrlToEmail < ActiveRecord::Migration[5.0]
  def change
    add_column :emails, :img_urls, :json
  end
end
