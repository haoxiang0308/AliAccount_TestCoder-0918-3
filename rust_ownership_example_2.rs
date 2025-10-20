// Rust Ownership Concepts Demonstration
// This file shows various aspects of Rust's ownership system

fn main() {
    println!("--- Rust Ownership Demo ---");
    
    // Basic ownership transfer
    let original_string = String::from("Hello, Rust!");
    println!("Original string: {}", original_string);
    
    // Transfer ownership to another variable
    let new_owner = original_string;  // original_string is now invalid
    // println!("Original: {}", original_string);  // This would cause a compile error!
    println!("New owner: {}", new_owner);
    
    // Demonstrating ownership with functions
    let my_string = String::from("Owned by main");
    take_ownership(my_string);  // Ownership transferred to function
    // println!("{}", my_string);  // Would cause error - my_string is no longer valid
    
    // Working with functions that return ownership
    let returned_string = give_ownership();
    println!("Got ownership back: {}", returned_string);
    
    // Demonstrating borrowing (using references)
    let s = String::from("Borrowed content");
    let length = get_length(&s);  // Pass a reference, not ownership
    println!("Length of '{}' is {}", s, length);  // s is still valid here
    
    // Mutable borrowing
    let mut mutable_string = String::from("Hello");
    println!("Before mutation: {}", mutable_string);
    change_string(&mut mutable_string);
    println!("After mutation: {}", mutable_string);
    
    // Multiple immutable references allowed
    let r1 = &mutable_string;
    let r2 = &mutable_string;
    println!("r1: {}, r2: {}", r1, r2);
    
    // But only one mutable reference allowed (and no immutable at the same time)
    let r3 = &mut mutable_string;
    println!("r3: {}", r3);
    // println!("r1: {}, r2: {}", r1, r2); // Would cause error - can't use r1, r2 now
}

fn take_ownership(s: String) {
    println!("Function took ownership of: {}", s);
    // s will be dropped when this function ends
}

fn give_ownership() -> String {
    let s = String::from("Owned by function");
    s  // Transfer ownership back to caller
}

fn get_length(s: &String) -> usize {
    s.len()  // s is a reference, so we don't take ownership
}  // No drop happens here since we borrowed, not owned

fn change_string(s: &mut String) {
    s.push_str(", World!");  // Modify the string through mutable reference
}  // No drop happens here since we borrowed, not owned