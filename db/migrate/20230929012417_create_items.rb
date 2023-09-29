class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.text :text
      t.timestamps
    end
  end
end
