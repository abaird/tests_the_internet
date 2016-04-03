require 'watir-webdriver'
require 'tests_the_internet'

RSpec.configure do |_config|
  def base_url
    'https://murmuring-dusk-70651.herokuapp.com'
  end
end
