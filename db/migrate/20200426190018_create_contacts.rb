class CreateContacts < ActiveRecord::Migration[6.0]
  def change
    create_table :contacts do |t|
      t.integer :sender
      t.integer :receiver
      t.boolean :confirmed
      t.timestamps
    end
  end
end
