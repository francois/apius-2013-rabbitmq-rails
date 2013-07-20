class ApplicationController < ActionController::Base
  protect_from_forgery

  private

  def messaging_service
    @messaging_service ||= MessagingService.new
  end
end
