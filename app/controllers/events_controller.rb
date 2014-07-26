class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, :log

  # GET /events
  # GET /events.json
  def index
    @events = Event.order("events.created_at DESC").page(params[:page]).per(10)
  end

  # GET /events/1
  # GET /events/1.json
  def show
  end

  # GET /events/new
  def new
    @event = Event.new
  end

  # GET /events/1/edit
  def edit
  end

  # POST /events
  # POST /events.json
  def create
    @event = Event.new(event_params)

    respond_to do |format|
      if @event.save
        format.html { redirect_to @event, notice: 'Event was successfully created.' }
        format.json { render :show, status: :created, location: @event }
      else
        format.html { render :new }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end
  #0278315450
  #def sendSMS(to, message, app_key, app_secret)
  def log
    text = request.raw_post
    code = text[0..3]
    result = text[3]
    pin = text[4..7]
    if result == '1'
      event = Event.new(action: "Entry by PIN", user: User.where(pin: pin).first)
    elsif result == '0'
      event = Event.new(action: "Failed PIN attempt")
      sms = SmsGateway.new("http://smsapi.dalek.co.nz/api/sendSMS")
      sms.sendSMS("+64278315450", "There was a failed PIN attempt for the door", "OTA1Mi40MTIwMjM", "MjYyOS4wODUyMDQwOTgzNzM3RGF0YWNvbXAgMjAxNCAtIERvb3")
    elsif result == '!'
      event = Event.new(action: "PIN Lockout")
      sms = SmsGateway.new("http://smsapi.dalek.co.nz/api/sendSMS")
      sms.sendSMS("+64278315450", "Due to repeated attempts of an incorrect PIN, the door is now in PIN Lockout mode", "OTA1Mi40MTIwMjM", "MjYyOS4wODUyMDQwOTgzNzM3RGF0YWNvbXAgMjAxNCAtIERvb3")
    else
      raise 'Unrecognized result flag ' + result
    end
    event.save
    render :nothing => true, :status => 204 
  end

  # PATCH/PUT /events/1
  # PATCH/PUT /events/1.json
  def update
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to @event, notice: 'Event was successfully updated.' }
        format.json { render :show, status: :ok, location: @event }
      else
        format.html { render :edit }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event.destroy
    respond_to do |format|
      format.html { redirect_to events_url, notice: 'Event was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def event_params
      params.require(:event).permit(:action, :user_id)
    end
end
