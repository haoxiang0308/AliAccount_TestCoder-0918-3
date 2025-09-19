<template>
  <div class="counter-component">
    <h2>Vue.js Click Counter</h2>
    <p>Button clicked: {{ count }} times</p>
    <button @click="incrementCounter">Click me!</button>
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
    incrementCounter() {
      this.count++;
    }
  }
}
</script>

<style scoped>
.counter-component {
  text-align: center;
  padding: 20px;
  font-family: Arial, sans-serif;
}

button {
  background-color: #42b983;
  color: white;
  border: none;
  padding: 10px 20px;
  font-size: 16px;
  border-radius: 4px;
  cursor: pointer;
}

button:hover {
  background-color: #359c6d;
}
</style>