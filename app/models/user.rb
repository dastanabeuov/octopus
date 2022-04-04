class User < ApplicationRecord
  enum role: { guest: 0, paid_user: 1, admin: 2 } # , _suffix: :role
  
  has_many :digitization_agsks
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def author_of?(object)
    object.user_id == id
  end
end
