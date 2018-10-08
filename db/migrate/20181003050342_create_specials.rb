class CreateSpecials < ActiveRecord::Migration[5.2]
  def change
    create_table :specials do |t|
      t.text :name
      t.integer :run_length
      t.text :image_url

      t.timestamps null:false
    end
  end
end
