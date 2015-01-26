class User < ActiveRecord::Base



  # has_secure_password

   has_many :boards

  # EMAIL_REGEX = /\A[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}\Z/i

  # validates :first_name, :presence => true,
  #                        :length => { :maximum => 25 }
  # validates :last_name, :presence => true,
  #                       :length => { :maximum => 50 }
  # validates :username, :length => { :within => 5..25 },
  #                      :uniqueness => true
  # validates :email, :presence => true,
  #                   :length => { :maximum => 100 },
  #                   :format => EMAIL_REGEX,
  #                      :uniqueness => true

  # validates :password, :confirmation => true

  # scope :sorted, lambda {order('users.username ASC')}

def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.name = auth.info.name
      user.oauth_token = auth.credentials.token
      user.oauth_expires_at = Time.at(auth.credentials.expires_at)
      user.save!
    end
  end
end
