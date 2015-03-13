class SendInvitations::AddInvitesController < ApplicationController
  include Wicked::Wizard
  layout 'dashboard'

  steps :add, :send_from, :select_template, :done

  def show
    render_wizard
  end

  def update
  end
end
