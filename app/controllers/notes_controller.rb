class NotesController < ApplicationController
  before_action :set_note, only: %i[ show edit update destroy ]

  # MARK: GET /
  # MARK: GET /notes
  def index
    @notes = Note.order(updated_at: :desc)
    @note = Note.find_by(id: params[:id])
  end

  # MARK: GET /notes/new
  def new
    @note = Note.new
  end

  # MARK: POST /notes
  def create
    @note = Note.new(note_params)
    if @note.save
      redirect_to url_for(controller: :notes, action: :index, id: @note.id), notice: "Note was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # MARK: GET /notes/:id/edit
  def edit
  end

  # MARK: PATCH/PUT /notes/:id
  def update
    if @note.update(note_params)
      redirect_to url_for(controller: :notes, action: :index, id: @note.id), notice: "Note was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # MARK: DELETE /notes/:id
  def destroy
    @note.destroy
    redirect_to url_for(controller: :notes, action: :index), notice: "Note was successfully deleted."
  end

  private

  def set_note
    @note = Note.find(params[:id])
  end

  # MARK: Strong parameters
  def note_params
    params.require(:note).permit(:title, :content)
  end
end
