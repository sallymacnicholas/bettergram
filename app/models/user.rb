class User < ActiveRecord::Base
  def self.find_or_create_from_oauth(oauth)
    user = User.find_or_create_by(provider: oauth.provider, uid: oauth.uid)
    user.username = oauth.info.nickname
    user.image = oauth.info.image
    user.website = oauth.info.website
    user.token = oauth.credentials.token
    user.save

    user
  end

  def client
    @client = Instagram.client(access_token: token)
  end

  def feed
    client.user_media_feed.first(18)
  end

  def posts
    client.user_recent_media.first(18)
  end

  def client_user
    client.user
  end
end
