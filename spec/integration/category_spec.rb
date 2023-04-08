require 'rails_helper'

RSpec.describe 'Category Index', type: :system do
  before(:each) do
    @user = User.create(email: 'admin@gmail.com', password: '123456',
                        password_confirmation: '123456')

    @category = Category.create(user_id: @user.id, name: 'pizza',
                                icon: 'p')
  end

  it 'Sign up with a user' do
    visit new_user_registration_path

    sleep(1)
    fill_in 'Email', with: @user.email
    sleep(2)
    fill_in 'Password', with: @user.password
    fill_in 'Password confirmation', with: @user.password_confirmation
    click_button 'Sign up'
  end

  it 'User should log in' do
    visit new_user_session_path
    fill_in 'Email', with: @user.email
    sleep(2)
    fill_in 'Password', with: @user.password
    click_button 'Log in'
    sleep(5)
  end

  it 'add the category' do
    visit new_category_path
    fill_in 'name', with: 'pizza'
    fill_in 'icon', with: 'op'
    click_button 'Add category'
    expect(current_path).to eq(categories_path)
    expect(page).to have_text('Total spent:$')
  end
end
