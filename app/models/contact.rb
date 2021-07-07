class Contact < ApplicationRecord
  validates :name, presence: true
  has_many :email_labels, inverse_of: :contact
  has_many :emails, through: :email_labels
  accepts_nested_attributes_for :email_labels
end
