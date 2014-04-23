require 'spec_helper'

feature 'can shortener urls' do

  scenario 'user can view a homepage with a form and a button' do
    visit '/'
    fill_in 'original_url', :with => 'http://www.google.com'
    click_button 'Shorten'
    id = id_of_created_url(current_path)
    expect(page).to have_content 'Original URL: http://www.google.com'
    expect(page).to have_content %Q("Shortened" URL: http://www.example.com/#{id})
    click_link '"Shorten" another URL'
    expect(page).to have_field 'original_url'
  end

end