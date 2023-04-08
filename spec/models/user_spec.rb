require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { User.new(email: 'app@gmail.com', password: '123456') }

  before { user.save }

  it 'user should be valid' do
    expect(user).to be_valid
  end

  describe 'check for the validations' do
    it 'have correct email' do
      user.email = 'app@gmail.com'
      expect(user).to be_valid
    end

    it 'should be valid with password' do
      user.password = '123456'
      expect(user).to be_valid
    end
  end
end
