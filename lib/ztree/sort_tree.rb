module SortTree

  extend ActiveSupport::Concern

  module ClassMethods
    def sorted
      all_parents.inject([]) do |cs, r|
        cs << r
        cs << r.sorted_children
      end.flatten.uniq
    end
    
    def update_sorted_numbers(numbers)
      numbers.each_with_index {|id, i| self.find(id).update_order(i + 1)}
    end
    
    def all_parents
      all.select {|c| c.has_children? || c.ancestry.nil?}
    end
  end
  
  def sorted_children
    children.sort_by{|c| c.order_num}
  end

  def sorted_children_ids
    sorted_children.inject([]) {|ids, c| ids << c.id} if !children.empty?
  end

  def update_order_number
    update_order(parent ? parent.children.size + 1 : 0)
  end

  def update_order(num)
    update_attribute(:order_num, num)
  end

  def update_sorted_numbers(numbers)
    return false if numbers.size != children.size
    self.class.update_sorted_numbers(numbers)
  end
end