require_relative 'spec_helper'

describe 'stuff' do
  before(:each) do
    @browser = Watir::Browser.new
    @browser.goto base_url + '/login'
  end

  after(:each) do
    @browser.close unless @browser.nil?
  end

  it 'should login' do
    login_page = Login.new(@browser)
    expect(login_page.title).to eq 'The Internet'
    login_page.login('tomsmith', 'SuperSecretPassword!')
    secure_area = SecureArea.new(@browser)
    expect(secure_area.logout).to be_exists
  end

  it 'fails to login with invalid password' do
    login_page = Login.new(@browser)
    expect(login_page.title).to eq 'The Internet'
    expect { login_page.login('xyz', 'invalid') }.to raise_error RuntimeError
  end
end
