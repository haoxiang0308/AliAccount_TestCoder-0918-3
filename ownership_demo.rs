// Rust Ownership Demonstration
// This code shows the three main rules of ownership in Rust

fn main() {
    // Rule 1: Each value in Rust has a variable that's called its owner
    let s1 = String::from("hello");
    println!("s1: {}", s1);

    // Rule 2: There can only be one owner at a time
    // When we transfer ownership, the first variable becomes invalid
    let s2 = s1; // Ownership of the value "hello" is moved from s1 to s2
    // println!("s1: {}", s1); // This would cause a compile error!
    println!("s2: {}", s2);

    // Demonstrating ownership transfer with functions
    let s3 = String::from("world");
    println!("s3 before function call: {}", s3);
    
    // Ownership is transferred to the function
    take_ownership(s3);
    // s3 is no longer valid here, so this would cause an error:
    // println!("s3 after function call: {}", s3);

    // Rule 3: When the owner goes out of scope, the value will be dropped
    let s4 = String::from("Rust");
    println!("s4 before scope: {}", s4);
    
    {
        let s5 = s4; // Ownership transferred to s5
        println!("s5 in inner scope: {}", s5);
        // s5 goes out of scope here, and the value is dropped
    } // s4 would have been dropped here if it were still valid
    
    // println!("s4 after scope: {}", s4); // This would cause an error

    // Demonstrating borrowing - a way to use values without taking ownership
    let s6 = String::from("borrowing");
    println!("s6 before borrowing: {}", s6);
    
    let length = calculate_length(&s6); // Pass a reference instead of transferring ownership
    println!("The length of '{}' is {}.", s6, length); // s6 is still valid here
    
    // Demonstrating mutable borrowing
    let mut s7 = String::from("hello");
    println!("s7 before mutation: {}", s7);
    change_string(&mut s7); // Pass a mutable reference
    println!("s7 after mutation: {}", s7);
}

// Function that takes ownership of a String
fn take_ownership(some_string: String) {
    println!("The string in take_ownership: {}", some_string);
    // some_string goes out of scope here, and the value is dropped
}

// Function that takes a reference to a String (borrowing)
fn calculate_length(s: &String) -> usize {
    s.len() // We can use s here, but we don't own it
} // s goes out of scope here, but since we don't own the value, nothing is dropped

// Function that takes a mutable reference
fn change_string(s: &mut String) {
    s.push_str(", world!"); // We can modify the string through the mutable reference
}