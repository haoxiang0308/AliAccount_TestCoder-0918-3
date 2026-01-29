<template>
  <div>
    <h1>Filtrar Lista de Produtos</h1>
    
    <input 
      v-model="termoBusca" 
      type="text" 
      placeholder="Buscar por nome..."
    />
    
    <select v-model="categoriaFiltro">
      <option value="">Todas as categorias</option>
      <option value="eletronicos">Eletrônicos</option>
      <option value="roupas">Roupas</option>
      <option value="alimentos">Alimentos</option>
    </select>
    
    <ul>
      <li v-for="produto in produtosFiltrados" :key="produto.id">
        <strong>{{ produto.nome }}</strong> - 
        {{ produto.categoria }} - 
        R$ {{ produto.preco.toFixed(2) }}
      </li>
    </ul>
    
    <p>Total de itens: {{ produtosFiltrados.length }}</p>
  </div>
</template>

<script>
export default {
  name: 'FiltrarProdutos',
  data() {
    return {
      termoBusca: '',
      categoriaFiltro: '',
      produtos: [
        { id: 1, nome: 'Notebook', categoria: 'eletronicos', preco: 2500.00 },
        { id: 2, nome: 'Smartphone', categoria: 'eletronicos', preco: 1500.00 },
        { id: 3, nome: 'Camiseta', categoria: 'roupas', preco: 50.00 },
        { id: 4, nome: 'Calça Jeans', categoria: 'roupas', preco: 120.00 },
        { id: 5, nome: 'Maçã', categoria: 'alimentos', preco: 3.50 },
        { id: 6, nome: 'Banana', categoria: 'alimentos', preco: 2.00 },
        { id: 7, nome: 'Headset', categoria: 'eletronicos', preco: 150.00 },
        { id: 8, nome: 'Jaqueta', categoria: 'roupas', preco: 200.00 }
      ]
    }
  },
  computed: {
    produtosFiltrados() {
      return this.produtos.filter(produto => {
        const matchesBusca = produto.nome
          .toLowerCase()
          .includes(this.termoBusca.toLowerCase());
        
        const matchesCategoria = !this.categoriaFiltro || 
          produto.categoria === this.categoriaFiltro;
        
        return matchesBusca && matchesCategoria;
      });
    }
  }
}
</script>

<style scoped>
div {
  max-width: 600px;
  margin: 20px auto;
  padding: 20px;
}

input, select {
  margin: 10px 0;
  padding: 8px;
  width: 100%;
  box-sizing: border-box;
}

ul {
  list-style: none;
  padding: 0;
}

li {
  background: #f5f5f5;
  margin: 5px 0;
  padding: 10px;
  border-radius: 4px;
}
</style>
