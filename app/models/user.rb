class User < ActiveRecord::Base

	acts_as_voter

	has_many :links

	def self.sign_in_from_omniauth auth #auth is response
		find_by(provider: auth['provider'], uid: auth['uid']) || create_user_from_omniauth(auth)
	end

	def self.create_user_from_omniauth auth
		create(
			provider: auth['provider'],
			uid: auth['uid'],
			name: auth['info']['name']
		)
	end

  # def self.current
  #   Thread.current[:user]
  # end

  # def self.current=(user)
  #   Thread.current[:user] = user
  # end
end