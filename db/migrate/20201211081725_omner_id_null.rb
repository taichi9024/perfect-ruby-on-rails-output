class OmnerIdNull < ActiveRecord::Migration[6.0]
  def up
    change_column_null :events, :owner_id, true
  end

  def down
    change_column_null :events, :owner_id, false
  end
  
end
