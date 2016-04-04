require_relative 'spec_helper'

describe 'Selenium Login Test' do
  before(:each) do
    @browser = Selenium::WebDriver.for :firefox
    @browser.get base_url + '/login'
  end

  after(:each) do
    @browser.quit unless @browser.nil?
  end

  it 'should login' do
    login_page = S::Login.new(@browser)
    expect(login_page.title).to eq 'The Internet'
    login_page.login('tomsmith', 'SuperSecretPassword!')
    secure_area = S::SecureArea.new(@browser)
    expect(secure_area.logout).to be_displayed
  end

  it 'fails to login with invalid password' do
    login_page = S::Login.new(@browser)
    expect(login_page.title).to eq 'The Internet'
    expect { login_page.login('xyz', 'invalid') }.to raise_error RuntimeError
  end
end
