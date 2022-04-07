require 'rails_helper'

feature 'AGSK DESTROY', %q(
  Author destroy
  Not author try destroy
) do

  let(:user) { create(:user) }
  let(:user2) { create(:user) }
  let(:agsk) { create(:agsk, user: user) }

  it 'Author destroy' do
    sign_in(user)
    visit agsks_path

    find(:css, '.btn-outline-danger').click

    expect(page).to have_content 'Agsk was successfully destroyed.'
  end

  it 'Not author try destroy' do
    sign_in(user2)
    visit agsks_path

    expect(page).not_to have_link('.btn-outline-danger', exact: true)
  end
end