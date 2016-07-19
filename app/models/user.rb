class User < ActiveRecord::Base

	def self.sign_in_from_omniauth auth #auth is response
		find_by(provider: auth['provider'], user_id: auth['user_id']) || create_user_from_omniauth(auth)
	end

	def self.create_user_from_omniauth auth
		create(
			provider: auth['provider'],
			user_id: auth['user_id'],
			name: auth['info']['name']
		)
	end
end