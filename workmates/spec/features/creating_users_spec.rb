require "rails_helper"
RSpec.feature "Users can create a new personprofile" do
  scenario "with valid attributes" do
    image_source = 'spec/fixtures/images/capybara.jpg'

    visit "/"
    click_link "New Person"
    fill_in "Name", with: "Anna"
    fill_in "Lastname", with: "Andersson"
    fill_in "Title", with: "UX"
    attach_file('person_image', image_source)

    click_button "Create Person"
    expect(page).to have_content "Person has been created."
  end
end
