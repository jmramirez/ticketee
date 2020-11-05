require 'rails_helper'

RSpec.feature "Users can sign up" do
  let!(:user) { FactoryBot.create(:user)}

  before do
    login_as(user)
  end

  scenario  do
    visit "/"
    click_link "Sign out"
    expect(page).to have_content "Signed out successfully"
  end
end