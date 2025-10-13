use std::fs::File;
use std::io::Write;
use std::process;

#[derive(Debug)]
struct User {
    name: String,
    age: u32,
}

fn main() {
    let user = User {
        name: String::from("Alice"),
        age: 30,
    };

    // Generate a random filename
    let random_filename = format!("user_data_{}.txt", process::id());

    // Write user data to the file
    let mut file = File::create(&random_filename).expect("Unable to create file");
    writeln!(file, "Name: {}", user.name).expect("Unable to write name");
    writeln!(file, "Age: {}", user.age).expect("Unable to write age");

    println!("User data written to {}", random_filename);
}