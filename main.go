package main

import (
	"fmt"
	"math/rand"
	"os"
	"time"
)

func main() {
	// Create a slice
	mySlice := []string{"initial"}

	// Add elements to the slice
	mySlice = append(mySlice, "element1")
	mySlice = append(mySlice, "element2")
	mySlice = append(mySlice, "element3")

	fmt.Println("Slice after adding elements:", mySlice)

	// Generate a random filename
	rand.Seed(time.Now().UnixNano())
	randomFileName := fmt.Sprintf("random_file_%d.txt", rand.Intn(10000))

	// Convert slice to string for writing to file
	content := fmt.Sprintf("Slice contents: %v", mySlice)

	// Write the slice to the file
	err := os.WriteFile(randomFileName, []byte(content), 0644)
	if err != nil {
		fmt.Printf("Error writing to file: %v\n", err)
		return
	}

	fmt.Printf("Slice saved to file: %s\n", randomFileName)
}