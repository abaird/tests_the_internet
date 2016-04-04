module W
  class TheInternetPage < PageBase
    def visit
      browser.goto base_url
    end

    def visit_page(title: nil, url: nil)
      if title.nil?
        browser.div(id: 'content').link(href: "/#{url}").click
      elsif url.nil?
        browser.div(id: 'content').link(text: title).click
      else
        raise 'both title and url were nil'
      end
    end
  end
end
