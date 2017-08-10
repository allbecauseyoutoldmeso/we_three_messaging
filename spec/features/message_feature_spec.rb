require 'rails_helper'

feature 'messages' do

  scenario 'entering a message' do
    visit 'messages/new'
    fill_in 'Text', with: 'hello world'
    click_button 'Save Message'
    expect(current_path).to eq '/messages/1'
    expect(page).to have_content 'hello world'
  end

end
