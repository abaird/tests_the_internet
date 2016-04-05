module W
  class CheckboxesPage < PageBase
    def checkbox1
      @browser.checkbox(index: 0)
    end

    def checkbox2
      @browser.checkbox(index: 1)
    end
  end
end
