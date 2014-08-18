ztree
=====


install
----------
  gem install ztree
  

usage
----------


  Default order column is :order_num, and you can set it in the model as below

   ```ruby
   class A < ActiveRecord::Base
   
      ztrees order_column: :my_ordered_column_name
   
   end


  
