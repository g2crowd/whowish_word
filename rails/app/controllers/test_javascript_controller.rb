class TestJavascriptController < ApplicationController

  layout "test_javascript"

  before_action :always_activate_whowish_word

  def always_activate_whowish_word
    activate_whowish_word_edit_mode
  end

end
