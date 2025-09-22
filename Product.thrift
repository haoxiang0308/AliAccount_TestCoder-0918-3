// Product.thrift
// Apache Thrift struct definition for a Product

namespace java com.example.product
namespace py product

struct Product {
  1: required i32 id,
  2: required string name,
  3: required string description,
  4: required double price,
  5: optional string category,
  6: optional bool inStock = true,
  7: optional i32 quantity
}