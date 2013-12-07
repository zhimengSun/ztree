require 'controller'

module Ztree
  class Railtie < Rails::Railtie
    initializer "ztree.action_controller" do
      ActiveSupport.on_load(:action_controller) do
        include Ztree::Controller
      end
    end
  end
end
