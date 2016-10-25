class AddColumnProcessingTypeToReports < ActiveRecord::Migration[5.0]
  def change
    add_column :reports, :processing_type, :integer, default: 0
  end
end
