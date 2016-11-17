class QuipController < ApplicationController

  def get_threads(thread_id=nil)
    if thread_id.present?
      # thread = api call to get specific thread
      # Document.create_or_update_from_quip_thread(thread)
    else
      threads = QuipService.get_all_threads
      threads.each do |thread|
        Document.create_or_update_from_quip_threads(thread)
      end
    end
    redirect_back(fallback_location: root_path)
  end

end