# frozen_string_literal: true

class ApplicationController < ActionController::API
    def render_json(params = nil, status = 200, msg = 'Success')
        response = {
          message: msg,
          status: status
        }
        response[:data] = params if params.present? || params.is_a?(FalseClass)
        response[:data] = [] if params == []
        render json: response, status: status
    end
end
