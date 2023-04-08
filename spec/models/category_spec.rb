require 'rails_helper'

RSpec.describe Category, type: :model do
  subject do
    user = User.new(name: 'admin', email: 'app@gmail.com', password: '123456')
    Category.new(user_id: user.id, name: 'home', icon: '')
  end

  before { subject.save }

  it 'category should not be valid, user must exist' do
    expect(subject).to_not be_valid
  end
end
