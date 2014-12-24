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

      menu += '<a href="/categories/' + root_category.slug + '">'
      menu += root_category.name
      menu += '</a>'
      menu += '</li>'
    end

    menu += '</ul>'
    # <li class="active"><a href="#">Искусство <span class="badge">216</span></a></li>
    # <li>
    # <a href="#">Еда и напитки</a>
    #           <ul class="nav navbar-nav">
    #             <li><a href="#">- Nutrition</a></li>
    #             <li><a href="#">- Protein</a></li>
    #           </ul>
    # </li>
  end

end
