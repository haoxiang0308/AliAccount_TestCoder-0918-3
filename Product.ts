// Определение интерфейса Product
interface Product {
  id: number;
  название: string;
  цена: number;
}

// Пример использования
const exampleProduct: Product = {
  id: 1,
  название: "Пример товара",
  цена: 99.99
};

console.log(exampleProduct);