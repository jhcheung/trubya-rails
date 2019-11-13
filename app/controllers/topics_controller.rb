class TopicsController < ApplicationController

    def index
        @topics = Topic.only_enabled
    end

    def edit_all
        @topics = Topic.order_by_id
    end

    def update_all
        @topics = Topic.order_by_id
        @topics.each_with_index do |topic, index|
            topic.enabled = params[:topics][(index + 1).to_s][:enabled] 
            topic.save
        end
        
        redirect_to topics_path
    end

end
