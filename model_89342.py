import torch
import torch.nn as nn
import torch.optim as optim


class BinaryClassifier(nn.Module):
    """
    A simple neural network for binary classification.
    """
    def __init__(self, input_size: int, hidden_size: int = 64):
        super(BinaryClassifier, self).__init__()
        self.fc1 = nn.Linear(input_size, hidden_size)
        self.relu = nn.ReLU()
        self.fc2 = nn.Linear(hidden_size, hidden_size // 2)
        self.relu2 = nn.ReLU()
        self.fc3 = nn.Linear(hidden_size // 2, 1)
        self.sigmoid = nn.Sigmoid()

    def forward(self, x: torch.Tensor) -> torch.Tensor:
        x = self.fc1(x)
        x = self.relu(x)
        x = self.fc2(x)
        x = self.relu2(x)
        x = self.fc3(x)
        x = self.sigmoid(x)
        return x


if __name__ == "__main__":
    # Example usage
    input_dim = 10  # Number of features
    model = BinaryClassifier(input_size=input_dim)
    print(model)

    # Example: Define loss and optimizer
    criterion = nn.BCELoss()
    optimizer = optim.Adam(model.parameters(), lr=0.001)

    # Dummy data for testing
    dummy_input = torch.randn(32, input_dim)  # Batch size of 32
    dummy_target = torch.randint(0, 2, (32, 1)).float()  # Random binary labels

    # Forward pass
    output = model(dummy_input)
    loss = criterion(output, dummy_target)

    print(f"Initial Loss: {loss.item():.4f}")

    # Backward pass and optimization step (example)
    optimizer.zero_grad()
    loss.backward()
    optimizer.step()

    # Loss after one step
    output_after_step = model(dummy_input)
    loss_after_step = criterion(output_after_step, dummy_target)
    print(f"Loss after one step: {loss_after_step.item():.4f}")