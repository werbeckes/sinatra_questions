class Question < ActiveRecord::Base

  has_many   :answers
  belongs_to :user

  validates :text, presence: :true
end
