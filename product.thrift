namespace py product
namespace java com.example.product

// Struct to represent a Product
struct Product {
  1: i64 id,
  2: string name,
  3: string description,
  4: double price,
  5: i32 stock_quantity,
  6: bool is_active = 1,
  7: string category,
  8: list<string> tags,
  9: map<string, string> attributes
}