class User < ApplicationRecord
  # extends ...................................................................

  # includes ..................................................................

  # relationships .............................................................

  # validations ...............................................................
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  has_secure_password

  # callbacks .................................................................
  before_save :format_email

  # scopes ....................................................................

  # additional config (i.e. accepts_nested_attribute_for etc...) ..............

  # class methods .............................................................

  # public instance methods ...................................................

  # protected instance methods ................................................

  # private instance methods ..................................................

  private

  def format_email
    self.email = email.downcase
  end
end
