// Product.thrift
// Apache Thrift struct definition for a Product

namespace java com.example.thrift.product
namespace py product.thrift

struct Product {
  1: i32 id,
  2: string name,
  3: string description,
  4: double price,
  5: i32 quantity,
  6: optional string category,
  7: optional string brand,
  8: optional bool inStock = true,
  9: optional map<string, string> attributes,
  10: optional list<string> tags
}