<template>
  <div>
    <button @click="increment">{{ buttonText }}</button>
    <p>Count: {{ count }}</p>
  </div>
</template>

<script>
export default {
  name: 'MyButtonComponent',
  data() {
    return {
      count: 0,
      buttonText: 'Click me!'
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
button {
  padding: 10px 20px;
  font-size: 16px;
}
p {
  margin-top: 10px;
}
</style>