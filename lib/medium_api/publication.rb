module MediumApi
  class Publication < Struct.new(:id, :description, :name, :url, :image_url, keyword_init: true)
    include ResourceApi

    def contributors
      data = client.publication_contributors(id)
      data.map do |contributor_attrs|
        Contributor.new(Utils.underscore_keys(contributor_attrs))
      end
    end
  end
end
