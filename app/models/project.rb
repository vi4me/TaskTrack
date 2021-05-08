class Project < ApplicationRecord

  belongs_to :user
  has_many :tasks, dependent: :destroy

  validates :complexity, numericality: { less_than_or_equal_to: 5,
                                         only_integer: true,
                                         greater_than: 0 }
  validates :title, presence: true,
                    length: { maximum: 50 }
                    
end
