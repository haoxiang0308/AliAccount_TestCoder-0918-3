import random
import string
import shutil

# Generate a random filename
random_name = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10))
filename = f"/workspace/{random_name}.py"

# Copy the template to the new file
shutil.copy("/workspace/mysql_query_template.py", filename)

print(f"Python script with random name created: {filename}")