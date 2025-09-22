# Erlang Double Module

This is a simple Erlang module that provides a function to double a number.

## Module: double_module

### Function: double/1

Doubles the input number.

**Usage:**
```erlang
double_module:double(5).  % Returns 10
double_module:double(7).  % Returns 14
```

### File: double_module.erl

The module is defined in `double_module.erl` with the following code:

```erlang
-module(double_module).
-export([double/1]).

%% Function to double a number
double(X) ->
    X * 2.
```