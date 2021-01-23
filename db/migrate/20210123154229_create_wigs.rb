class CreateWigs < ActiveRecord::Migration[6.0]
  def change
    create_table :wigs do |t|
      t.string :color
      t.string :name
      t.text :description
      t.string :material
      t.string :style
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
