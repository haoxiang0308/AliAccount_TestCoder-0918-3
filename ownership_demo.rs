// Rust Ownership Demonstration
// This code shows the core concepts of ownership in Rust

fn main() {
    println!("=== Rust Ownership Demo ===");
    
    // 1. Ownership basics
    let s1 = String::from("hello");
    println!("s1: {}", s1);
    
    // Moving ownership - s1 is no longer valid after this
    let s2 = s1; // s1 is moved to s2, s1 is no longer valid
    // println!("s1: {}", s1); // This would cause a compile error!
    println!("s2: {}", s2);
    
    // 2. Functions and ownership
    let s3 = String::from("world");
    take_ownership(s3); // s3 is moved into the function
    // println!("s3: {}", s3); // This would cause a compile error!
    
    // 3. Copy types (integers, booleans, etc.) don't move
    let x = 5;
    let y = x; // x is copied to y, not moved
    println!("x: {}, y: {}", x, y); // Both are valid
    
    // 4. Return values and ownership
    let s4 = gives_ownership(); // Function gives ownership to s4
    let s5 = String::from("test");
    let s6 = takes_and_gives_back(s5); // s5 is moved to function, s6 gets ownership back
    println!("s4: {}, s6: {}", s4, s6);
    
    // 5. References and borrowing
    let s7 = String::from("borrowed");
    let len = calculate_length(&s7); // Borrow s7 without taking ownership
    println!("The length of '{}' is {}.", s7, len);
    
    // 6. Mutable references
    let mut s8 = String::from("hello");
    println!("Before mutation: {}", s8);
    change(&mut s8); // Borrow mutably
    println!("After mutation: {}", s8);
    
    // 7. Multiple immutable references or one mutable reference
    let mut s9 = String::from("multiple");
    let r1 = &s9; // no problem
    let r2 = &s9; // no problem
    println!("r1: {}, r2: {}", r1, r2);
    
    let r3 = &mut s9; // no problem - only one mutable reference
    println!("r3: {}", r3);
}

// Function that takes ownership of a String
fn take_ownership(some_string: String) {
    println!("Received string: {}", some_string);
    // some_string goes out of scope here and is dropped
}

// Function that returns ownership of a String
fn gives_ownership() -> String {
    String::from("gives_ownership")
}

// Function that takes and returns ownership
fn takes_and_gives_back(a_string: String) -> String {
    a_string // Return ownership to caller
}

// Function that borrows a reference to a String
fn calculate_length(s: &String) -> usize {
    s.len() // s is a reference, so it doesn't take ownership
} // s goes out of scope, but nothing happens since it doesn't have ownership

// Function that mutably borrows a String
fn change(some_string: &mut String) {
    some_string.push_str(", world");
}