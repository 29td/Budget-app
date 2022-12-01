class Record < ApplicationRecord
  validates :name, presence: true
  validates :amount, numericality: { only_integer: false, greated_than_or_equal_to: 0 }

  has_many :groups, through: :records
  belongs_to :group
  belongs_to :author, class_name: 'User'
end
