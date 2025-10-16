import random
import string

def generate_random_filename():
    # Generate a random filename with 10 random characters
    random_chars = ''.join(random.choice(string.ascii_lowercase + string.digits) for _ in range(10))
    return f"/workspace/{random_chars}.lua"

def create_lua_file():
    # Generate random filename
    filename = generate_random_filename()
    
    # Lua code content
    lua_content = '''-- Function to add two numbers
function add(a, b)
    return a + b
end

-- Example usage
print("5 + 3 =", add(5, 3))
print("10 + 20 =", add(10, 20))
'''
    
    # Write the content to the randomly named file
    with open(filename, 'w') as f:
        f.write(lua_content)
    
    print(f"Created Lua file: {filename}")
    return filename

if __name__ == "__main__":
    create_lua_file()