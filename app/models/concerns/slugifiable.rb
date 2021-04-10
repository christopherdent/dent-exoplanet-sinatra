module Slugifiable

  module SlugMethod
    def slug
      #binding.pry
      self.name.to_s.gsub(" ","-").downcase
    end
  end

  module FindBySlug
    def find_by_slug(slug)
      self.all.find {|instance| instance.slug == slug}
    end
  end
end
