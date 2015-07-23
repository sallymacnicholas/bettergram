module DashboardHelper
  def username(feed_item)
    feed_item.caption.from.username
  end

  def likes(feed_item)
    feed_item.likes["count"]
  end

  def profile_picture(feed_item)
    feed_item.user.profile_picture
  end

  def stand_img(feed_item)
    feed_item.images.standard_resolution.url
  end

  def low_img(feed_item)
    feed_item.images.low_resolution.url
  end

  def post_user_pic(id, profile_client)
    profile_client.user_recent_media(id).first.caption.from.profile_picture
  end

  def post_user_username(id, profile_client)
    profile_client.user_recent_media(id).first.caption.from.username
  end
end
