class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_one :author, dependent: :destroy

  validates_presence_of :email, :password

  after_create :create_author

  def create_author
    author = Author.create(name: name, age: age)
    self.author = author
    self.save
  end

end
