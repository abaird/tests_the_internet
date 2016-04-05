require_relative 'spec_helper'

describe 'checkboxes' do
  before(:each) do
    @browser = Watir::Browser.new
    the_internet.visit
    the_internet.visit_page(url: 'checkboxes')
  end

  after(:each) do
    @browser.close unless @browser.nil?
  end

  let(:the_internet) { W::TheInternetPage.new @browser }
  let(:checkboxes_page) { W::CheckboxesPage.new @browser }

  it 'should check both checkboxes' do
    checkboxes_page.checkbox1.set
    checkboxes_page.checkbox2.clear
    expect(checkboxes_page.checkbox1.set?).to eq true
    expect(checkboxes_page.checkbox2.set?).to eq false
  end
end
