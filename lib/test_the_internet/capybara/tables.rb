module C
  class TablesPage < SitePrism::Page
    extend TheInternetCommon
    set_url_matcher %r{#{base_url}/tables/?}

    element :main_heading, '.example h3'
  end
end
