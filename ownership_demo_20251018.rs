// Rust Ownership Concept Demonstration
// This code shows the three main rules of Rust ownership

fn main() {
    // Rule 1: Each value in Rust has a variable that's called its owner
    let s1 = String::from("hello");
    println!("s1: {}", s1);

    // Rule 2: There can only be one owner at a time
    // When we transfer ownership (move), the original variable becomes invalid
    let s2 = s1;  // s1's value is moved to s2, s1 is no longer valid
    // println!("s1: {}", s1);  // This would cause a compile error!
    println!("s2: {}", s2);

    // Demonstrating ownership with functions
    let s3 = String::from("world");
    takes_ownership(s3);  // s3's ownership is moved to the function
    // println!("s3: {}", s3);  // This would cause a compile error!

    // Demonstrating ownership with values that implement Copy trait
    let x = 5;
    makes_copy(x);  // x is copied, not moved
    println!("x is still valid after function call: {}", x);  // This works fine

    // Rule 3: When the owner goes out of scope, the value will be dropped
    {
        let s4 = String::from("inner scope");
        println!("s4: {}", s4);
    }  // s4 goes out of scope here and is dropped

    // Demonstrating borrowing to avoid taking ownership
    let s5 = String::from("hello");
    let len = calculate_length(&s5);  // Borrow s5 without taking ownership
    println!("The length of '{}' is {}.", s5, len);  // s5 is still valid here

    // Demonstrating mutable borrowing
    let mut s6 = String::from("hello");
    println!("Before change: {}", s6);
    change(&mut s6);  // Borrow s6 mutably
    println!("After change: {}", s6);
}

// Function that takes ownership of a String
fn takes_ownership(some_string: String) {
    println!("Received string: {}", some_string);
    // some_string goes out of scope here, and the memory is freed
}

// Function that works with a copy of an integer (Copy trait)
fn makes_copy(some_integer: i32) {
    println!("Received integer: {}", some_integer);
    // some_integer goes out of scope here, but since i32 implements Copy, nothing special happens
}

// Function that borrows a reference to a String
fn calculate_length(s: &String) -> usize {
    s.len()  // s is a reference to a String, so it doesn't take ownership
}  // s goes out of scope, but since it doesn't have ownership, nothing happens

// Function that mutably borrows a String
fn change(some_string: &mut String) {
    some_string.push_str(", world!");  // Modify the borrowed string
}  // The reference goes out of scope, but the original String remains valid