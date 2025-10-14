fn main() {
    // --- Ownership Rules Demonstration ---

    println!("--- Basic Ownership Transfer ---");
    // 1. Each value has a single owner (variable).
    let s1 = String::from("hello"); // `s1` owns the string "hello"
    println!("Initial owner s1: {}", s1);

    // 2. Value can only have one owner at a time.
    // Assignment transfers ownership from s1 to s2. s1 is no longer valid.
    let s2 = s1; // Ownership moves from `s1` to `s2`. `s1` is now "moved" and invalid.
    // println!("s1 after move: {}", s1); // This would cause a compile-time error!

    println!("Value moved to s2: {}", s2);
    // println!("s1 after move: {:?}", s1); // This line is commented out because `s1` is no longer valid here.
    println!("s1 is no longer valid after the move.\n");

    println!("--- Ownership in Functions ---");
    // Ownership can also be moved when passing values to functions.
    let s3 = String::from("world");
    println!("Before function call, s3: {}", s3);
    takes_ownership(s3); // The value `s3` is moved into the function `takes_ownership`.
    // println!("After function call, s3: {}", s3); // This would cause a compile-time error!

    let x = 5; // Integer `x` is a Copy type, so it behaves differently.
    println!("Before function call, x: {}", x);
    makes_copy(x); // The value `x` is copied, so `x` remains valid.
    println!("After function call, x: {}", x); // This is fine because `x` was copied, not moved.

    println!("\n--- Functions Returning Ownership ---");
    let s4 = String::from("hello");
    println!("Initial string s4: {}", s4);
    let s5 = gives_ownership(s4); // `s4` is moved into the function, and its return value is assigned to `s5`.
    // `s4` is no longer valid here.
    println!("String returned and assigned to s5: {}", s5);

    let s6 = String::from("rust");
    println!("Another string s6: {}", s6);
    let (s7, len) = calculate_length(s6); // `s6` is moved, and the function returns a tuple containing the string and its length.
    // `s6` is no longer valid here.
    println!("Returned string s7: '{}', Length: {}", s7, len);
}

// This function takes ownership of a String.
fn takes_ownership(some_string: String) {
    println!("Received and taking ownership of: {}", some_string);
} // `some_string` goes out of scope here and `drop` is called. The memory is freed.

// This function takes a Copy type (like an integer), so the original value is unaffected.
fn makes_copy(some_integer: i32) {
    println!("Received a copy of the integer: {}", some_integer);
} // `some_integer` goes out of scope, but since it's a Copy type, nothing special happens.

// This function gives away ownership of a new String.
fn gives_ownership() -> String {
    let some_string = String::from("hello from gives_ownership");
    some_string // The value `some_string` is returned and ownership is transferred to the calling function.
}

// This function takes ownership of a String and returns ownership of a tuple containing the String and its length.
fn calculate_length(s: String) -> (String, usize) {
    let length = s.len(); // `len()` returns the length of the string.
    (s, length) // The tuple containing the string `s` and its length is returned. Ownership of `s` is transferred back.
}