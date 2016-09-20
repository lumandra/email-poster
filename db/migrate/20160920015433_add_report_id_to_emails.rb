class AddReportIdToEmails < ActiveRecord::Migration[5.0]
  def change
    add_reference :emails, :report, index: true
  end
end
