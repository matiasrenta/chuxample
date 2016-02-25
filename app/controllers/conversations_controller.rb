class ConversationsController < ApplicationController
  layout false
  #before_action :authenticate_user!
  before_action :get_mailbox
  before_action :get_conversation, except: [:index]

  def index
    set_content_title(nil, ['Conversations'])
    @conversations = @mailbox.inbox.paginate(page: params[:page], per_page: 10)
  end

  def show
    set_content_title(nil, ['Conversation'])
  end

  private

  def get_mailbox
    @mailbox ||= current_user.mailbox
  end

  def get_conversation
    @conversation ||= @mailbox.conversations.find(params[:id])
  end
end