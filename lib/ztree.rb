require "rails"
require "exts/hash"
require "exts/array"
require "assets/rails/engine"
require "ztree/sort_tree"
require "ztree/controller"
require "ztree/helpers"
require "ztree/railtie"

ActiveRecord::Base.send :include, SortTree
