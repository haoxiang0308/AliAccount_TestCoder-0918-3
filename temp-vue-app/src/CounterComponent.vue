<template>
  <div>
    <h1>Click Counter</h1>
    <p>Count: {{ count }}</p>
    <button @click="increment">Click Me!</button>
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
div {
  text-align: center;
  margin-top: 50px;
}

button {
  padding: 10px 20px;
  font-size: 16px;
}
</style>