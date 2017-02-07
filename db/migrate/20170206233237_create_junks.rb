class CreateJunks < ActiveRecord::Migration[5.0]
  def change
    create_table :junks do |t|
      t.string :name
      t.string :img_url
      t.string :url
      t.string :note
      t.integer :user_id
      t.integer :tag_id
    end
  end
end
