class InvitationsController < ApplicationController
  layout 'dashboard'


  def hystory
    unless current_user.nil?
      @customers = Invitation.where(user_id: current_user.id)
    end
  end


  def invite_customers
    #clear session
    session.delete(:cp_invites)
    session.delete(:cp_sender)
    session.delete(:cp_reply)
  end


  def afs
  end


  def settings
  end


  def export
    invites = Invitation.where(state: InvitationState::QUEUED)
    if invites.any?
      invites.each do |invite|
        invite.state = InvitationState::CANCELED
        invite.save
      end

      render :json => ""
    end
  end
end