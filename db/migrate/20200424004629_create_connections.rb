class CreateConnections < ActiveRecord::Migration[6.0]
  def change
    create_table :connections do |t|
      t.string :sender
      t.string :receiver
      t.boolean :confirmed
      t.timestamps
    end
  end
end
