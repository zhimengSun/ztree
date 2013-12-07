require "exts/hash"
require "exts/array"
require "assets/rails/engine"
require "ztree/sort_tree"
require "ztree/railtie"
ActiveRecord::Base.send :include, SortTree
