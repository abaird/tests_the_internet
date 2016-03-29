require 'watir-webdriver'
require 'tests_the_internet'

RSpec.configure do |config|
  def base_url
    'https://murmuring-dusk-70651.herokuapp.com'
  end
end
