class Spinach::Features::Signup < Spinach::FeatureSteps
  step 'I hit the call to action on the home page' do
    visit root_path
  end

  step 'I register with the name of my restaurant, address, first name, last name, email, password' do
    fill_in 'name', with: "Imperial City"
    fill_in 'address', with: 'Change Alley, London, Greater London, EC3V 3LL'
    # fill_in 'First name', with: "John"
    # fill_in 'Last name', with: "Woo"
    # fill_in 'Email', with: "woo@example.com"
    # fill_in 'Password', with: "password"
    click_button 'Sign up'
  end

  step 'I should see my Dashboard' do
    current_path.should == dashboard_path
  end
end
