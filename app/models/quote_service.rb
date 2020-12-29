class QuoteService < ApplicationRecord
  belongs_to :quote, optional: true
  belongs_to :service, optional: true
end