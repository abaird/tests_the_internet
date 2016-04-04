require_relative 'spec_helper'

feature 'Login with Capybara' do
  let(:login_page) { C::LoginPage.new }
  let(:secure_area_page) { C::SecureArea.new }
  background do # this is the same as before(:all)
    login_page.load
  end

  it 'should login' do
    expect(login_page).to be_displayed
    expect(login_page).to be_loaded
    login_page.login('tomsmith', 'SuperSecretPassword!')
    expect(secure_area_page).to be_displayed
    expect(secure_area_page).to be_loaded
  end

  it 'fails to login with invalid password' do
    expect(login_page).to be_displayed
    expect(login_page).to be_loaded
    expect { login_page.login('invalid', 'invalid') }.to raise_exception RuntimeError
  end
end
