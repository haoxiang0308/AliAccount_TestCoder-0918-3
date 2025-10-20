// Deep Dive into Rust Ownership
// This program demonstrates all aspects of Rust's ownership system

fn main() {
    println!("=== Rust Ownership Deep Dive ===\n");

    // 1. Stack vs Heap - Basic ownership
    println!("1. Basic Ownership:");
    let s1 = String::from("I'm owned by s1");
    println!("s1 = {}", s1);
    
    // Ownership moves to s2, s1 becomes invalid
    let s2 = s1;
    // println!("s1 = {}", s1);  // This would cause a compile-time error
    println!("s2 = {}", s2);
    println!("(s1 is no longer valid after move)\n");

    // 2. Functions and ownership
    println!("2. Functions and Ownership:");
    let my_string = String::from("Owned by main function");
    println!("Before function call: my_string exists");
    transfer_to_function(my_string);
    // println!("After function call: my_string = {}", my_string);  // Error!
    println!("(my_string no longer exists after function call)\n");

    // 3. Functions that return ownership
    println!("3. Functions Returning Ownership:");
    let returned_string = return_ownership();
    println!("Received from function: {}", returned_string);
    println!("(Ownership was returned from function)\n");

    // 4. Borrowing with references
    println!("4. Borrowing with References:");
    let original = String::from("I'm being borrowed");
    let length = calculate_length(&original);
    println!("The string '{}' has {} characters", original, length);
    println!("(Original string still owned by main)\n");

    // 5. Mutable borrowing
    println!("5. Mutable Borrowing:");
    let mut my_string = String::from("Hello");
    println!("Before mutation: {}", my_string);
    append_world(&mut my_string);
    println!("After mutation: {}", my_string);
    println!("(String was modified through mutable reference)\n");

    // 6. Reference scope rules
    println!("6. Reference Scope Rules:");
    reference_rules_demo();
    println!();

    // 7. Dangling references prevention
    println!("7. Dangling References Prevention:");
    let safe_string = no_dangling();
    println!("Received safely from function: {}", safe_string);
    println!("(No dangling references possible in safe Rust)");
}

fn transfer_to_function(s: String) {
    println!("  Function received ownership of: {}", s);
    // s will be dropped when this function ends
}

fn return_ownership() -> String {
    let s = String::from("Hello from function!");
    s  // Return ownership to caller
}

fn calculate_length(s: &String) -> usize {
    s.len()  // Using borrowed reference
}  // Reference goes out of scope, nothing special happens

fn append_world(s: &mut String) {
    s.push_str(", World!");
}  // Mutable reference goes out of scope

fn reference_rules_demo() {
    let mut s = String::from("reference demo");
    
    // Multiple immutable references are OK
    let r1 = &s;
    let r2 = &s;
    println!("  r1: {}, r2: {} (multiple immutable refs OK)", r1, r2);
    
    // One mutable reference is OK (but no immutable refs at the same time)
    let r3 = &mut s;
    println!("  r3: {} (mutable ref works alone)", r3);
    
    // After mutable borrow, immutable borrows are possible again
    let r4 = &s;
    println!("  r4: {} (immutable ref after mutable ref)", r4);
}

fn no_dangling() -> String {
    let s = String::from("This won't dangle");
    s  // Return the value, not a reference to local data
}