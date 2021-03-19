module ApplicationHelper
  def display_image(user_id, photo)
    user = User.find(user_id)
    if user.photo.attached?
      image_tag photo, style: 'width: inherit; height: inherit'
    else
      "<span class=\"inside-round\">#{user.fullname[0]}</span>".html_safe
    end
  end

  def display_cover(user_id, cover_image)
    user = User.find(user_id)
    if user.cover_image.attached?
      image_tag cover_image, style: 'width: 100%; height: auto'
    else
      full = user.fullname
      name = user.username
      "<h1 class=\"cover_heading\">#{full}</h1> <h4 class=\"cover_subheading\"> <em> @#{name} </em> </h4>".html_safe
    end
  end
end
