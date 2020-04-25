class AddSocialToProfiles < ActiveRecord::Migration[6.0]
  def change
    add_column :profiles, :twitter, :string
    add_column :profiles, :facebook, :string
    add_column :profiles, :instagram, :string
  end
end
