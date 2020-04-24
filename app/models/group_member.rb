class GroupMember < ApplicationRecord

  belongs_to :event_group
  has_many :users
  belongs_to :user

end
