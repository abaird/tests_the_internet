require 'selenium-webdriver'
require 'test_the_internet'
require 'test_the_internet/selenium'

RSpec.configure do |_config|
  def base_url
    'https://murmuring-dusk-70651.herokuapp.com'
  end
end
