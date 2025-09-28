import tempfile
import os

# Read the content of the original script
with open('/workspace/api_script_template.py', 'r') as f:
    script_content = f.read()

# Create a temporary file with a random name and .py extension
temp_file = tempfile.NamedTemporaryFile(mode='w', delete=False, suffix='.py', dir='/workspace', prefix='random_script_')
temp_file.write(script_content)
temp_file.close()

print(f"Python script created with a random name: {os.path.basename(temp_file.name)}")