require 'omniauth-oauth2'

module OmniAuth
  module Strategies
    class Imgur < OmniAuth::Strategies::OAuth2
      option :client_options, {
        :site => 'https://api.imgur.com',
        :authorize_url => 'https://api.imgur.com/oauth2/authorize',
        :token_url => 'https://api.imgur.com/oauth2/token'
      }

      def request_phase
        options[:response_type] ||= 'code'
        super
      end

      uid { raw_info['id'] }

      info do
        {
          'name'           => raw_info['url'],
          'bio'            => raw_info['bio'],
          'reputation'     => raw_info['reputation'],
          'created'        => raw_info['created'],
          'pro_expiration' => raw_info['pro_expiration']
        }
      end

      def raw_info
        @data ||= access_token.get('/3/account/me').parsed
      end
      
    end
  end
end
