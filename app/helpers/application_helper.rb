module ApplicationHelper
  def display_image(user_id, photo)
    user = User.find(user_id)
    profile_image = user.photo.attachment
    if user.photo.attached? && image_less_than_a_day_old?(user.photo.attachment)
      image_tag photo, style: 'width: 55px; max-height: 55px'
    else
      "<span class=\"inside-round\">#{user.fullname[0]}</span>".html_safe
    end
  end

  def display_cover(user_id, cover_image)
    user = User.find(user_id)
    if user.cover_image.attached? && image_less_than_a_day_old?(user.cover_image.attachment)
      image_tag cover_image, style: 'width: 100%; height: auto'
    else
      full = user.fullname
      name = user.username
      "<h1 class=\"cover_heading\">#{full}</h1> <h4 class=\"cover_subheading\"> <em> @#{name} </em> </h4>".html_safe
    end
  end

  def image_less_than_a_day_old?(file)
    require 'date'
    date_a = DateTime.now()
    this_month = date_a.to_s.split('-')[1]
    this_day = date_a.to_s.split('-')[2].split('T')[0]

    image_creation_time = file.created_at.to_s.split(' ')[0]
    image_month = image_creation_time.split('-')[1]
    image_day = image_creation_time.split('-')[2]

    if  this_month > image_month
      return false 
    elsif this_day > image_day
      return false 
    else return true
    end
  end

end
