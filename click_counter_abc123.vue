<template>
  <div class="counter-container">
    <h2>Click Counter</h2>
    <p>Button has been clicked: {{ count }} times</p>
    <button @click="increment">Click Me!</button>
  </div>
</template>

<script>
export default {
  name: 'ClickCounter',
  data() {
    return {
      count: 0
    }
  },
  methods: {
    increment() {
      this.count++
    }
  }
}
</script>

<style scoped>
.counter-container {
  padding: 20px;
  text-align: center;
  border: 1px solid #ccc;
  border-radius: 5px;
  margin: 20px;
}

button {
  padding: 10px 20px;
  font-size: 16px;
  background-color: #42b983;
  color: white;
  border: none;
  border-radius: 4px;
  cursor: pointer;
}

button:hover {
  background-color: #359c6d;
}
</style>