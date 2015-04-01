class InvitationState
  QUEUED = 1
  SENT = 2
  NOT_SENT = 3
  CANCELED = 4

  def InvitationState.get_name(key)
    case key
      when QUEUED
        'Invitation queued'
      when SENT
        'Delivery successful'
      when NOT_SENT
        'Sender email failed'
      when CANCELED
        'Invitation Canceled'
      else
        'Unknown error!'
    end
  end

end