module PostsHelper

  def post_liked_by_user? likes, post_id
    logger.debug likes
    logger.debug post_id

    likes.include? post_id
  end

end
