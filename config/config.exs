import Config

config :crawly,
  middlewares: [
    Crawly.Middlewares.DomainFilter,
    Crawly.Middlewares.RobotsTxt,
    Crawly.Middlewares.UniqueRequest,
    {Crawly.Middlewares.UserAgent,
     user_agents: [
       "Mozilla/5.0 (compatible; github.com/ilkka)"
     ]}
  ],
  pipelines: [
    {Crawly.Pipelines.Validate, fields: [:game, :url]},
    {Crawly.Pipelines.DuplicatesFilter, item_id: :game},
    Crawly.Pipelines.JSONEncoder,
    {Crawly.Pipelines.WriteToFile, folder: "/tmp", extension: "jl", include_timestamp: false}
  ]
