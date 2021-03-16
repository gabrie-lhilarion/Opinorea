module ApplicationHelper
    
  def display_image(user_id,photo)
    user = User.find(user_id) 
    if user.photo.attached?
     image_tag photo, style: "width: inherit; height: inherit"
    else  
     ''
    end
  end

  def display_cover(user_id,cover_image)
    user = User.find(user_id)
    if user.cover_image.attached?
     image_tag cover_image, style: "width: 100%; height: auto"
    else  
     "<h1 class=\"cover_heading\">#{user.fullname}</h1> <h4 class=\"cover_subheading\"> <em> @#{user.username} </em> </h4>".html_safe
    end
  end

end
