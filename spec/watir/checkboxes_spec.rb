require_relative 'spec_helper'

describe 'checkboxes' do
  before(:each) do
    @browser = Watir::Browser.new
    @browser.goto base_url + '/checkboxes'
  end

  after(:each) do
    @browser.close unless @browser.nil?
  end

  let(:checkbox1) { @browser.checkbox(index: 0) }
  let(:checkbox2) { @browser.checkbox(index: 1) }

  it 'should check both checkboxes' do
    checkbox1.set
    checkbox2.clear
    expect(checkbox1.set?).to eq true
    expect(checkbox2.set?).to eq false
  end
end
