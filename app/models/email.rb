class Email < ApplicationRecord
  has_many :email_labels
  has_many :contacts, through: :email_labels
end
