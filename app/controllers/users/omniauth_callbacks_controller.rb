class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def google_oauth2
    handle_auth('Google')
  end

  def handle_auth(kind)
    @user = User.from_omniauth(request.env['omniauth.auth'])
    if @user.persisted?
      flash[:notice] = I18n.t 'devise.omniauth_callbacks.success', kind: kind
      sign_in_and_redirect @user, event: :authentication
    else
      session["devise.#{kind}_data"] = request.env['omniauth.auth']
      redirect_to new_user_registration_url, alert: @user.errors.full_messages.join("\n")
    end
  end
end
