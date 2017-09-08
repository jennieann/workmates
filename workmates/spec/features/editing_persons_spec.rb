RSpec.feature "Users can edit existing people" do
  before do
    FactoryGirl.create(:person, name: "Lisa")
    visit "/"
    click_link "Lisa"
    click_link "Edit Person"
  end
  scenario "with valid attributes" do

    fill_in "Name", with: "Elisabeth"
    click_button "Update Person"

    expect(page).to have_content "Person has been updated."
    expect(page).to have_content "Elisabeth"
  end

  scenario "when providing invalid attributes" do
    fill_in "Name", with: ""
    click_button "Update Person"
    expect(page).to have_content "Person has not been updated."
  end
end
