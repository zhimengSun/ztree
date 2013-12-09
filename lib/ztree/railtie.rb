# module Ztree
#   class Railtie < ::Rails::Railtie
#     initializer "ztree.action_controller" do
#       ActiveSupport.on_load(:action_controller) do
#         # include Ztree::Controller
#         ActionController::Base.send :include, Ztree::Controller 
#       end
#     end
#   end
# end
# 
# require 'ztree/railtie' if defined?(Rails)
#
if defined? ActionController::Base
  ActionController::Base.class_eval do
    include Ztree::Controller
  end
end 
