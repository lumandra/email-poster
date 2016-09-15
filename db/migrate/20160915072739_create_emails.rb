class CreateEmails < ActiveRecord::Migration[5.0]
  def change
    create_table :emails do |t|
      t.references :user
      t.string     :subject
      t.text       :body
      t.json       :attachments

      t.timestamps
    end
  end
end
