module MediumApi
  class User < Struct.new(:id, :username, :name, :url, :image_url, keyword_init: true)
  end
end
