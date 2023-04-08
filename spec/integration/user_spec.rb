require 'rails_helper'

describe 'the signin process', type: :feature do
  before :each do
    User.create(email: 'guestuser@gmail.com', password: 'password', name: 'guestuser')
  end
  it 'signs @user in' do
    visit '/users/sign_in'
    fill_in 'Email', with: 'guestuser@gmail.com'
    fill_in 'Password', with: 'password'
    click_button 'Log in'
    expect(current_path).to eq(categories_path)
    expect(page).to have_text('Signed in successfully.')
  end
end
