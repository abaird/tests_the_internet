module S
  class PageBase
    def initialize(browser)
      @browser = browser
    end

    attr_reader :browser

    def title
      @browser.title
    end
  end

  class Login < PageBase
    def username_field
      @browser.find_element(id: 'username')
    end

    def password_field
      @browser.find_element(id: 'password')
    end

    def login_button
      @browser.find_element(css: '#login > button')
    end

    def flash_message
      @browser.find_element(id: 'flash-messages')
    end

    def on_page?
      @browser.find_element(css: 'div[class=example] > h2').displayed?
    end

    def invalid_login_message
      flash_message.find_element(id: 'flash')
    end

    def invalid_login?
      invalid_login_message.text[/Your (username|password) is invalid!/]
    end

    def login(username, password)
      username_field.send_keys username
      password_field.send_keys password
      login_button.click
      raise RuntimeError if on_page? && invalid_login?
    end
  end

  class SecureArea < PageBase
    def logout
      @browser.find_element(css: '.button')
    end
  end
end
