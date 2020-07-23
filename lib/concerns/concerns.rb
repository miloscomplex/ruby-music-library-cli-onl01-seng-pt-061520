module Concerns
  module Findable

    def find_by_name(name)
      all.detect {|i| i.name == name }
    end
    #modules do not need self...

    def find_or_create_by_name(name)
      if find_by_name(name) == nil
        create(name)
      else
        find_by_name(name)
      end
    end

  end
end
