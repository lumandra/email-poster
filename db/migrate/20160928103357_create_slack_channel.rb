class CreateSlackChannel < ActiveRecord::Migration[5.0]
  def change
    create_table :slack_channels do |t|
      t.string      :webhook_url
      t.string      :channel
      t.string      :username
      t.integer     :report_id

      t.timestamps
    end
  end
end
