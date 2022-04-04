require 'rails_helper'

RSpec.describe "digitization_agsks/index", type: :view do
  let(:user) { create(:user) }

  before(:each) do
    assign(:digitization_agsks, [
      DigitizationAgsk.create!(
        requirement: "MyText",
        concept: "Concept",
        descriptor: "Descriptor",
        formalizability: 2,
        user: user
      ),
      DigitizationAgsk.create!(
        requirement: "MyText",
        concept: "Concept",
        descriptor: "Descriptor",
        formalizability: 2,
        user: user
      )
    ])
  end

  it "renders a list of digitization_agsks" do
    render
    assert_select "tr>td", text: "MyText".to_s, count: 2
    assert_select "tr>td", text: "Concept".to_s, count: 2
    assert_select "tr>td", text: "Descriptor".to_s, count: 2
    assert_select "tr>td", text: 2.to_s, count: 2
    assert_select "tr>td", text: user.id.to_s, count: 2
  end
end
