# frozen_string_literal: true

class TopsController < ApplicationController
  skip_before_action :authenticate_user!
  def show; end
end
