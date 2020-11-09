require 'rails_helper'

RSpec.feature "Users can create new tickets" do
  let(:user) { FactoryBot.create(:user)}
  before do
    login_as(user)
    project = FactoryBot.create(:project, name: "Internet Explorer")
    assign_role!(user, :editor, project)
    visit project_path(project)
    click_link "New Ticket"
  end

  scenario "with valid attributes" do
    fill_in "Name", with: "Non-standards compliance"
    fill_in "Description", with: "My Pages are ugly!"
    click_button "Create Ticket"

    expect(page).to have_content "Ticket has been created."
    within("#ticket") do
      expect(page).to have_content "Author: #{user.email}"
    end
  end

  scenario "when providing invalid attributes" do
    click_button "Create Ticket"

    expect(page).to have_content "Ticket has not been created."
    expect(page).to have_content "Name can't be blank"
    expect(page).to have_content "Description can't be blank"
  end

  scenario "with an invalid description" do
    fill_in "Name", with: "Non-standards compliance"
    fill_in "Description", with: "It sucks"
    click_button "Create Ticket"

    expect(page).to have_content "Ticket has not been created."
    expect(page).to have_content "Description is too short"
  end

  scenario "with an attachment" do
    fill_in "Name", with: "Add documentation for blink tag"
    fill_in "Description", with: "The blink tag has a speed attribute"
    attach_file "File", "spec/fixtures/speed.txt"
    click_button "Create Ticket"

    expect(page).to have_content "Ticket has been created."

    within("#ticket .attachment") do
      expect(page).to have_content "speed.txt"
    end
  end
end