class Author < ApplicationRecord
	attr_accessor :login
  delegate :can?, :cannot?, to: :ability
  has_many :articles, dependent: :destroy
  has_many :comments, through: :articles 
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def self.find_for_database_authentication warden_conditions
	  conditions = warden_conditions.dup
	  login = conditions.delete(:login)
	  where(conditions).where(["lower(username) = :value OR lower(email) = :value", {value: login.strip.downcase}]).first
	end
  
  validates_format_of :username, with: /^[a-zA-Z0-9_\.]*$/, :multiline => true
  def ability
    @ability ||= Ability.new(self)
  end
end
