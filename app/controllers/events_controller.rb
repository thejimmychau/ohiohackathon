class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!, only: :new

    def find_nearby_events
        lat = params[:latitude]#these are taken from the machine's location
        lng = params[:longitude]
        
        if(params[:address] != "undefined" and params[:address] != "") #user defined address
            coordinates = GoogleGeocoder.geocode(address)
            lat = coordinates.latitude
            lng = coordinates.longitude
        end
        
        radius = (params[:radius] !="undefined" and params[:radius] != "") ? params[:radius] : 5#default = 5 miles
        
        max_event_end_time = DateTime.now
        max_event_end_time += (params[:time_range] !="undefined" and params[:time_range] != "") ? params[:time_range]/24.0 : 1#default = one day from now
        
        events = Event.within(radius,:origin=>[lat,lng]).where("(start_time < ? AND end_time > ?) OR (start_time >= ? AND end_time < ?)", DateTime.now, DateTime.now, DateTime.now, max_event_end_time)#first is long duration, currently running events, start is in the past and end is in the future. Next is short duration events, end is in the next user defined time period (default is 1 day)  and start is in the future
        
        
        #default=all tags (do not do any tag filtering)
        if(params[:tag] !="undefined" and params[:tag]!="")
            events = events.where("event_tag_id == ?", params[:tag])
        end
        
        respond_to do |format|
            format.json { 
                render json: events
            } 
        end
    end
    
  # GET /events
  # GET /events.json
  def index
      @event_tags = EventTag.all
  end

  # GET /events/1
  # GET /events/1.json
  def show
    @event = Event.find(params[:id])
  end

  # GET /events/new
  def new
      @tags = EventTag.all
      @event = Event.new
  end

  # GET /events/1/edit
  def edit
    @event = Event.find(params[:id])
  end

  # POST /events
  # POST /events.json
  def create   
        #transform address to lat+long
        address = event_params[:address]
        coordinates = GoogleGeocoder.geocode(address)
        #transform datetime_select form field to a datetime object

        start_t = DateTime.new(event_params["start_time(1i)"].to_i, 
                        event_params["start_time(2i)"].to_i,
                        event_params["start_time(3i)"].to_i,
                        event_params["start_time(4i)"].to_i,
                        event_params["start_time(5i)"].to_i)
        end_t = DateTime.new(event_params["end_time(1i)"].to_i, 
                        event_params["end_time(2i)"].to_i,
                        event_params["end_time(3i)"].to_i,
                        event_params["end_time(4i)"].to_i,
                        event_params["end_time(5i)"].to_i)
      
      #MANUALLY add field values to event - using a Hash caused a ton of errors
      @event = Event.new(title:event_params[:title],
          description:event_params[:description], 
          event_tag_id:event_params[:event_tag_id],
          
          address:event_params[:address],
          state:event_params[:state],
          city:event_params[:city],
          zip_code:event_params[:zip_code],
          
          start_time: start_t,
          end_time: end_t,
          
          longitude:coordinates.longitude, 
          latitude:coordinates.latitude,
          person_count_cap:event_params[:person_count_cap],
          user_id: current_user.id)
    
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
        params[:event]
    end
end
