require 'rails_helper'

RSpec.describe User, type: :model do
  it { should have_many(:digitization_agsks) }

  describe 'method "author_of?":' do
    let(:user) { create(:user) }

    it "valid author" do
      digitization_agsk = create(:digitization_agsk, user: user )
      expect(user).to be_author_of(digitization_agsk)
    end

    it "invalid author" do
      invalid_user = create(:user)
      digitization_agsk = create(:digitization_agsk, user: user )
      expect(invalid_user).to_not be_author_of(digitization_agsk)
    end
  end
end
