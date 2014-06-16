module Ztree
  class << ActiveRecord::Base
    cattr_accessor :order_column
    def order_column(c = :order_number) # 暂时简单实现
      self.order_column = c
    end
  end
end

