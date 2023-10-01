class CreateRooms < ActiveRecord::Migration[7.0]
  def change
    create_table :rooms do |t|
      t.boolean :extension, null: false, default: false
      t.references :item, null: false, foreign_key: true
      t.timestamps
    end
  end
end
