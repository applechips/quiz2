class AddColumnToRequests < ActiveRecord::Migration[5.0]
  def change
    remove_column :requests, :completed, :string
    add_column :requests, :status, :boolean
  end
end
