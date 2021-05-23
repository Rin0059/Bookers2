class Book < ApplicationRecord
  belongs_to :user

  validates :title, presence: true
  validates :body, presence: true

  has_many :book_comments, dependent: :destroy

end
