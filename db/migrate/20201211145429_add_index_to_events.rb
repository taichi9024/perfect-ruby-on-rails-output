class AddIndexToEvents < ActiveRecord::Migration[6.0]
  def change
    change_column :events, :owner_id, :integer, index: true
  end
end
