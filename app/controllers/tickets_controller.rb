class TicketsController < ApplicationController
    def create
        event = Event.find_by(id: params[:event_id])
        @ticket = current_user.tickets.build do |t|
            t.event = event
        end
        if @ticket.save!
            flash.notice = "参加を表明しました"
            redirect_to event_path(event)
        end
    end

    def destroy
        ticket = current_user.tickets.find_by!(event_id: params[:event_id])
        ticket.destroy!
        redirect_to event_path(params[:event_id])
    end
end
