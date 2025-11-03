use std::fs::File;
use std::io::Write;
use std::time::{SystemTime, UNIX_EPOCH};

// Define an enum to demonstrate match usage
#[derive(Debug)]
enum Status {
    Active,
    Inactive,
    Pending,
    Error(String),
}

// Function to handle different enum values using match
fn handle_status(status: Status) -> String {
    match status {
        Status::Active => "Status is Active".to_string(),
        Status::Inactive => "Status is Inactive".to_string(),
        Status::Pending => "Status is Pending".to_string(),
        Status::Error(msg) => format!("Error occurred: {}", msg),
    }
}

fn main() {
    // Create different enum values to demonstrate match
    let statuses = vec![
        Status::Active,
        Status::Inactive,
        Status::Pending,
        Status::Error("Connection failed".to_string()),
    ];

    // Process each status using match
    let mut output = String::new();
    output.push_str("Rust Enum Match Results:\n");
    output.push_str("========================\n");

    for (i, status) in statuses.iter().enumerate() {
        let result = handle_status(status.clone());
        output.push_str(&format!("{}. {:?} -> {}\n", i + 1, status, result));
    }

    // Generate a filename using current timestamp (as a substitute for random)
    let timestamp = SystemTime::now()
        .duration_since(UNIX_EPOCH)
        .expect("Time went backwards")
        .as_secs();
    let random_filename = format!("output_{}.txt", timestamp);
    
    // Write the output to the file with "random" name
    let mut file = File::create(&random_filename).expect("Unable to create file");
    file.write_all(output.as_bytes()).expect("Unable to write to file");
    
    println!("Results saved to file: {}", random_filename);
    println!("{}", output);
}