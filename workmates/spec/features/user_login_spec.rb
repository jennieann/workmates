RSpec.feature "Log in " do

  scenario "with invalid login" do
    visit "/login"
    expect(page).to have_content('Log in')
    click_button 'Log in'
    expect(page).to have_content('Invalid email/password combination')
  end

  
end
