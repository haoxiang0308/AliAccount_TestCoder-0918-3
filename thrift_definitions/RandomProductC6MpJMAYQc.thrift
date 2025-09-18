// RandomProductC6MpJMAYQc.thrift
// Definition of a Product struct for Apache Thrift

namespace java com.example.thrift.product
namespace py example.thrift.product
namespace cpp example.thrift.product

struct Product {
  1: i32 id,
  2: string name,
  3: string description,
  4: double price,
  5: i32 quantity,
  6: bool inStock,
  7: optional string category,
  8: optional string brand,
  9: optional string SKU,
  10: optional map<string, string> attributes
}

// Optional: Add a service definition
service ProductService {
  Product getProduct(1: i32 productId),
  list<Product> listProducts(),
  bool updateProduct(1: Product product),
  bool deleteProduct(1: i32 productId)
}