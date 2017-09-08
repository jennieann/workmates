require "rails_helper"
RSpec.feature "Users can create a new personprofile" do

  before do
    visit "/"
    click_link "New Person"
  end

  scenario "with valid attributes" do
    image_source = 'spec/fixtures/images/capybara.jpg'

    fill_in "Name", with: "Anna"
    fill_in "Lastname", with: "Andersson"
    fill_in "Title", with: "UX"
    attach_file('person_image', image_source)

    click_button "Create Person"
    expect(page).to have_content "Person has been created."
  end

  scenario "when providing invalid attributes" do

          click_button "Create Person"
          expect(page).to have_content "Person has not been created."
          expect(page).to have_content "Name can't be blank"
  end
end
