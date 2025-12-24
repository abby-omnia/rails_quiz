class UnsubscribesController < ApplicationController
  allow_unauthenticated_access
  before_action :set_subscriber

  def show
    @subscriber&.destroy
    redirect_to root_path, notice: "unsubscribe success."
  end

  private
  def set_subscriber
    #透過token安全找尋訂閱者
    @subscriber = Subscriber.find_by_token_for(:unsubscribe, params[:token])
  end
end
