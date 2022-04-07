require 'rails_helper'

RSpec.describe ImportForAgsk do
  describe 'import' do
    let(:user) { create(:user) }
    file = File.new(Rails.root + 'spec/support/file/sample.xlsx')
    subject { ImportForAgsk.new(file, user) }

    it 'calls ImportForAgsk#import' do
      amount = Agsk.all.count
      
      expect(ImportForAgsk).to receive(:import).with(file, user)
      expect(Agsk.all.count).to be > amount
    end
  end
end