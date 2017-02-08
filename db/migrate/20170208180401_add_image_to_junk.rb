class AddImageToJunk < ActiveRecord::Migration[5.0]
  def change
    add_column :junks, :image, :string
  end
end
