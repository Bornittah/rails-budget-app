class Category < ApplicationRecord
  belongs_to :users, class_name: 'User', foreign_key: 'user_id'
  has_many :category_details, class_name: 'CategoryDetail'

  validates :name, presence: true, length: { in: 1..50 }
  validates :icon, presence: true
end
