require_relative 'spec_helper'

feature 'Test out Capybara' do
  let(:the_internet_page) { TheInternetPage.new }
  let(:tables_page) { TablesPage.new }

  background do
    the_internet_page.load
  end

  scenario 'Go to the-internet website' do
    expect(the_internet_page).to be_displayed

    the_internet_page.tables_link.click
    expect(tables_page).to be_displayed
    expect(tables_page.main_heading.text).to eq 'Data Tables'
  end
end
