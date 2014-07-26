class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable

  has_many :messages
  has_many :events
  validates_length_of :pin, :is => 4, :message => "must be 4 numbers"
  validates_numericality_of :pin, :message => "must only be numbers"
  validates_presence_of :pin, :name

  scope :admin_users, -> { where(admin: true) }
  scope :basic_users, -> { User.all - User.admin_users }
end
