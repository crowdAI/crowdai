# Administrate uses kaminari and the 'per' method conflicts with will_paginate 

Kaminari.configure do |config|
  config.page_method_name = :per_page_kaminari
end
