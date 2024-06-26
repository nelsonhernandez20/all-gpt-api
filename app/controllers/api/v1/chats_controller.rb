class Api::V1::ChatsController < ApplicationController
  before_action :set_chat, only: [:show, :update, :destroy]

  def index
    @chats = Chat.all
    render json: @chats
  end

  def create
    @chat = Chat.find_by(id_user: chat_params[:id_user])

    if @chat
      if @chat.update(chat_params)
        render json: @chat, status: :ok
      else
        render json: @chat.errors, status: :unprocessable_entity
      end
    else
      @chat = Chat.new(chat_params)
      if @chat.save
        render json: @chat, status: :created
      else
        render json: @chat.errors, status: :unprocessable_entity
      end
    end
  end

  def show
    render json: @chat
  end

  def update
    if @chat
      if @chat.update(chat_params)
        render json: @chat
      else
        render json: @chat.errors, status: :unprocessable_entity
      end
    else
      render json: { error: "Chat not found" }, status: :not_found
    end
  end

  def destroy
    @chat.destroy
  end

  private

  def set_chat
    @chat = Chat.find_by(id_user: params[:id_user])
  end

  def chat_params
    params.require(:chat).permit(:id_user, :messages, :username)
  end
end
