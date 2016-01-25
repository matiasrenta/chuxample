class ThingCategorySearchAdapter < AutoSelect2::Select2SearchAdapter::Base
  class << self
    def limit
      10
    end
    def search_default(term, page, options)
      if options[:init].nil?
        thing_categories = default_finder(ThingCategory.order('id asc'), term, page: page)
        count = default_count(ThingCategory, term)
        {
            items: thing_categories.each{|thing_category| { text: thing_category.name, id: thing_category.id.to_s }},
            total: count
        }
      else
        get_init_values(ThingCategory, options[:item_ids])
      end
    end
  end
end