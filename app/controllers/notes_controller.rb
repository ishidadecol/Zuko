class NotesController < ApplicationController
  # MARK: GET /notes
  def index
    @notes = Note.all
  end

  # MARK: GET /notes/:id
  def show
    @note = Note.find(params[:id])
  end

  # MARK: GET /notes/new
  def new
    @note = Note.new
  end

  # MARK: POST /notes
  def create
    @note = Note.new(note_params)
    if @note.save
      redirect_to @note, notice: "Note was successfully created."
    else
      render :new
    end
  end

  # MARK: GET /notes/:id/edit
  def edit
    @note = Note.find(params[:id])
  end

  # MARK: PATCH/PUT /notes/:id
  def update
    @note = Note.find(params[:id])
    if @note.update(note_params)
      redirect_to @note, notice: "Note was successfully updated."
    else
      render :edit
    end
  end

  # MARK: DELETE /notes/:id
  def destroy
    @note = Note.find(params[:id])
    @note.destroy
    redirect_to notes_path, notice: "Note was successfully deleted."
  end

  private

  # MARK: Strong parameters
  def note_params
    params.require(:note).permit(:title, :content)
  end
end
