class Message < NanoStore::Model
    attribute :id
    attribute :from
    attribute :to
    attribute :subject
    attribute :unread
end
