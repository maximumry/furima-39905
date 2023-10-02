class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.string :name
      t.text :info
      t.integer :category_id
      t.integer :condition_id
      t.integer :burden_info_id
      t.integer :prefecture_id
      t.integer :shipping_day_id
      t.integer :price
      t.references :user
      t.timestamps
    end
  end
end
