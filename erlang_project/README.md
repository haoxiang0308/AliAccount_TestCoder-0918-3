# State Management Server

This project demonstrates state management concepts similar to Erlang's gen_server, implemented in Python using asyncio.

## Files

- `state_manager.py`: A Python implementation of a state management server with functionality similar to Erlang's gen_server.
- `counter_server.erl`: An Erlang gen_server implementation for managing a counter state.
- `counter_sup.erl`: Supervisor for the counter server.
- `counter_app.erl`: Application behavior for the counter.
- `counter.app`: Application resource file.
- `test_counter.erl`: Test module for the Erlang implementation.

## Python Implementation

The Python version uses asyncio to handle concurrent requests safely, with a lock to protect the shared state.

To run:
```bash
python3 state_manager.py
```

## Erlang Implementation

The Erlang version follows OTP principles with a gen_server behavior, supervisor, and application structure.

To compile (if Erlang was available):
```bash
erlc *.erl
```

To test the Erlang version:
```erlang
test_counter:run_test().
```

## Functionality

Both implementations provide:
- Increment counter
- Decrement counter
- Get current count
- Reset counter to zero