class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.string :artist
      t.string :venue
      t.string :location
      t.integer :user_id
  end
end
end
