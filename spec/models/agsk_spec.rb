require 'rails_helper'

RSpec.describe Agsk, type: :model do
  it { is_expected.to belong_to(:user) }

  it { is_expected.to validate_presence_of(:requirement) }
  it { should validate_uniqueness_of(:requirement) }
end
