FactoryBot.define do
  factory :user do
    username {  Faker::Name.name }
    fullname { Faker::Name.name }
    password { 'mypass' }  
    email { Faker::Internet.safe_email } 

    factory :user_with_photo do
      photo { File.new("#{Rails.root}/spec/factories/photo.JPG") }
    end

    factory :user_with_cover_image do
      cover_image { File.new("#{Rails.root}/spec/factories/cover_image.JPG") }
    end
  end
end
