class << ActiveRecord::Base
  def ztrees(opts = {}) # 暂时简单实现
    cattr_accessor :order_column
    self.order_column = opts[:order_column] || :order_number
  end
end

ActiveSupport.on_load :active_record do
  if ActiveRecord::Base.respond_to?(:has_ancestry)
    class << ActiveRecord::Base
      def order_column
        :order_number
      end
    end
  end
end

