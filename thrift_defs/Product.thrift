// Product.thrift
// Definition of a Product struct for use with Apache Thrift

namespace java com.example.thrift
namespace py example.thrift

struct Product {
  1: required i32 id,
  2: required string name,
  3: optional string description,
  4: required double price,
  5: optional i32 quantity,
  6: optional string category,
  7: optional bool inStock = true,
  8: optional map<string, string> attributes
}