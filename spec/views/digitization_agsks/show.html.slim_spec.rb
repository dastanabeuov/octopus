require 'rails_helper'

RSpec.describe "digitization_agsks/show", type: :view do
  let(:user) { create(:user) }

  before(:each) do
    @digitization_agsk = assign(:digitization_agsk, DigitizationAgsk.create!(
      requirement: "MyText",
      concept: "Concept",
      descriptor: "Descriptor",
      formalizability: 2,
      user: user
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/Concept/)
    expect(rendered).to match(/Descriptor/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(//)
  end
end
