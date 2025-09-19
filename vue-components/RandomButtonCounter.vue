<template>
  <div class="button-counter">
    <h3>Simple Button Counter</h3>
    <div class="counter-display">{{ counter }}</div>
    <div class="buttons">
      <button @click="increase">Increase</button>
      <button @click="decrease">Decrease</button>
      <button @click="resetCounter">Reset</button>
    </div>
  </div>
</template>

<script>
export default {
  name: 'ButtonCounter',
  data() {
    return {
      counter: 0
    }
  },
  methods: {
    increase() {
      this.counter++
    },
    decrease() {
      this.counter--
    },
    resetCounter() {
      this.counter = 0
    }
  }
}
</script>

<style scoped>
.button-counter {
  max-width: 300px;
  margin: 20px auto;
  padding: 20px;
  border: 1px solid #ccc;
  border-radius: 8px;
  font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
}

.counter-display {
  font-size: 48px;
  text-align: center;
  margin: 20px 0;
  color: #2c3e50;
}

.buttons {
  display: flex;
  justify-content: space-around;
}

button {
  padding: 10px 15px;
  border: none;
  border-radius: 4px;
  background-color: #42b983;
  color: white;
  font-size: 16px;
  cursor: pointer;
  transition: background-color 0.3s;
}

button:hover {
  background-color: #359c6d;
}
</style>