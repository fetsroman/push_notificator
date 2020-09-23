class PushNotificationWorker
  include Sidekiq::Worker

  def perform(note_id)
    note = Note.find(note_id)
    fcm = FCM.new(ENV["FIREBASE_KEY"])

    registration_ids= note.user.devices.pluck(:token)

    options = {
        "notification": {
          "body": note.text
      }
    }
    fcm.send(registration_ids, options)
    note.destroy
  end
end
