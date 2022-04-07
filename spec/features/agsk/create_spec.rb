require 'rails_helper'

feature 'AGSK CREATE', %q(
  Authenticated user create
  Authenticated user create with errors
) do

  let(:user) { create(:user) }
  let(:guest) { create(:user) }

  it 'Authenticated user create' do
    sign_in(user)
    visit agsks_path

    find(:css, '.btn-outline-success').click

    fill_in 'agsk[requirement]', with: 'MyString'

    click_on 'Create Xroot'

    expect(page).to have_content 'Xroot was successfully created.'
    expect(page).to have_content 'MyString'
  end

  it 'Authenticated user create with errors' do
    sign_in(user)
    visit agsks_path

    find(:css, '.btn-outline-success').click
    
    click_on 'Create Agsk'

    expect(page).to have_content 'Agsk could not be created.'
    expect(page).to have_content "Requirement can't be blank"
  end

  context 'Multiple session' do
    it "Appears on another user's page agsk." do
      Capybara.using_session('user') do
        sign_in(user)
        visit new_agsk_path
      end

      Capybara.using_session('guest') do
        sign_in(guest)
        visit agsks_path
      end

      Capybara.using_session('user') do
        fill_in 'agsk[requirement]', with: 'MyString'

        find(:css, '.btn-outline-success').click

        expect(page).to have_content 'Agsk was successfully created.'
        expect(page).to have_content 'MyString'
      end

      Capybara.using_session('guest') do
        visit agsks_path

        expect(page).to have_content 'MyString'
      end
    end
  end
end