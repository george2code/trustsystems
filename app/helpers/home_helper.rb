module HomeHelper

  def categories_menu(root_categories, slug)
    menu = '<ul class="nav navbar-nav">'

    root_categories.each do |root_category|
      # active element or not
      if slug.nil? and slug == root_category.slug
        menu += '<li class="active">'
      else
        menu += '<li>'
      end

      # root category link
      menu += '<a href="/categories/' + root_category.slug + '">'
      menu += root_category.name
      menu += '</a>'

      # get subcategories
      subcategory_list = Subcategory.joins(:root_category).where(root_categories: { id: root_category.id })
      if subcategory_list.count > 0
        menu += '<ul class="nav navbar-nav">'
        subcategory_list.each do |subItem|
          menu += '<li><a href="/categories/' + subItem.slug + '">- ' + subItem.name + '</a></li>'
        end
        menu += '</ul>'
      end

      menu += '</li>'
    end

    menu += '</ul>'
    return menu
  end


  def sub_categories(root_category)
    content = ''

    root_category.subcategories.all.each do |category|
      company_index = 1

      category.companies.all.each do |company|
        content += '<tr>'
        content += '<td>' + company_index.to_s + '</td>'
        content += '<td><a href="/companies/' + company.slug + '">' + company.name + '</a></td>'
        content += '<td class="mark">Otto</td>'
        content += '</tr>'

        company_index += 1
      end
    end


    return content.html_safe
  end


  def top_companies_by_category(category_id, is_top)
    @category = Subcategory.find(category_id)

    h = Hash.new
    @category.companies.each do |company|
      @avg_rate = company.reviews.average(:rating).round(1)
      h.store(company, @avg_rate.to_s)
    end

    return is_top ?
        Hash[h.sort_by{|k, v| v}.reverse] :
        Hash[h.sort_by{|k, v| v}]
  end
end