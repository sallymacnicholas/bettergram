class DashboardController < ApplicationController
  def index
    @next_images = Instagram.client(access_token: current_user.token).user_media_feed.pagination.next_max_id
  end

  def trending
  end

  def show
    @id = params[:id]
    @profile_client = Instagram.client(access_token: current_user.token)
  end
end
