class QuipService

  def self.get_document(user, id)
  end

  # at the moment this is actually getting all desktop threads. same thing as all threads?
  # TODO: get by user
  def self.get_all_documents(user)
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