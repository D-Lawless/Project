class CreateGroupMembers < ActiveRecord::Migration[6.0]
  def change
    create_table :group_members do |t|
      t.references :event_group
      t.integer :user_id, unique: true
      t.boolean :is_admin
      t.timestamps
    end
  end
end
