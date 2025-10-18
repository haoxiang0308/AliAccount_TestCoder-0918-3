// Rust Ownership Concept Demonstration

fn main() {
    // 1. Basic ownership: when a variable goes out of scope, its value is dropped
    {
        let s = String::from("hello"); // s is valid from this point forward
        println!("Value of s: {}", s);
        // s goes out of scope here and Rust calls the `drop` function
        // Memory is freed at this point
    } // s is no longer valid here

    // 2. Moving ownership: assigning a value to another variable transfers ownership
    let s1 = String::from("hello");
    let s2 = s1; // s1's ownership is moved to s2
    // println!("{}", s1); // This would cause a compile-time error!
    println!("Value of s2: {}", s2);

    // 3. Moving ownership when passing to functions
    let s3 = String::from("hello");
    takes_ownership(s3); // s3's ownership is moved to the function
    // println!("{}", s3); // This would cause a compile-time error!

    // 4. Copying values (for types that implement Copy trait)
    let x = 5;
    let y = x; // x is copied to y, not moved (integers implement Copy)
    println!("x = {}, y = {}", x, y); // Both are valid

    // 5. Returning ownership from functions
    let s4 = gives_ownership(); // Function returns ownership
    let s5 = String::from("world");
    let s6 = takes_and_gives_back(s5); // Function takes and returns ownership
    println!("s4: {}, s6: {}", s4, s6);

    // 6. References and borrowing
    let s7 = String::from("hello");
    let len = calculate_length(&s7); // Pass reference, not ownership
    println!("The length of '{}' is {}.", s7, len); // s7 is still valid

    // 7. Mutable references
    let mut s8 = String::from("hello");
    change(&mut s8); // Pass mutable reference
    println!("After mutation: {}", s8);

    // 8. Multiple immutable references OR one mutable reference (but not both)
    let r1 = &s8; // no problem
    let r2 = &s8; // no problem
    println!("{} and {}", r1, r2);
    // r1 and r2 are no longer used after this point

    let r3 = &mut s8; // no problem
    println!("Mutable reference: {}", r3);
}

fn takes_ownership(some_string: String) { // some_string comes into scope
    println!("{}", some_string);
} // some_string goes out of scope and `drop` is called

fn gives_ownership() -> String { // Function transfers ownership to caller
    let some_string = String::from("hello");
    some_string // Return value transfers ownership
}

fn takes_and_gives_back(a_string: String) -> String { // Takes ownership and returns it
    a_string
}

fn calculate_length(s: &String) -> usize { // s is a reference to a String
    s.len() // Length is calculated without taking ownership
} // s goes out of scope, but since it doesn't own the value, nothing happens

fn change(some_string: &mut String) { // Accepts a mutable reference
    some_string.push_str(", world"); // Can modify the original value
}