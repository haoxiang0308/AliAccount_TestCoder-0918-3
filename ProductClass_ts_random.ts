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

export { Product };