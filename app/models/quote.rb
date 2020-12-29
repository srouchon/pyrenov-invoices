class Quote < ApplicationRecord
  belongs_to :customer
  has_one :company, through: :customers
  has_many :quote_services, dependent: :destroy
  has_many :services, through: :quote_services
  enum quote_status: { brouillon: 0, envoyé: 1, accepté: 2, échoué: 3 }
  
  validates :ref_quote, presence: true
  validates :description, presence: true
  validates :date, presence: true
end
