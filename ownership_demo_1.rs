// Rust Ownership Demo
// This program demonstrates key concepts of Rust's ownership system:
// 1. Ownership transfer (move semantics)
// 2. Borrowing (immutable and mutable)
// 3. References and lifetimes

fn main() {
    // 1. Basic ownership - when a value is assigned to a variable, 
    // that variable owns the value
    let s1 = String::from("hello");
    println!("s1: {}", s1);

    // 2. Moving ownership - when we assign s1 to s2, ownership moves to s2
    // s1 is no longer valid after this point
    let s2 = s1; // s1 is moved to s2, s1 is now invalid
    // println!("s1: {}", s1); // This would cause a compile error!
    println!("s2: {}", s2);

    // 3. Cloning to avoid move - if we want to keep both values
    let s3 = String::from("world");
    let s4 = s3.clone(); // Creates a deep copy
    println!("s3: {}, s4: {}", s3, s4); // Both are valid

    // 4. Ownership with functions
    let s5 = String::from("owned by main");
    takes_ownership(s5); // s5 is moved into the function
    // println!("{}", s5); // This would cause a compile error!

    // 5. Borrowing - immutable reference
    let s6 = String::from("borrowed");
    let len = calculate_length(&s6); // Pass a reference
    println!("The length of '{}' is {}.", s6, len); // s6 is still valid

    // 6. Borrowing - mutable reference
    let mut s7 = String::from("hello");
    println!("Before modification: {}", s7);
    change_string(&mut s7); // Pass a mutable reference
    println!("After modification: {}", s7);

    // 7. Multiple mutable references are not allowed in the same scope
    // let r1 = &mut s7;
    // let r2 = &mut s7; // This would cause a compile error!
    // println!("{}, {}", r1, r2);

    // 8. Mixing mutable and immutable references
    let r3 = &s7; // immutable reference
    let r4 = &s7; // immutable reference (allowed)
    println!("r3: {}, r4: {}", r3, r4);
    // let r5 = &mut s7; // This would cause a compile error!
    // println!("{}, {}, {}", r3, r4, r5);
}

// Function that takes ownership of a String
fn takes_ownership(some_string: String) {
    println!("Received string: {}", some_string);
    // some_string goes out of scope here and is dropped
}

// Function that borrows (takes a reference to) a String
fn calculate_length(s: &String) -> usize {
    s.len() // We can use s but don't own it
} // s goes out of scope here but nothing happens since we don't own it

// Function that takes a mutable reference
fn change_string(some_string: &mut String) {
    some_string.push_str(", world!"); // We can modify the original string
}