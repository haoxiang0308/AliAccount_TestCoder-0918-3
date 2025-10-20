import torch
import torch.nn as nn
import torch.nn.functional as F
import random
import string

class BinaryClassifier(nn.Module):
    """
    A simple neural network for binary classification
    """
    def __init__(self, input_size, hidden_size=64):
        super(BinaryClassifier, self).__init__()
        self.fc1 = nn.Linear(input_size, hidden_size)
        self.fc2 = nn.Linear(hidden_size, hidden_size // 2)
        self.fc3 = nn.Linear(hidden_size // 2, 1)
        self.dropout = nn.Dropout(0.2)
        
    def forward(self, x):
        x = F.relu(self.fc1(x))
        x = self.dropout(x)
        x = F.relu(self.fc2(x))
        x = self.dropout(x)
        x = torch.sigmoid(self.fc3(x))  # Sigmoid for binary classification
        return x

def create_random_filename():
    """Generate a random filename with .py extension"""
    letters = string.ascii_lowercase
    random_name = ''.join(random.choice(letters) for i in range(10))
    return f"{random_name}.py"

def save_model_to_random_file(input_size=10, hidden_size=64):
    """Create the model and save it to a randomly named file"""
    # Create the model
    model = BinaryClassifier(input_size, hidden_size)
    
    # Generate random filename
    random_filename = create_random_filename()
    
    # Save the model definition to the file
    model_code = f'''import torch
import torch.nn as nn
import torch.nn.functional as F

class BinaryClassifier(nn.Module):
    """
    A neural network for binary classification
    """
    def __init__(self, input_size={input_size}, hidden_size={hidden_size}):
        super(BinaryClassifier, self).__init__()
        self.fc1 = nn.Linear(input_size, hidden_size)
        self.fc2 = nn.Linear(hidden_size, hidden_size // 2)
        self.fc3 = nn.Linear(hidden_size // 2, 1)
        self.dropout = nn.Dropout(0.2)
        
    def forward(self, x):
        x = F.relu(self.fc1(x))
        x = self.dropout(x)
        x = F.relu(self.fc2(x))
        x = self.dropout(x)
        x = torch.sigmoid(self.fc3(x))  # Sigmoid for binary classification
        return x

# Example usage:
# model = BinaryClassifier(input_size={input_size})
# sample_input = torch.randn(1, {input_size})
# output = model(sample_input)
# print(f"Model output: {{output.item():.4f}}")
'''
    
    with open(random_filename, 'w') as f:
        f.write(model_code)
    
    print(f"Binary classification model saved to: {random_filename}")
    return random_filename

if __name__ == "__main__":
    # Create and save the model to a randomly named file
    filename = save_model_to_random_file()
    print(f"Model has been saved as {filename}")