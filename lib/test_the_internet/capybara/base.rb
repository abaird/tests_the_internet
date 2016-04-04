module C
  class TheInternetPage < SitePrism::Page
    extend TheInternetCommon
    set_url base_url
    set_url_matcher %r{#{base_url}/?}

    element :heading, 'h1.heading'
    element :tables_link, "a[href='/tables']"
  end
end
