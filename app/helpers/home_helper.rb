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
      subcategoryList = Subcategory.joins(:root_category).where(root_categories: { id: root_category.id })
      if (subcategoryList.count > 0)
        menu += '<ul class="nav navbar-nav">'
        subcategoryList.each do |subItem|
          menu += '<li><a href="/categories/' + subItem.slug + '">- ' + subItem.name + '</a></li>'
        end
        menu += '</ul>'
      end


      menu += '</li>'
    end

    menu += '</ul>'
    # <li class="active"><a href="#">Искусство <span class="badge">216</span></a></li>
  end

end
