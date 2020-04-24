class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :events
  has_many :posts, through: :events
  has_one :profile, dependent: :destroy
  has_many :event_groups, through: :events
  has_many :group_members
  has_many :connections


end
