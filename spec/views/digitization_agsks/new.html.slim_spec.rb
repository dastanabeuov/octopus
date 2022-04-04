require 'rails_helper'

RSpec.describe "digitization_agsks/new", type: :view do
  let(:user) { create(:user) }

  before(:each) do
    assign(:digitization_agsk, DigitizationAgsk.new(
      requirement: "MyText",
      concept: "MyString",
      descriptor: "MyString",
      formalizability: 1,
      user: user
    ))
  end

  it "renders new digitization_agsk form" do
    render

    assert_select "form[action=?][method=?]", digitization_agsks_path, "post" do

      assert_select "textarea[name=?]", "digitization_agsk[requirement]"

      assert_select "input[name=?]", "digitization_agsk[concept]"

      assert_select "input[name=?]", "digitization_agsk[descriptor]"

      assert_select "input[name=?]", "digitization_agsk[formalizability]"

      assert_select "input[name=?]", "digitization_agsk[user_id]"
    end
  end
end
