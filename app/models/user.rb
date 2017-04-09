class User < ApplicationRecord
  belongs_to :group
  belongs_to :user

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

has_many :group_relationships
has_many :members, through: :group_relationships, source: :user

def is_member_of?(group)
      participated_groups.include?(group)
    end
end
