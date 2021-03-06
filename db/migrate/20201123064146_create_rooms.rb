class CreateRooms < ActiveRecord::Migration[6.0]
  def change
    create_table :rooms do |t|
      t.string :room_name,           null: false
      t.string :room_description,    null: false
      t.bigint :owner_id,            null: false
      t.timestamps
    end
  end
end
