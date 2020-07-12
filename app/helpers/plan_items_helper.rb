# frozen_string_literal: true

module PlanItemsHelper
  def choose_category_image(item)
    case true
    when item.move?
      "move.png"
    when item.activity?
      "activity.png"
    when item.meal?
      "meal.png"
    when item.lodging?
      "lodging.png"
    end
  end
end
