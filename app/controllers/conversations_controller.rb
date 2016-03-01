class ConversationsController < ApplicationController
  layout false
  #before_action :authenticate_user!
  before_action :get_mailbox
  before_action :get_conversation, except: [:index]

  def index
    sleep(1)
    set_content_title(nil, ['Conversations'])
    @conversations = @mailbox.inbox.paginate(page: params[:page], per_page: 7)
  end

  def show
    set_content_title(nil, ['Conversation'])
  end

  def mark_as_read
    @conversation.mark_as_read(current_user)
  end

  def destroy
    @conversation.move_to_trash(current_user)
  end

  private

  def get_mailbox
    @mailbox ||= current_user.mailbox
  end

  def get_conversation
    @conversation ||= @mailbox.conversations.find(params[:id])
  end
end