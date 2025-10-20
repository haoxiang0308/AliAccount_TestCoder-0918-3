// Rust Ownership Demo
// This program demonstrates the core concept of ownership in Rust

fn main() {
    // Ownership concept demonstration
    
    // 1. Variable binding and ownership
    let s1 = String::from("hello");
    println!("s1: {}", s1);
    
    // 2. Moving ownership (not copying)
    let s2 = s1; // s1's ownership is moved to s2
    // println!("s1: {}", s1); // This would cause a compile error!
    println!("s2: {}", s2);
    
    // 3. Demonstrating ownership with functions
    let s3 = String::from("world");
    takes_ownership(s3); // s3's ownership is moved to the function
    // println!("{}", s3); // This would cause a compile error!
    
    // 4. Working with integers (Copy types)
    let x = 5;
    makes_copy(x); // x is copied, not moved
    println!("x is still accessible: {}", x); // This works fine!
    
    // 5. Returning values and transferring ownership
    let s4 = gives_ownership(); // s4 now owns the returned value
    println!("s4: {}", s4);
    
    let s5 = String::from("test");
    let s6 = takes_and_gives_back(s5); // ownership transferred to function and back
    println!("s6: {}", s6);
    
    // 6. References to avoid taking ownership
    let s7 = String::from("reference");
    let len = calculate_length(&s7); // &s7 creates a reference
    println!("The length of '{}' is {}.", s7, len); // s7 is still valid here
}

// Function that takes ownership of a string
fn takes_ownership(some_string: String) {
    println!("Received string: {}", some_string);
    // some_string goes out of scope here, but since it's owned by this function,
    // Rust will clean it up
}

// Function that works with Copy types (like integers)
fn makes_copy(some_integer: i32) {
    println!("Received integer: {}", some_integer);
    // some_integer goes out of scope, but since it's Copy type, nothing special happens
}

// Function that gives ownership back
fn gives_ownership() -> String {
    let some_string = String::from("hello from function");
    some_string // Return ownership of the string
}

// Function that takes and returns ownership
fn takes_and_gives_back(a_string: String) -> String {
    a_string // Return ownership of the input string
}

// Function that uses a reference to avoid taking ownership
fn calculate_length(s: &String) -> usize { // s is a reference to a String
    s.len() // We can use the reference just like the original value
} // s goes out of scope, but since it doesn't have ownership, nothing happens