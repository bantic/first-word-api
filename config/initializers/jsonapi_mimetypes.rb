# Without this mimetype registration, controllers will not automatically parse JSON API params.
# This code is from the jsonapi-serializers readme
module JSONAPI
  MIMETYPE = "application/vnd.api+json"
end

Mime::Type.register(JSONAPI::MIMETYPE, :api_json)
ActionDispatch::ParamsParser::DEFAULT_PARSERS[Mime::Type.lookup(JSONAPI::MIMETYPE)] = lambda do |body|
  JSON.parse(body)
end
