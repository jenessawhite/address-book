class Contact < ApplicationRecord
  validates :name, presence: true
  has_many :email_labels
  has_many :emails, through: :email_labels
end
