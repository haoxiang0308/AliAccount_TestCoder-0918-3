// Rust Ownership Demonstration

fn main() {
    // 1. Basic ownership
    let s1 = String::from("hello");
    let s2 = s1; // s1 is moved to s2, s1 is no longer valid
    // println!("{}", s1); // This would cause a compile error
    println!("s2: {}", s2);

    // 2. Ownership with functions
    let s3 = String::from("world");
    takes_ownership(s3); // s3 is moved into the function
    // println!("{}", s3); // This would cause a compile error

    let x = 5;
    makes_copy(x); // x is copied (not moved) because it's an integer
    println!("x is still valid after function call: {}", x);

    // 3. Returning values and ownership
    let s4 = gives_ownership(); // s4 receives ownership
    let s5 = String::from("hello");
    let s6 = takes_and_gives_back(s5); // s5 is moved to the function, s6 receives ownership
    println!("s4: {}, s6: {}", s4, s6);

    // 4. References and borrowing
    let s7 = String::from("hello");
    let len = calculate_length(&s7); // &s7 creates a reference to s7
    println!("The length of '{}' is {}.", s7, len);

    // 5. Mutable references
    let mut s8 = String::from("hello");
    change(&mut s8); // &mut s8 creates a mutable reference
    println!("After mutation: {}", s8);

    // 6. Multiple immutable references OR one mutable reference (but not both)
    let mut s9 = String::from("hello");
    
    // Multiple immutable references are allowed
    let r1 = &s9;
    let r2 = &s9;
    println!("r1: {}, r2: {}", r1, r2);
    
    // A mutable reference is allowed when no immutable references exist
    let r3 = &mut s9;
    println!("r3: {}", r3);
}

fn takes_ownership(some_string: String) {
    println!("Received string: {}", some_string);
    // some_string goes out of scope here and is dropped
}

fn makes_copy(some_integer: i32) {
    println!("Received integer: {}", some_integer);
    // some_integer goes out of scope here, but integers are copied, not moved
}

fn gives_ownership() -> String {
    let some_string = String::from("hello from function");
    some_string // Move ownership to caller
}

fn takes_and_gives_back(a_string: String) -> String {
    a_string // Return ownership to caller
}

fn calculate_length(s: &String) -> usize {
    s.len() // s is a reference, so it doesn't take ownership
} // s goes out of scope, but since it doesn't own the value, nothing happens

fn change(some_string: &mut String) {
    some_string.push_str(", world");
}