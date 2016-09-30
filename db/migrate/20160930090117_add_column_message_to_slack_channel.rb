class AddColumnMessageToSlackChannel < ActiveRecord::Migration[5.0]
  def change
    add_column :slack_channels, :slack_message_text, :text
  end
end
