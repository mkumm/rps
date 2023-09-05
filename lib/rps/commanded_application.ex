defmodule RPS.CommandedApplication do
  use Commanded.Application,
    otp_app: :rps,
    event_store: [
      adapter: Commanded.EventStore.Adapters.EventStore,
      event_store: RPS.EventStore
    ]
end
