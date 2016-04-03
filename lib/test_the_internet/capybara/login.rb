module TheInternetCommon
  def base_url
    'https://murmuring-dusk-70651.herokuapp.com'
  end
end
class TheInternetPage < SitePrism::Page
  extend TheInternetCommon
  set_url base_url
  set_url_matcher %r{#{base_url}/?}

  element :heading, 'h1.heading'
  element :tables_link, "a[href='/tables']"
end

class TablesPage < SitePrism::Page
  extend TheInternetCommon
  set_url_matcher %r{#{base_url}/tables/?}

  element :main_heading, '.example h3'
end
