class EventsController < ApplicationController
    def index
        @events = Event.all
    end

    def new
        @event = current_user.created_events.build
    end

    def create
        @event = current_user.created_events.build(event_params)
        logger.debug"dddddddddd#{@event.errors.full_messages}"
        if @event.save
            redirect_to @event, notice: "作成しました"
        end
    end

    def edit
        @event = current_user.created_events.find_by(id: params[:id])
    end

    def update
        @event = current_user.created_events.find_by(id: params[:id])
        if @event.update(event_params)
            flash.notice = "編集しました"
            redirect_to @event
        else
            render :edit
        end
    end

    def show
        @event = Event.find_by(id: params[:id])
        @tickets = @event.tickets.includes(:user)
        @ticket = current_user && current_user.tickets.find_by(event:@event)
    end

    def destroy
        ticket = current_user.tickets.find_by(event_id: params[:event_id])
        ticket.destroy!
        redirect_to :events, notice: "参加をキャンセルしました"
    end

    private
    
    def event_params
        params.require(:event).permit(:owner_id, :name, :place, :start_date, :end_at, :content)
    end
end
