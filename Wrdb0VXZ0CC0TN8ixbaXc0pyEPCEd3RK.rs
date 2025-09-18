// user.rs
// Define a struct for User with name and age fields

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

    println!("User: {:?}", user);
}