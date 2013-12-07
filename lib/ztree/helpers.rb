module ActionView 
  module Helpers
    

    def tree_list(link_title = '', opts = {})
      id, cls_name = opts[:id] || 'tree-list', opts[:class] || 'menus_ztree ztree small' 
      ul = content_tag :ul, '', {id: id, class: cls_name, style: "width:260px; overflow:auto;"}.merge(opts)
      init_tree_js(link_title) +  content_tag(:div, ul, class: 'ground fl')
    end

    def ztree_settings(opts = {})
      default_settings = {
        view: {
          addHoverDom: "addHoverDom",
          removeHoverDom: "removeHoverDom",
          selectedMulti: false,
        },
        check: {
          #enable: true
        },
        edit: {
          enable: true,
          editNameSelectAll: true,
          showRemoveBtn: true,
          showRenameBtn: true,
          drag: {
            isCopy: true,
            isMove: true,
            prev: true,
            inner: false,
            next: true,
          }
        },
        data: {
          simpleData: {
            enable: true
          }
        },
        callback: {
          beforeDrag: "beforeDrag",
          beforeDrop: "beforeDrop",
          beforeEditName: "beforeEditName",
          beforeRemove: "beforeRemove",
          onDrop: "onDrop",
          onRemove: "onRemove",
          beforeRename: "beforeRename",
          onRename: "onRename",
          onClick: "onClick",
        }
      }
      default_settings.merge(opts).to_json.html_safe.delete("\"").gsub("=>",": ")
    end
  end
end
