class CreateEventGroups < ActiveRecord::Migration[6.0]
  def change
    create_table :event_groups do |t|
      t.references :event

      t.timestamps
    end
  end
end
