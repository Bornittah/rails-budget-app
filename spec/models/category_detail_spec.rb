require 'rails_helper'

RSpec.describe CategoryDetail, type: :model do
  subject do
    user = User.new(email: 'app@gmail.com', password: '123456')
    category = Category.new(user_id: user.id, name: 'home', icon: '')
    CategoryDetail.new(name: 'home', amount: '20000', category_id: category.id, author_id: user.id)
  end

  before { subject.save }

  describe 'test for the association and model' do
    it 'category detail should not be valid, user and category  must exist' do
      expect(subject).to_not be_valid
    end
  end
end
