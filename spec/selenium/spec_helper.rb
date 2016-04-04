require 'selenium-webdriver'
require 'tests_the_internet_with_selenium'

RSpec.configure do |_config|
  def base_url
    'https://murmuring-dusk-70651.herokuapp.com'
  end
end
