require 'rails_helper'

describe "user interaction", type: :feature do
    
    before do
        visit '/users/sign_up'
        within("#new_user") do
            fill_in 'user_username', with: 'user@example.com'
            fill_in 'user_fullname', with: 'password'
            fill_in 'user_email', with: 'user@example.com'
            fill_in 'user_password', with: 'password'
            fill_in 'user_password_confirmation', with: 'password'
            page.attach_file("user_photo", Rails.root + 'spec/factories/photo.JPG') 
            page.attach_file("user_cover_image", Rails.root + 'spec/factories/cover_image.JPG') 
            
            find("input[type='submit']").click
        end

    end
    
    scenario 'log_in valid' do
        expect(page).to have_content("Welcome")
    end 
    
    scenario "post opinion" do
        fill_in 'opinion_comment', with: 'This a great opinion' 
        click_button 'SUBMIT'
        expect(page).to have_content("Opinion was successfully created.")
    end
end