module LikesHelper
  def like_button_text(post, user)
    if post.likes.exists?(author: user)
      'Unlike'
    else
      "<i class='far fa-thumbs-up'></i> Like".html_safe
    end
  end
end
