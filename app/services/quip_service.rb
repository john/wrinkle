class QuipService

  def self.get_document(user, id)
  end

  # at the moment this is actually getting all desktop threads. same thing as all threads?
  # TODO: get by user
  def self.get_all_documents(user)

    token = user.organization.quip_auth.token
    qc = Quip::QuipClient.new(access_token: token)

    quip_user = qc.get_authenticated_user()

    desktop = qc.get_folder(quip_user['desktop_folder_id'])

    threads = []
    desktop['children'].each do |c|
      c.each do |k, v|
        if k == 'thread_id'
          t = qc.get_thread(v)
          threads << t
        end
      end
    end
    threads
  end

end