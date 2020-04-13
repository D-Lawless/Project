class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.string :title
      t.text :description
      t.string :location
      t.string :photo
      t.integer :roles
      t.datetime :start_dt
      t.datetime :end_dt
      t.integer :user_id

      t.timestamps
    end
  end
end
