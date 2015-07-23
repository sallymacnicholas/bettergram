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
    # response = client.user_media_feed
    # album = [].concat(response)
    # max_id = response.pagination.next_max_id
    #
    # while !(max_id.to_s.empty?) do
    #   response = client.user_media_feed(:max_id => max_id)
    #   max_id = response.pagination.next_max_id
    #   album.concat(response)
    # end
    #
    # @album = album
  end

  def client_user
    client.user
  end

  def profile_posts(id)
    client.user_recent_media(id).first(18)
  end

  def posts
    client.user_recent_media.first(18)
  end
end
