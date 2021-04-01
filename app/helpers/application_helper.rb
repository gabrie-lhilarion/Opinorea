module ApplicationHelper
  def display_image(user_id, photo)
    user = User.find(user_id)
    if user.photo.attached? && not_deleted(user.photo.attachment)
      image_tag photo, style: 'width: 55px; max-height: 55px'
    else
      "<span class=\"inside-round\">#{user.fullname[0]}</span>".html_safe
    end
  end

  def display_cover(user_id, cover_image)
    user = User.find(user_id)
    if user.cover_image.attached? && not_deleted(user.cover_image.attachment)
      image_tag cover_image, style: 'width: 100%; height: auto'
    else
      full = user.fullname
      name = user.username
      "<h1 class=\"cover_heading\">#{full}</h1> <h4 class=\"cover_subheading\"> <em> @#{name} </em> </h4>".html_safe
    end
  end

  def not_deleted(file)
    if !file.nil?
      full_file_path = File.absolute_path(file.filename.to_s)
      File.exist?(full_file_path)
    end
  end

end
