require 'test_the_internet'

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
