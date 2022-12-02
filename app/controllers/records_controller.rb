class RecordsController < ApplicationController
  before_action :set_record, only: %i[show edit update destroy]

  # GET /records
  def index
    set_group
    @records = Record.where(author_id: current_user.id).where(group_id: params[:group_id])
  end

  # GET /records/1
  def show; end

  # GET /records/new
  def new
    set_group
    @record = Record.new
  end

  # GET /records/1/edit
  def edit; end

  # POST /record
  def create
    set_group
    @record = current_user.records.new(record_params)

    respond_to do |format|
      if @record.save
        format.html { redirect_to group_records_path(@group), notice: 'Record was successfully created.' }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /records/1
  def update
    set_record

    respond_to do |format|
      if @record.update(record_params)
        format.html { redirect_to record_url(@record), notice: 'Record was successfully updated.' }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /records/1
  def destroy
    set_group
    @record.destroy

    respond_to do |format|
      format.html { redirect_to group_records_path(@group), notice: 'Record was successfully destroyed.' }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_record
    @record = Record.find(params[:id])
  end

  def set_group
    @group = Group.find(params[:group_id])
  end

  # Only allow a list of trusted parameters through.
  def record_params
    params.require(:record).permit(:name, :amount, :group_id)
  end
end
