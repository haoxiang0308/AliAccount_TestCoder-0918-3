<template>
  <div>
    <h1>Click Counter</h1>
    <p>Count: {{ count }}</p>
    <button @click="increment">Click me!</button>
  </div>
</template>

<script>
export default {
  name: 'CounterComponent',
  data() {
    return {
      count: 0
    }
  },
  methods: {
    increment() {
      this.count++;
    }
  }
}
</script>

<style scoped>
h1 {
  color: #42b883;
}
button {
  background-color: #42b883;
  color: white;
  border: none;
  padding: 10px 20px;
  font-size: 16px;
  cursor: pointer;
}
button:hover {
  background-color: #369870;
}
</style>