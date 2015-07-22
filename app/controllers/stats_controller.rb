class StatsController < ApplicationController
  def index
    @hashtags = current_user.client.user_recent_media.map(&:tags).join(",")
  end

  def all_your_hashtags

  end
end
