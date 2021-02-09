require 'rails_helper'

RSpec.describe Opinion, type: :model do
  context 'Comments Validations, Maximum size, length and presence' do
    let(:user) { User.create(fullname: 'Gabriel Hilarion', username: 'Gabdehilas', email: 'gabriel@gmail.com', password: '123456', photo: 'myphoto.png', cover_image: 'my_cover.png') }
    let(:opinion) { Opinion.create(user_id: user.id, content: 'This is my first post') }

    subject { opinion.build(user_id: user.id, comment: 'Hey, yeah, nice post ') }

    it 'Maximun size of content is 101' do
      expect(subject).to be_valid
    end

    it { expect(subject).to validate_presence_of(:content) }

    it {
      expect(subject).to validate_length_of(:content).is_at_most(101)
        .with_message(/200 characters in comment is the maximum allowed./)
    }
  end

  context 'Association' do
    it { expect(subject).to belong_to(:user) } 
  end
end
