class Group < ApplicationRecord
  has_one_attached :image

  validates :name, presence: true
  validates :image, presence: true

  has_many :records, dependent: :delete_all
  belongs_to :author, class_name: 'User'

  def total_records
    records.size
  end

  def total_records_amount
    records.sum(:amount)
  end
end
