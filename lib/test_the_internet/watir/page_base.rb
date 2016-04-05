module W
  class PageBase
    def initialize(browser)
      @browser = browser
    end

    attr_reader :browser

    def title
      @browser.title
    end

    def base_url
      return ENV['BASE_URL'] unless ENV['BASE_URL'].nil?
      'https://murmuring-dusk-70651.herokuapp.com'
    end
  end
end
