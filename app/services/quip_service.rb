class QuipService

  # TODO: at some point this will have to be getting content
  # by a variety of user id's, or from a shared location in quip
  # that all contributors are adding to.

  def self.get_thread(thread_id)
  end

  # at the moment this is actually getting all desktop threads. same thing as all threads?
  def self.get_all_threads
    user = QuipClient.get_authenticated_user()
    desktop = QuipClient.get_folder(user['desktop_folder_id'])

    threads = []
    desktop['children'].each do |c|
      c.each do |k, v|
        if k == 'thread_id'
          t = QuipClient.get_thread(v)
          threads << t
        end
      end
    end
    threads
  end

end