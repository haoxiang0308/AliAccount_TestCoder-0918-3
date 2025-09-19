<template>
  <div class="click-counter">
    <h2>Vue Click Counter</h2>
    <p>Count: {{ count }}</p>
    <button @click="increment">Click me!</button>
    <button @click="reset">Reset</button>
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
    },
    reset() {
      this.count = 0
    }
  }
}
</script>

<style scoped>
.click-counter {
  text-align: center;
  padding: 20px;
  font-family: Arial, sans-serif;
}

button {
  margin: 5px;
  padding: 10px 15px;
  font-size: 16px;
  cursor: pointer;
}
</style>