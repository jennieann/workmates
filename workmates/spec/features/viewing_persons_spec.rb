RSpec.feature "Users can view people" do
  scenario "with the people details" do
    person = FactoryGirl.create(:person, name: "Lisa")
    visit "/"
    click_link "Lisa"
    expect(page.current_url).to eq person_url(person)
  end
end
