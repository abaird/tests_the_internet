module C
  class FlashMessages < SitePrism::Section
    element :message, '#flash'
  end

  class LoginPage < SitePrism::Page
    extend C::TheInternetCommon
    set_url base_url + '/login'
    set_url_matcher %r{#{base_url}/login/?}
    load_validation { has_page_title? }

    element :page_title, '.example > h2'
    element :username_field, '#username'
    element :password_field, '#password'
    element :login_button, '#login > button'
    section :flash_message, FlashMessages, '#flash-messages'

    def invalid_login?
      flash_message.message.text[/Your (username|password) is invalid!/]
    end

    def login(username, password)
      username_field.set username
      password_field.set password
      login_button.click
      raise RuntimeError if loaded? && invalid_login?
    end
  end

  class SecureArea < SitePrism::Page
    extend C::TheInternetCommon
    set_url_matcher %r{#{base_url}/secure/?}
    load_validation { has_logout_button? }

    element :flash_message, '#flash-messages'

    element :logout_button, '.button'
  end
end
