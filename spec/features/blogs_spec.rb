require 'rails_helper'

RSpec.feature "Blogs", type: :feature do
  scenario "error should be displayed when blog with no title is created" do
    visit blogs_path
    click_link 'New Blog'
    click_button 'Save'
    expect(page).to have_content "Title can't be blank"
  end

  scenario "blog is successfully created and user is redirected to blog showing view " do
    visit blogs_path
    click_link 'New Blog'
    fill_in 'Title', with: 'title'

    expect{
      click_button 'Save'
    }.to change(Blog, :count).by(1)

    expect(current_path).to eq blog_path Blog.last
    expect(page).to have_content 'Blog was successfully created.'
  end
end
