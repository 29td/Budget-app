module GroupsHelper
  def group_avatar(image)
    if image.present?
      image_tag(url_for(image), alt: 'icon', class: 'thumbnail icon-img')
    else
      image_tag('Gosave.png', alt: 'icon', class: 'thumbnail icon-img')
    end
  end
end
