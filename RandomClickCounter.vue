<template>
  <div class="counter-container">
    <button @click="incrementCounter" class="counter-button">
      Click me!
    </button>
    <p class="counter-display">You clicked {{ count }} times</p>
  </div>
</template>

<script>
export default {
  name: 'CounterButton',
  data() {
    return {
      count: 0
    }
  },
  methods: {
    incrementCounter() {
      this.count++
    }
  }
}
</script>

<style scoped>
.counter-container {
  text-align: center;
  padding: 20px;
  font-family: Arial, sans-serif;
}

.counter-button {
  background-color: #42b983;
  border: none;
  color: white;
  padding: 10px 20px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 16px;
  margin: 4px 2px;
  cursor: pointer;
  border-radius: 4px;
}

.counter-button:hover {
  background-color: #359c6d;
}

.counter-display {
  margin-top: 10px;
  font-size: 18px;
  color: #333;
}
</style>