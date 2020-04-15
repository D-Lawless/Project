class CreateProfiles < ActiveRecord::Migration[6.0]
  def change
    create_table :profiles do |t|
      t.string :f_name
      t.string :l_name
      t.string :role
      t.string :profile_pic
      t.text :bio
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
