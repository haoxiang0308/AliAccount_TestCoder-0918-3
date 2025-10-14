import struct
import random

# Generate random coordinates (simulating Zig's f64 random values)
x = random.uniform(0, 100)
y = random.uniform(0, 100)

print(f"Generated Point: x={x}, y={y}")

# Pack the coordinates as two 64-bit floats (f64) into bytes
packed_data = struct.pack('dd', x, y)

# Write the packed bytes to the file
random_filename = "AvdUlI8pNEPh" # This is the random name generated previously
with open(random_filename, 'wb') as f:
    f.write(packed_data)

print(f"Point data written to file: {random_filename}")