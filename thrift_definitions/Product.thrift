// Product.thrift
// Definition of a Product struct for Apache Thrift

namespace java com.example.thrift
namespace py example.thrift

struct Product {
  1: i32 id,
  2: string name,
  3: string description,
  4: double price,
  5: i32 quantity,
  6: bool inStock,
  7: optional string category,
  8: optional string brand
}