class User < ApplicationRecord
  belongs_to :group
  belongs_to :user
end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

has_many :groups
has_many :posts

has_many :group_relationships
has_many :participated_groups, :through => :group_relationships, :source => :group

has_many :group_relationships
has_many :members, through: :group_relationships, source: :user
    
end
