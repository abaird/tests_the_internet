require_relative 'spec_helper'

feature 'test checkboxes with capybara' do
  let(:the_internet_page) { C::TheInternetPage.new }

  background do
    the_internet_page.load
  end

  it 'should check both checkboxes' do
  end
end
