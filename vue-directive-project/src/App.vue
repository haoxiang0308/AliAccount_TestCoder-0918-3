<template>
  <div id="app">
    <h1>Vue Custom Directive Example</h1>
    <input v-focus placeholder="This input is focused on mount" />
    <input placeholder="This input is not focused" />
  </div>
</template>

<script>
export default {
  name: 'App'
}
</script>

<style>
#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
  margin-top: 60px;
}
input {
  display: block;
  margin: 10px auto;
  padding: 10px;
  font-size: 16px;
}
</style>