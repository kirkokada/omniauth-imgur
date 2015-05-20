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

      uid { raw_info['account_id'] }

      info do
        {
          'name'     => raw_info['account_username'],
          'email'    => raw_info['email'],
          'image'    => raw_info['profile_picture'],
          'bio'      => raw_info['bio'],
          'website'  => raw_info['website'],
        }
      end

      def raw_info
        @data ||= access_token.params["user"]
        unless @data
          access_token.options[:mode] = :query
          access_token.options[:param_name] = "access_token"
          @data ||= access_token.get('/v1/users/self').parsed['data'] || {}
        end
        @data
      end

      # You can pass +scope+ params to the auth request, if you need to set them dynamically.
      # You can also set these options in the OmniAuth config :authorize_params option.
      #
      # For example: /auth/imgur?scope=likes+photos
      def authorize_params
        super.tap do |params|
          %w[scope].each do |v| 
            params[v.to_sym] = request.params[v] if request.params[v]
            if params[v.to_sym]
              params[v.to_sym] = Array(params[v.to_sym]).join(' ')
            end
          end
        end
      end
      
    end
  end
end
