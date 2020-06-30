class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def facebook
  @user = User.create_from_provider_data(request.env['omniauth.auth'])
  if @user.persisted?
    sign_in_and_redirect @user
    set_flash_message(:notice, :success, kind: 'Facebook') if is_navigational_format?
  else
    flash[:error] = 'Tivemos um problema com sua autenticação com Facebook. Por favor, registre-se na nossa plataforma, ou tente novamente mais tarde.'
    redirect_to new_user_registration_url
  end
end

def google_oauth2
  @user = User.create_from_provider_data(request.env['omniauth.auth'])
  if @user.persisted?
    sign_in_and_redirect @user
    set_flash_message(:notice, :success, kind: 'Google') if is_navigational_format?
  else
    flash[:error] = 'Tivemos um problema com sua autenticação com Google. Por favor, registre-se na nossa plataforma, ou tente novamente mais tarde.'
    redirect_to new_user_registration_url
  end
end

def failure
  flash[:error] = 'Tivemos um problema com sua autenticação. Por favor, registre-se na nossa plataforma, ou tente novamente mais tarde.'
  redirect_to new_user_registration_url
end
end
