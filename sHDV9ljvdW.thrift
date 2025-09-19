// Product.thrift
// Apache Thrift struct definition for a Product

namespace java com.example.thrift
namespace py example.thrift

struct Product {
  1: i32 id,
  2: string name,
  3: string description,
  4: double price,
  5: i32 quantity,
  6: optional string category,
  7: optional bool is_active = true
}