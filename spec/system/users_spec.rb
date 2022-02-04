require 'rails_helper'

RSpec.describe 'Users', type: :system do
  before do
    driven_by(:selenium_chrome_headless)
  end

  it 'shows the static text' do
    visit users_path
    expect(page).to have_content('Number')
  end
end
