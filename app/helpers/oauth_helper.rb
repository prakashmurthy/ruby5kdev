module OauthHelper
  def auth_providers(*names)
    names.each do |name|
      concat(link_to(image_tag("icons/#{name}_32.png"),
        user_omniauth_authorize_path(name),
        :id => "sign_in_with_#{name}",
        :title => "Log in with #{name.to_s.titleize}",
        :rel => "tooltip" ))
    end
    nil
  end
end
