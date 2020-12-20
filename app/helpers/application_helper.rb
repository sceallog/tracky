module ApplicationHelper
  def avatar(user)
    if user.avatar.attached?
      url_for(user.avatar)
    elsif user.image
      user.image
    else
      'user-regular.svg'
    end
  end
end
