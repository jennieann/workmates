 require "rails_helper"
  RSpec.feature "Users can delete projects" do
    scenario "successfully" do
    FactoryGirl.create(:person, name: "Olle")
    visit "/"
    click_link "Olle"
    click_link "Delete Person"
    expect(page).to have_content "Person has been deleted."
    expect(page.current_url).to eq people_url
    expect(page).to have_no_content "Olle"
  end
end
