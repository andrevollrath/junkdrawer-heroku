class AddVisible < ActiveRecord::Migration[5.0]
  def change
    add_column :junks, :visible, :integer
  end
end
