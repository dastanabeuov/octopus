class Agsk < ApplicationRecord

  enum formalizability: { formalizable: 0, not_formalized: 1, reference: 2 } # , _suffix: :status
  
  belongs_to :user

  validates :requirement, presence: true, uniqueness: true

  #imported data agsks
  def self.start_import(file, user)
    ImportForAgsk.new(file, user).import
  end
end
