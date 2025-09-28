// This function generates the Fibonacci sequence up to n terms
function fibonacciSequence(n) {
    if (n <= 0) {
        console.log("Please enter a number greater than 0.");
        return;
    } else if (n === 1) {
        console.log([0]);
        return [0];
    }

    const sequence = [0, 1];
    for (let i = 2; i < n; i++) {
        const nextTerm = sequence[i - 1] + sequence[i - 2];
        sequence.push(nextTerm);
    }

    console.log(sequence);
    return sequence;
}

// Example usage:
// fibonacciSequence(10); // Outputs: [0, 1, 1, 2, 3, 5, 8, 13, 21, 34]