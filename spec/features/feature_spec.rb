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

  scenario 'valid login' do
    expect(page).to have_content("Welcome")
  end

  scenario "post opinion" do
    fill_in 'opinion_comment', with: 'This is a great opinion'
    click_button 'SUBMIT'
    expect(page).to have_content("Opinion was successfully created.")
  end

  scenario "like a post" do
    fill_in 'opinion_comment', with: 'This is another great opinion'
    click_button 'SUBMIT'
    expect(page).to have_content("Opinion was successfully created.")

    within('.interactions') do
      find("a[title='click to like opinion']").click
      expect(page).to have_content("Likes 1")
    end

    find("a[title='click to dislike opinion']").click
    expect(page).to have_content("Failed, you can't dislike twice! and you can't like and dislike at once")
  end
end
