class DigitizationAgsk < ApplicationRecord
  enum formalizability: { formalizable: 0, not_formalized: 1, reference: 2 } # , _suffix: :status
  
  belongs_to :user
end
