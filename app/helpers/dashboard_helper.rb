module DashboardHelper
  def dashboard_username
    @dashboard_user.username
  end

  def dashboard_posts
    @dashboard_user.wall_posts
  end

  def posted_by(post)
    post.poster_revealed ? post.poster.username : 'Username Unknown'
  end
end
