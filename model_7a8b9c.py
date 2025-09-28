import torch
import torch.nn as nn
import torch.optim as optim

# Define the neural network model
class BinaryClassifier(nn.Module):
    def __init__(self, input_size):
        super(BinaryClassifier, self).__init__()
        self.hidden1 = nn.Linear(input_size, 128)
        self.hidden2 = nn.Linear(128, 64)
        self.output = nn.Linear(64, 1)
        self.relu = nn.ReLU()
        self.sigmoid = nn.Sigmoid()

    def forward(self, x):
        x = self.relu(self.hidden1(x))
        x = self.relu(self.hidden2(x))
        x = self.sigmoid(self.output(x))
        return x

# Example usage
if __name__ == "__main__":
    # Initialize the model, e.g., for a dataset with 10 features
    model = BinaryClassifier(input_size=10)
    
    # Example input tensor (batch_size=5, features=10)
    example_input = torch.randn(5, 10)
    
    # Forward pass
    predictions = model(example_input)
    print("Model output shape:", predictions.shape) # Should be [5, 1]
    print("Sample output (first 5):", predictions[:5].detach().numpy())

    # Define loss and optimizer
    criterion = nn.BCELoss()
    optimizer = optim.Adam(model.parameters(), lr=0.001)

    # Example training step (requires actual data and labels)
    # optimizer.zero_grad()
    # loss = criterion(predictions, labels)
    # loss.backward()
    # optimizer.step()