require 'rails_helper'

RSpec.describe User, type: :model do
  it { should have_many(:agsks) }

  describe 'method "author_of?":' do
    let(:user) { create(:user) }

    it "valid author" do
      agsk = create(:agsk, user: user )
      expect(user).to be_author_of(agsk)
    end

    it "invalid author" do
      invalid_user = create(:user)
      agsk = create(:agsk, user: user )
      expect(invalid_user).to_not be_author_of(agsk)
    end
  end
end
