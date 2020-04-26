class GroupMember < ApplicationRecord

  validates :f_name, presence: true


  belongs_to :event_group
  has_many :users
  belongs_to :user

end
