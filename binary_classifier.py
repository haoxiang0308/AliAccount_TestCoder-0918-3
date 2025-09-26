import torch
import torch.nn as nn
import torch.nn.functional as F
import random
import string

class BinaryClassifier(nn.Module):
    """
    A simple neural network for binary classification.
    """
    def __init__(self, input_size, hidden_size1=64, hidden_size2=32, dropout_rate=0.2):
        super(BinaryClassifier, self).__init__()
        self.fc1 = nn.Linear(input_size, hidden_size1)
        self.fc2 = nn.Linear(hidden_size1, hidden_size2)
        self.fc3 = nn.Linear(hidden_size2, 1)  # Output layer for binary classification (single sigmoid output)
        self.dropout = nn.Dropout(dropout_rate)

    def forward(self, x):
        x = F.relu(self.fc1(x))
        x = self.dropout(x)
        x = F.relu(self.fc2(x))
        x = self.dropout(x)
        x = torch.sigmoid(self.fc3(x))  # Sigmoid for binary classification probability
        return x

# Example usage:
# Define model parameters
input_size = 10  # Number of features
model = BinaryClassifier(input_size=input_size)

# Print the model architecture
print(model)

# Generate a random filename
def generate_random_filename(prefix="nn_model_", suffix=".py"):
    random_string = ''.join(random.choices(string.ascii_letters + string.digits, k=8))
    return f"{prefix}{random_string}{suffix}"

random_filename = generate_random_filename()

# Save the model definition code to the randomly named file
with open(random_filename, 'w') as f:
    f.write('# PyTorch Binary Classification Model\n\n')
    f.write('import torch\n')
    f.write('import torch.nn as nn\n')
    f.write('import torch.nn.functional as F\n\n')
    f.write(model.__class__.__module__ + '.' + model.__class__.__qualname__ + ' = ' + model.__class__.__qualname__ + '\n')
    f.write('\n')
    f.write(model.__class__.__qualname__ + '.__module__ = __name__\n')
    f.write('\n')
    source_code = '''class BinaryClassifier(nn.Module):
    """
    A simple neural network for binary classification.
    """
    def __init__(self, input_size, hidden_size1=64, hidden_size2=32, dropout_rate=0.2):
        super(BinaryClassifier, self).__init__()
        self.fc1 = nn.Linear(input_size, hidden_size1)
        self.fc2 = nn.Linear(hidden_size1, hidden_size2)
        self.fc3 = nn.Linear(hidden_size2, 1)  # Output layer for binary classification (single sigmoid output)
        self.dropout = nn.Dropout(dropout_rate)

    def forward(self, x):
        x = F.relu(self.fc1(x))
        x = self.dropout(x)
        x = F.relu(self.fc2(x))
        x = self.dropout(x)
        x = torch.sigmoid(self.fc3(x))  # Sigmoid for binary classification probability
        return x
'''
    f.write(source_code)

print(f"Model definition saved to {random_filename}")
