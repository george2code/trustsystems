class InviteHolder

  attr_reader :email, :name, :orderId

  def initialize(email, name, orderId)
    @email = email
    @name = name
    @orderId = orderId
  end
end