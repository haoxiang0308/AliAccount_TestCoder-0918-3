// Define a struct for User with name and age fields
struct User {
    name: String,
    age: u32,
}

fn main() {
    // Create an instance of User
    let user = User {
        name: String::from("Alice"),
        age: 30,
    };

    // Print the user's information
    println!("User: {}, Age: {}", user.name, user.age);
}