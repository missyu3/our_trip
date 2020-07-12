# frozen_string_literal: true

module UsersHelper

  def chose_user_icon(user)
    if user.image.present?
      user.image.url
    else
      "human.png"
    end
  end
end
