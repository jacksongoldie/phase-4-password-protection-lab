class ApplicationController < ActionController::API
  include ActionController::Cookies

rescue_from ActiveRecord::RecordInvalid, with: :record_invalid

rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  private

  def record_invalid(invalid)
    render json: { error: invalid.record.errors.full_messages }, status: :unprocessable_entity
  end

  def record_not_found
    render json: { error: "Username not found" }, status: :unauthorized
  end

end
