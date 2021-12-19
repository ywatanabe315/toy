class OrganizationRegistrationForm
  include ActiveModel::Model

  attr_accessor :name, :address, :url, :user_emails

  validates :name, :address, presence: true

  def initialize(organization: Organization.new, attributes: nil)
    @organization = organization
    super(attributes)
  end

  def save
    return if invalid?
    @organization.update!(name: name, address: address, url: url)
    users = user_emails.split.map { |email| User.find_by(email: email) }
    @organization.update!(users: users)
  end
end
