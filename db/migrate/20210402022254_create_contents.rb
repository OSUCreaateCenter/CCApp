class CreateContents < ActiveRecord::Migration[5.0]
  def change
    create_table :contents do |t|
      t.string :name,null: false, default: ""
      t.text :text,null: false,default: ""
      t.integer :category_id,null: false
      t.string :image_id
      t.timestamps
    end
  end
end
