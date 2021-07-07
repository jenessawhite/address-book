class EmailLabel < ApplicationRecord
  belongs_to :contact
  belongs_to :email
  accepts_nested_attributes_for :email
end
