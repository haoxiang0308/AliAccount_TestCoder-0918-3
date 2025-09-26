namespace py product_service
namespace java com.example.productservice

// Struct to represent a Product
struct Product {
  1: i64 id,
  2: string name,
  3: string description,
  4: double price,
  5: i32 stock_quantity,
  6: string category,
  7: optional string image_url,
  8: bool is_active = 1
}