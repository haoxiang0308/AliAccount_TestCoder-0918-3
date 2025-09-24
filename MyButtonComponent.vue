<template>
  <div>
    <button @click="increment">Click me! Count: {{ count }}</button>
  </div>
</template>

<script>
export default {
  name: 'MyButtonComponent',
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
button {
  padding: 10px 20px;
  font-size: 16px;
}
</style>