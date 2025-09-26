import torch
import torch.nn as nn
import torch.optim as optim

# Define the neural network model
class BinaryClassifier(nn.Module):
    def __init__(self, input_size, hidden_size1, hidden_size2, dropout_rate=0.5):
        super(BinaryClassifier, self).__init__()
        self.fc1 = nn.Linear(input_size, hidden_size1)
        self.relu1 = nn.ReLU()
        self.dropout1 = nn.Dropout(dropout_rate)

        self.fc2 = nn.Linear(hidden_size1, hidden_size2)
        self.relu2 = nn.ReLU()
        self.dropout2 = nn.Dropout(dropout_rate)

        self.fc3 = nn.Linear(hidden_size2, 1)
        self.sigmoid = nn.Sigmoid()

    def forward(self, x):
        x = self.fc1(x)
        x = self.relu1(x)
        x = self.dropout1(x)

        x = self.fc2(x)
        x = self.relu2(x)
        x = self.dropout2(x)

        x = self.fc3(x)
        x = self.sigmoid(x)
        return x

# Example usage
if __name__ == "__main__":
    # Define model parameters
    INPUT_SIZE = 10  # Number of input features
    HIDDEN_SIZE1 = 64
    HIDDEN_SIZE2 = 32
    LEARNING_RATE = 0.001

    # Initialize the model
    model = BinaryClassifier(INPUT_SIZE, HIDDEN_SIZE1, HIDDEN_SIZE2)

    # Define loss function and optimizer
    criterion = nn.BCELoss()  # Binary Cross Entropy Loss
    optimizer = optim.Adam(model.parameters(), lr=LEARNING_RATE)

    print(f"Model initialized: {model}")
    print(f"Number of parameters: {sum(p.numel() for p in model.parameters())}")

    # Example forward pass with random data
    sample_input = torch.randn(1, INPUT_SIZE)
    output = model(sample_input)
    print(f"Sample input shape: {sample_input.shape}")
    print(f"Output probability: {output.item():.4f}")