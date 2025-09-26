// Rust Ownership Demo

fn main() {
    // 1. Ownership basics
    println!("--- Ownership Basics ---");
    let s1 = String::from("hello"); // s1 owns the string data
    let s2 = s1; // ownership is moved from s1 to s2
    // println!("{}", s1); // This line would cause a compile-time error because s1 is no longer valid

    println!("s2 is '{}'", s2);

    // 2. Functions and ownership
    println!("\n--- Functions and Ownership ---");
    let s3 = String::from("world");
    takes_ownership(s3); // s3's value is moved into the function and is no longer valid here
    // println!("{}", s3); // This would also cause a compile-time error

    let x = 5; // integers have Copy trait, so they behave differently
    makes_copy(x); // x is copied, so it's still valid after the function call
    println!("x is still valid after makes_copy: {}", x);

    // 3. Return values and scope
    println!("\n--- Return Values and Scope ---");
    let s4 = gives_ownership(); // gives_ownership moves its return value into s4
    let s5 = String::from("rust");
    let s6 = takes_and_gives_back(s5); // s5 is moved into the function, and the return value is moved to s6
    println!("s4: '{}', s6: '{}'", s4, s6);
    // s5 is no longer valid here

    // 4. References and Borrowing
    println!("\n--- References and Borrowing ---");
    let s7 = String::from("hello");
    let len = calculate_length(&s7); // Pass a reference to s7, s7 still owns the data
    println!("The length of '{}' is {}.", s7, len);

    // Mutable reference
    let mut s8 = String::from("hi");
    println!("Before change: '{}'", s8);
    change(&mut s8); // Pass a mutable reference
    println!("After change: '{}'", s8);
}

fn takes_ownership(some_string: String) { // some_string comes into scope
    println!("Received string: '{}'", some_string);
} // some_string goes out of scope and `drop` is called. The memory is freed.

fn makes_copy(some_integer: i32) { // some_integer comes into scope
    println!("Received integer: '{}'", some_integer);
} // some_integer goes out of scope. Nothing special happens.

fn gives_ownership() -> String {             // gives_ownership will move its return value into the function that calls it
    let some_string = String::from("hello"); // some_string comes into scope

    some_string                              // some_string is returned and moves out to the calling function
}

fn takes_and_gives_back(a_string: String) -> String { // a_string comes into scope
    a_string  // a_string is returned and moves out to the calling function
}

fn calculate_length(s: &String) -> usize { // s is a reference to a String
    s.len() // We can use the methods of the referenced object
} // s goes out of scope, but since it does not have ownership of what it refers to, nothing happens.

fn change(some_string: &mut String) { // some_string is a mutable reference
    some_string.push_str(", world"); // We can modify the object through the mutable reference
}