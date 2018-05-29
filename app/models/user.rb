class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :reservacions
  has_many :videoconferencium
 
  

  def self.create_new_user(params)
  @user = User.create!(params)
  end
  
end
  
