# Filtered DataFrame saved to this file
import pandas as pd

data = [
  {
    "Name":"Bob",
    "Age":30,
    "City":"London",
    "Salary":60000
  },
  {
    "Name":"Charlie",
    "Age":35,
    "City":"Paris",
    "Salary":70000
  },
  {
    "Name":"David",
    "Age":28,
    "City":"Tokyo",
    "Salary":55000
  },
  {
    "Name":"Frank",
    "Age":33,
    "City":"Berlin",
    "Salary":65000
  },
  {
    "Name":"Henry",
    "Age":31,
    "City":"Rome",
    "Salary":68000
  }
]

filtered_data = pd.DataFrame(data)
print('Filtered data loaded from file')
print(filtered_data)
