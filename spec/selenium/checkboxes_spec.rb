require_relative 'spec_helper'

describe 'checkboxes' do
  before(:each) do
    @browser = Selenium::WebDriver.for :firefox
    @browser.get base_url + '/checkboxes'
  end

  after(:each) do
    @browser.quit unless @browser.nil?
  end

  let(:checkbox1) { @browser.find_element(css: 'input:nth-of-type(1)') }
  let(:checkbox2) { @browser.find_element(css: 'input:nth-of-type(2)') }

  # interesting notes:
  # - there's no selector for a checkbox since it's an input field
  # - there's no equivalent of #set and #clear, only #click

  it 'should check both checkboxes' do
    checkbox1.click
    checkbox2.click
    expect(checkbox1.attribute('type')).to eq 'checkbox'
    expect(checkbox1.attribute('checked')).to eq 'true'
    expect(checkbox2.attribute('checked')).to be nil
    expect(checkbox1.selected?).to eq true
    expect(checkbox2.selected?).to eq false
  end
end
