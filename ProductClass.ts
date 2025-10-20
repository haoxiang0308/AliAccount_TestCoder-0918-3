class Product {
    id: number;
    название: string;
    цена: number;

    constructor(id: number, название: string, цена: number) {
        this.id = id;
        this.название = название;
        this.цена = цена;
    }
}

// Пример использования
const exampleProduct = new Product(1, "Пример товара", 99.99);
console.log(exampleProduct);