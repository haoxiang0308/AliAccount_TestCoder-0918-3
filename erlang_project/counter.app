{application, counter,
 [{description, "A simple counter application"},
  {vsn, "0.1.0"},
  {registered, [counter_server]},
  {applications, [kernel, stdlib]},
  {mod, {counter_app, []}},
  {modules, [counter_app, counter_sup, counter_server]}
 ]}.