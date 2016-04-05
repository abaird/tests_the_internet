require_relative 'spec_helper'

describe PageNavigationHelper do
  it 'should return a list of pages' do
    this = PageNavigationHelper
    expect(this.url_list.length).to eq 40
    expect(this.url_by_title('Sortable Data Tables')).to eq 'tables'
    expect(this.title_by_url('tables')).to eq 'Sortable Data Tables'
    unsafe_length = (this.url_list - this.unsafe_pages).length
    expect(this.url_list_safe.length).to eq unsafe_length
  end
end

describe 'visit all pages' do
  before(:all) do
    @browser = Watir::Browser.new
  end

  after(:all) do
    @browser.close unless @browser.nil?
  end

  let(:the_internet) { W::TheInternetPage.new(@browser) }

  PageNavigationHelper.url_list_safe.sample(5).each do |page|
    it "should visit page: #{page}" do
      the_internet.visit
      the_internet.visit_page(url: page)
      expect(@browser.url).to match page
      the_internet.visit
    end
  end
  PageNavigationHelper.title_list_safe.sample(5).each do |page|
    it "should visit page: #{page}" do
      the_internet.visit
      the_internet.visit_page(title: page)
      expect(@browser.url).to match PageNavigationHelper.url_by_title(page)
      the_internet.visit
    end
  end
end
