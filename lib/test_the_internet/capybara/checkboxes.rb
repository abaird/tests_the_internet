module C
  class CheckboxesPage < SitePrism::Page
    extend C::TheInternetCommon
    set_url base_url + '/checkboxes'
    set_url_matcher %r{#{base_url}/checkboxes/?}
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
end
