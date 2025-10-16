// Rust Ownership Concepts Demonstration
//
// This program illustrates Rust's ownership system, which ensures memory safety
// without needing a garbage collector. The three key rules are:
// 1. Each value has a single owner variable
// 2. There can only be one owner at a time
// 3. When the owner goes out of scope, the value is dropped

fn main() {
    println!("=== Rust Ownership Demo ===");
    
    // Example 1: Basic ownership
    println!("\n1. Basic Ownership:");
    {
        let s = String::from("hello"); // s is the owner of the string
        println!("Value: {}", s);     // We can use s here
    } // s goes out of scope and the string is dropped
    
    // Example 2: Move semantics
    println!("\n2. Move Semantics:");
    {
        let s1 = String::from("rust");
        let s2 = s1;  // s1's value is moved to s2
        // println!("{}", s1); // This would cause a compile error!
        println!("s2: {}", s2);  // Only s2 is valid now
    }
    
    // Example 3: Cloning to avoid move
    println!("\n3. Cloning to Prevent Move:");
    {
        let s1 = String::from("clone");
        let s2 = s1.clone();  // Creates a deep copy
        println!("s1: {}, s2: {}", s1, s2); // Both are valid
    }
    
    // Example 4: Functions and ownership
    println!("\n4. Functions and Ownership:");
    {
        let s = String::from("owned by function");
        take_and_print(s); // Ownership is transferred to the function
        // s is no longer valid here
        let s2 = String::from("will return");
        let s3 = give_ownership(s2); // Ownership is transferred back
        println!("Got ownership back: {}", s3);
    }
    
    // Example 5: Borrowing
    println!("\n5. Borrowing (References):");
    {
        let s = String::from("borrowed");
        let len = get_length(&s); // Pass a reference, not the value
        println!("String '{}' has length {}", s, len); // s is still valid
    }
    
    // Example 6: Mutable borrowing
    println!("\n6. Mutable Borrowing:");
    {
        let mut s = String::from("hello");
        println!("Before: {}", s);
        append_world(&mut s); // Pass a mutable reference
        println!("After: {}", s); // s is modified but still valid
    }
    
    // Example 7: Restrictions on borrowing
    println!("\n7. Borrowing Restrictions:");
    {
        let mut s = String::from("restrictions");
        
        // Multiple immutable references are allowed
        let r1 = &s;
        let r2 = &s;
        println!("r1: {}, r2: {}", r1, r2);
        
        // But a mutable reference requires exclusive access
        let r3 = &mut s;
        println!("r3: {}", r3);
        // At this point r1 and r2 are no longer accessible
    }
    
    println!("\n=== End of Demo ===");
}

// Function that takes ownership and consumes the value
fn take_and_print(s: String) {
    println!("Function received: {}", s);
    // s goes out of scope here and is dropped
}

// Function that takes ownership and returns it
fn give_ownership(s: String) -> String {
    println!("Function received: {}", s);
    s // Return ownership to the caller
}

// Function that borrows (takes a reference) and doesn't take ownership
fn get_length(s: &String) -> usize {
    s.len() // We can read s but don't own it
}

// Function that takes a mutable reference
fn append_world(s: &mut String) {
    s.push_str(" world");
}