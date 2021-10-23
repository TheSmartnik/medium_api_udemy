module MediumApi
  module Utils
    module_function

    def underscore_keys(hash)
      hash.each_with_object({}) do |(key, value), new_hash|
        new_key = underscore(key.to_s)
        new_key = new_key.to_sym if key.is_a?(Symbol)

        new_hash[new_key] = value
      end
    end

    def underscore(string)
      string.gsub(/([A-Z])/, '_\1').downcase
    end
  end
end
