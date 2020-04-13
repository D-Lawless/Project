class AddEventRefToPosts < ActiveRecord::Migration[6.0]
  def change
    add_reference :posts, :event, null: false, foreign_key: true
  end
end
