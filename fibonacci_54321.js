// Function to generate Fibonacci sequence up to n terms
function fibonacci(n) {
    if (n <= 0) {
        console.log("Please enter a positive integer.");
        return;
    } else if (n === 1) {
        console.log("Fibonacci sequence up to 1 term: 0");
        return;
    }

    let sequence = [0, 1];
    for (let i = 2; i < n; i++) {
        sequence[i] = sequence[i - 1] + sequence[i - 2];
    }

    console.log(`Fibonacci sequence up to ${n} terms: ${sequence.join(', ')}`);
}

// Example usage:
fibonacci(10);
