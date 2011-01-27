
Omnisocial.setup do |config|
  # change default uri prefix for omniauth, for situations
  # when app is not running under domain root, i.e. http://www.domain.com/app/...
  #OmniAuth.config.path_prefix = '/app/auth'

  config.app_middleware.use OmniAuth::Builder do

    provider :open_id, nil, :name => 'google',
      :identifier => 'https://www.google.com/accounts/o8/id',
      :required => []

    provider :open_id, OpenID::Store::Filesystem.new("#{RAILS_ROOT}/tmp"), :name => 'yahoo',
      :identifier => 'https://me.yahoo.com',
      :required => []

    provider :facebook,
      'APP_ID', 'APP_KEY', { :scope => '' }
    
    provider :twitter,
      'APP_ID', 'APP_KEY'

    # ... see omniauth docs for more providers and options

  end

end
