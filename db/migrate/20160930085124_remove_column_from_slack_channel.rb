class RemoveColumnFromSlackChannel < ActiveRecord::Migration[5.0]
  def change
    remove_column :slack_channels, :title
    remove_column :slack_channels, :username
    remove_column :slack_channels, :channel
  end
end
