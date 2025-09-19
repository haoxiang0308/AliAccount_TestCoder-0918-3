// Product Service Thrift Definition

namespace java com.example.product
namespace py product_service

/**
 * Product struct representing a product in the system
 */
struct Product {
  1: required i64 id,
  2: required string name,
  3: required string description,
  4: required double price,
  5: optional string category,
  6: optional map<string, string> attributes,
  7: optional bool isActive = true,
  8: optional i32 stockQuantity = 0
}

/**
 * Exception for product not found
 */
exception ProductNotFoundException {
  1: i64 productId,
  2: string message
}

/**
 * Product service interface
 */
service ProductService {
  Product getProduct(1: i64 productId) throws (1: ProductNotFoundException notFound),
  bool createProduct(1: Product product),
  bool updateProduct(1: Product product) throws (1: ProductNotFoundException notFound),
  bool deleteProduct(1: i64 productId) throws (1: ProductNotFoundException notFound),
  list<Product> listProducts(1: optional string category)
}