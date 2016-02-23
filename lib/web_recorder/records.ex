defmodule WebRecorder.Record do
  defstruct options: nil, responses: nil
end

defmodule WebRecorder.Request do
  defstruct url: nil, headers: [], method: nil, body: nil, options: [], request_body: ""
end

defmodule WebRecorder.Response do
  defstruct type: "ok", status_code: nil, headers: [], body: nil
end

defmodule WebRecorder.Checker.Results do
  defstruct dirs: nil, files: []
end
defmodule WebRecorder.Checker.Counts do
  defstruct server: 0, cache: 0
end
