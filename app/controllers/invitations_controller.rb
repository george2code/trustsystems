class InvitationsController < ApplicationController
  layout 'dashboard'

  def hystory
    unless current_user.nil?
      @customers = InvitationCustomers.includes(:invitation).where("user_id = #{current_user.id}").references(:invitation).all
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
end