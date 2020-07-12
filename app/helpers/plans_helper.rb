# frozen_string_literal: true

module PlansHelper
  def chose_plan_image(plan)
    if plan.image.present?
      user.image.url
    else
      'travel.jpg'
    end
  end
end
