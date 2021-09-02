FactoryBot.define do
  factory :reply do
    content { 'MyString' }
    user { nil }
    opinion { nil }
  end
end
