class Event < ApplicationRecord

  belongs_to :user
  has_many :posts, dependent: :destroy
  has_one :event_group, dependent: :destroy
  has_one_attached :cover_photo

end
