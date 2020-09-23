class Api::NotesController < ApiController
  before_action :authorize_request

  def create
    @note = @current_user.notes.create(note_params)

    if @note.save
      render json: @note, status: :created
    else
      render json: @note.errors, status: :unprocessable_entity
    end
  end

  private

  def note_params
    params.permit(:text, :push_time)
  end
end
