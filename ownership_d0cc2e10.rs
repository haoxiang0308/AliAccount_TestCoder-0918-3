// Rust Ownership Demo
// This program demonstrates the core concept of ownership in Rust

fn main() {
    println!("=== Rust Ownership Demo ===\n");

    // Example 1: Basic ownership transfer
    println!("1. Basic Ownership Transfer:");
    let s1 = String::from("hello");
    println!("s1 = {}", s1);

    let s2 = s1; // s1 is moved to s2, s1 is no longer valid
    // println!("s1 = {}", s1); // This would cause a compile error!
    println!("s2 = {}", s2);
    println!("(s1 is no longer valid after the move)\n");

    // Example 2: Ownership with functions
    println!("2. Ownership with Functions:");
    let s3 = String::from("world");
    println!("Before function call, s3 = {}", s3);

    takes_ownership(s3); // s3 is moved into the function
    // println!("s3 = {}", s3); // This would cause a compile error!

    let x = 5;
    println!("Before function call, x = {}", x);
    makes_copy(x); // x is copied (not moved) because it's an integer
    println!("After function call, x = {}", x); // This is fine because integers are copied
    println!();

    // Example 3: Returning ownership
    println!("3. Returning Ownership:");
    let s4 = String::from("hello");
    println!("Original string: {}", s4);

    let (s5, len) = calculate_length_with_return(s4); // s4 is moved to s5
    println!("String: {}, Length: {}", s5, len);
    println!();

    // Example 4: Borrowing (not transferring ownership)
    println!("4. Borrowing (References):");
    let s6 = String::from("Rust");
    println!("Original string: {}", s6);
    
    let len = calculate_length_with_reference(&s6); // &s6 creates a reference
    println!("Length calculated using reference: {}", len);
    println!("Original string still valid: {}", s6); // s6 is still valid because we borrowed it
    println!();

    // Example 5: Mutable borrowing
    println!("5. Mutable Borrowing:");
    let mut s7 = String::from("Hello");
    println!("Before mutation: {}", s7);
    
    change_string(&mut s7); // Pass a mutable reference
    println!("After mutation: {}", s7);
    println!();

    // Example 6: Demonstrating borrowing rules
    println!("6. Borrowing Rules:");
    let mut s8 = String::from("rules");
    
    let r1 = &s8; // immutable reference
    let r2 = &s8; // immutable reference
    println!("With immutable references r1 and r2: {}, {}", r1, r2);
    
    // let r3 = &mut s8; // This would cause a compile error!
    // println!("{}, {}, and {}", r1, r2, r3);
    
    let r3 = &mut s8; // mutable reference - this is fine now that r1 and r2 are out of scope
    println!("With mutable reference r3: {}", r3);
}

// Function that takes ownership of a String
fn takes_ownership(some_string: String) {
    println!("Received string: {}", some_string);
    // some_string goes out of scope here and is dropped
}

// Function that works with a copy (not ownership transfer)
fn makes_copy(some_integer: i32) {
    println!("Received integer: {}", some_integer);
    // some_integer goes out of scope here, but integers are copied, so nothing special happens
}

// Function that returns ownership
fn calculate_length_with_return(s: String) -> (String, usize) {
    let length = s.len(); // len() returns the length of a String
    (s, length) // Return both the String and its length
}

// Function that borrows (uses a reference)
fn calculate_length_with_reference(s: &String) -> usize {
    s.len() // We can use the string but don't own it
} // s is a reference, so nothing is dropped here

// Function that mutably borrows to change the string
fn change_string(some_string: &mut String) {
    some_string.push_str(", world!"); // Append to the string
}