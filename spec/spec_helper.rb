require 'simplecov'

SimpleCov.start

RSpec.configure do |config|

end

module TinyMceFillIn
  def tinymce_fill_in(name, options = {})
    if page.driver.browser.browser == :chrome
      page.driver.browser.switch_to.frame("#{name}_ifr")
      page.find(:css, '#tinymce').native.send_keys(options[:with])
      page.driver.browser.switch_to.default_content
    else
      page.execute_script("tinyMCE.get('#{name}').setContent('#{options[:with]}')")
    end
  end
end