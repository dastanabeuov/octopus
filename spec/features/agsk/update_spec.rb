require 'rails_helper'

feature 'AGSK UPDATE', %q(
  Author edit
  Not author try edit
) do

  let(:user) { create(:user) }
  let(:user2) { create(:user) }
  let!(:agsk) { create(:agsk, user: user) }

  it 'Author edit' do
    sign_in(user)
    visit edit_agsk_path(agsk)

    fill_in 'Requirement', with: 'New requirement title'
    click_on 'Update Agsk'

    expect(page).to have_current_path agsk_path(agsk), ignore_query: true
    expect(page).to have_content 'Agsk was successfully updated.'
    expect(page).to have_content 'New xroot title'
  end

  it 'Not author try edit' do
    sign_in(user2)
    visit agsk_path(agsk)

    expect(page).not_to have_link('.btn-outline-warning', exact: true)
  end
end