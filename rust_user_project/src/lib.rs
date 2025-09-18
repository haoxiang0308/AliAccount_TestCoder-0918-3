/// Represents a user with a name and age.
#[derive(Debug, Clone, PartialEq, Eq)]
pub struct User {
    /// The user's name.
    pub name: String,
    /// The user's age.
    pub age: u32,
}