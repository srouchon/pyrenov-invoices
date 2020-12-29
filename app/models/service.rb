class Service < ApplicationRecord
  belongs_to :company
  has_many :quote_services
  has_many :bill_services
  has_many :quotes, through: :quote_services
  has_many :bills, through: :bill_services
  
  validates :ref_service, presence: true
  validates :description_service, presence: true
  validates :unit_price, presence: true
end