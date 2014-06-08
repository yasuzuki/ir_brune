class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.integer :device_id
      t.string :name
      t.string :description
      t.string :format
      t.string :freq
      t.text :data

      t.timestamps
    end
  end
end
