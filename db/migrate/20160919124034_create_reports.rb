class CreateReports < ActiveRecord::Migration[5.0]
  def change
    create_table :reports do |t|
      t.string :title
      t.string :email_to

      t.timestamps
    end

    create_table :reports_users, id: false do |t|
      t.belongs_to :user, index: true
      t.belongs_to :report, index: true
    end
  end
end
