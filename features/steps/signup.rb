class Spinach::Features::Signup < Spinach::FeatureSteps
  step 'I hit the call to action on the home page' do
    visit root_path
    click_link "Try it now"
  end

  step 'I register with the name of my restaurant, address, first name, last name, email, password' do
    fill_in 'Name', with: "Imperial City"
    fill_in 'Address', with: 'Change Alley, London, Greater London, EC3V 3LL'
    fill_in 'First name', with: "John"
    fill_in 'Last name', with: "Woo"
    fill_in 'Email', with: "woo@example.com"
    fill_in 'Password', with: "password"
    click_button 'Sign up'
  end

  step 'my user account should have been created' do
    user = User.first
    user.first_name.should == "John"
    user.last_name.should == "Woo"
    user.email.should == "woo@example.com"
  end

  step 'I should see my Dashboard' do
    current_path.should == dashboard_path
  end
end
