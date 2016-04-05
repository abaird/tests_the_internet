class PageNavigationHelper
  def self.url_by_title(title)
    page_collection.each do |page|
      return page[:url] if title == page[:title]
    end
  end

  def self.title_by_url(url)
    page_collection.each do |page|
      return page[:title] if url == page[:url]
    end
  end

  def self.url_list
    page_collection.map { |item| item[:url] }
  end

  def self.url_list_safe
    url_list - unsafe_pages
  end

  def self.title_list
    page_collection.map { |item| item[:title] }
  end

  def self.title_list_safe
    unsafe_titles = unsafe_pages.map { |item| title_by_url(item) }
    title_list - unsafe_titles
  end

  def self.unsafe_pages
    %w(notification_messages
       download_secure
       basic_auth)
  end

  def self.page_collection # rubocop:disable Metrics/MethodLength
    [
        {title: 'A/B Testing', url: 'abtest'},
        {title: 'Basic Auth', url: 'basic_auth'},
        {title: 'Broken Images', url: 'broken_images'},
        {title: 'Challenging DOM', url: 'challenging_dom'},
        {title: 'Checkboxes', url: 'checkboxes'},
        {title: 'Context Menu', url: 'context_menu'},
        {title: 'Disappearing Elements', url: 'disappearing_elements'},
        {title: 'Drag and Drop', url: 'drag_and_drop'},
        {title: 'Dropdown', url: 'dropdown'},
        {title: 'Dynamic Content', url: 'dynamic_content'},
        {title: 'Dynamic Controls', url: 'dynamic_controls'},
        {title: 'Dynamic Loading', url: 'dynamic_loading'},
        {title: 'Exit Intent', url: 'exit_intent'},
        {title: 'File Download', url: 'download'},
        {title: 'File Upload', url: 'upload'},
        {title: 'Floating Menu', url: 'floating_menu'},
        {title: 'Forgot Password', url: 'forgot_password'},
        {title: 'Form Authentication', url: 'login'},
        {title: 'Frames', url: 'frames'},
        {title: 'Geolocation', url: 'geolocation'},
        {title: 'Hovers', url: 'hovers'},
        {title: 'Infinite Scroll', url: 'infinite_scroll'},
        {title: 'JQuery UI Menus', url: 'jqueryui/menu'},
        {title: 'JavaScript Alerts', url: 'javascript_alerts'},
        {title: 'JavaScript onload event error', url: 'javascript_error'},
        {title: 'Key Presses', url: 'key_presses'},
        {title: 'Large & Deep DOM', url: 'large'},
        {title: 'Multiple Windows', url: 'windows'},
        {title: 'Navigating Between Pages', url: 'link_page_one'},
        {title: 'Nested Frames', url: 'nested_frames'},
        {title: 'Notification Messages', url: 'notification_messages'},
        {title: 'Redirect Link', url: 'redirector'},
        {title: 'Secure File Download', url: 'download_secure'},
        {title: 'Shifting Content', url: 'shifting_content'},
        {title: 'Slow Resources', url: 'slow'},
        {title: 'Slow Javascript', url: 'javascript_form'},
        {title: 'Sortable Data Tables', url: 'tables'},
        {title: 'Status Codes', url: 'status_codes'},
        {title: 'Typos', url: 'typos'},
        {title: 'WYSIWYG Editor', url: 'tinymce'}
    ]
  end
end
