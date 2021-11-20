module SessionsHelper
  #渡されたユーザーでログイン
  def log_in(user)
    session[:user_id] = user.id
  end

  #現在ログイン中のユーザーを返す
  def current_user
    if session[:user_id]
      @current_user ||= User.find_by(id: session[:user_id])　# findの場合idが入っていないと例外が返される
    end
  end

  def current_user?(user)
    user == current_user
  end

  #ログイン中ならtrue, そうでないならfalseが返る
  def logged_in?
    !current_user.nil?
  end

  #ログアウト
  def log_out
    session.delete(:user_id)
    @current_user = nil
  end
end
