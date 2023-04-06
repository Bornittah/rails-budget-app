class CategoryDetail < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  belongs_to :categories, class_name: 'Category', foreign_key: 'category_id'

  validates :name, presence: true
  validates :amount, presence: true
end
