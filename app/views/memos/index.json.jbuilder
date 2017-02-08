json.array!(@memos) do |memo|
  json.extract! memo, :id, :name
  json.url memo_url(memo, format: :json)
end
