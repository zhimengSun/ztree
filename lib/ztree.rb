require "rails"
require "exts/hash"
require "exts/array"
require "assets/rails/engine"
require "ztree/order_column"
require "ztree/sort_tree"
require "ztree/controller"
require "ztree/helpers"

class ActionController::Base
  include Ztree::Controller 
end

ActiveRecord::Base.send :include, SortTree
