module WhowishWord

  module Initializer

    def install_route

      Rails.application.routes.prepend do
        get 'whowish_word/change_word' => 'whowish_word#change_word'
        get 'whowish_word_css' => 'whowish_word#css'
        get 'whowish_word_js' => 'whowish_word#js'
        get 'whowish_word/download' => 'whowish_word#download'
      end

    end

    # def run_database_migration

    #   Dir[File.expand_path("../db_migration/#{@orm_engine}/**/*.rb", __FILE__)].each {|f| require f}

    # end



    def install_hook

      Dir[File.expand_path("../action_controller/**/*.rb", __FILE__)].each {|f| require f}
      Dir[File.expand_path("../action_mailer/**/*.rb", __FILE__)].each {|f| require f}
      Dir[File.expand_path("../action_view/**/*.rb", __FILE__)].each {|f| require f}

    end


    def load_rails

      paths = ["controllers"]

      # load all controllers, helpers, and models
      paths.each do |dir|

        path = File.join(File.dirname(__FILE__), 'rails', 'app', dir)

        $LOAD_PATH.insert(0, path)
        ActiveSupport::Dependencies.autoload_paths.insert(0, path)
        ActiveSupport::Dependencies.autoload_once_paths.delete(path)

      end

      ActionController::Base.append_view_path(File.join(File.dirname(__FILE__), 'rails', 'app'))

    end

  end

end
