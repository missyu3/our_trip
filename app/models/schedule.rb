# frozen_string_literal: true

class Schedule < ApplicationRecord
  belongs_to :plan
  acts_as_list scope: :plan
  belongs_to :plan_item

end
