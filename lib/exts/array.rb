# -*- encoding : utf-8 -*-
class Array
  def to_ztree_node(*args)
    opts = args.extract_options!
    checked_ids = opts[:checked_ids] ? opts[:checked_ids].split(',') : []
    opts.delete(:checked_ids)
    self.inject([]) do |nodes, h|
       ha = {
         id: h.id,
         name: h.name,
         pId: h.parent_id.blank? ? 0 : h.parent_id,
         open: false
       }
       [opts, args].each do |opt|
         to_h2(opt).each do |symb, metd|
           val =  h.respond_to?(metd) ? h.send(metd) : metd
           ha = ha.merge(symb => val)
           ha = ha.merge(checked: true) if checked_ids.include?(h.id.to_s)
         end
       end
       nodes << ha
    end
  end

  def to_h2(opt)
    return {} unless opt.all? {|a| a.is_a?(Symbol) || a.is_a?(String)}
    opt.inject({}) {|h,a| h[a] = a;h }
  end

  def to_sorted_nodes
    return [] if self.empty?
    col = self.first.class.order_column || :order_num
    self.group_by(&:parent_id).each {|k,v| v.sort_by!{|a| a.send(col) }}.to_a.flatten.select{|c| !c.is_a?Integer}.compact
  end
end
