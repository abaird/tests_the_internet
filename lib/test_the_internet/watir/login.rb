module W
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
      @browser.text_field(id: 'username')
    end

    def password_field
      @browser.text_field(id: 'password')
    end

    def login_button
      @browser.button(index: 0)
    end

    def flash_message
      @browser.div(id: 'flash-messages')
    end

    def on_page?
      @browser.h2(text: 'Login Page').exists?
    end

    def invalid_login_message
      flash_message.div(id: 'flash')
    end

    def invalid_login?
      invalid_login_message.text[/Your (username|password) is invalid!/]
    end

    def login(username, password)
      username_field.value = username
      password_field.value = password
      login_button.click
      raise RuntimeError if on_page? && invalid_login?
    end
  end

  class SecureArea < PageBase
    def logout
      @browser.link(href: '/logout')
    end
  end
end
