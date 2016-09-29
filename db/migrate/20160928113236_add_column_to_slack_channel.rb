class AddColumnToSlackChannel < ActiveRecord::Migration[5.0]
  def change
    add_column :slack_channels, :title, :string
  end
end
