# frozen_string_literal: true

class CategoriesController < ApplicationController
  # GET /categories
  def index
    @categories = Category.all

    render_json(@categories)
  end
end
