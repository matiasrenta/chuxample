class ThingSearchAdapter < AutoSelect2::Select2SearchAdapter::Base
  class << self
    def limit
      10
    end
    def search_default(term, page, options)
      if options[:init].nil?
        things = default_finder(Thing.all, term, page: page)
        count = default_count(Thing.all, term)
        {
            items: things.map do |thing|
              { text: thing.name, id: '3' }
            end,
            total: count
        }
      else
        get_init_values(Thing, options[:item_ids])
      end
    end
  end
end