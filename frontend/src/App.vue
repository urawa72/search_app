<template>
  <div class="container">
    <router-view />
  </div>
</template>

<script>
export default {
  name: 'App',
}
</script>

<style scoped>
.container {
  font-family: 'Avenir', Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  margin: 50px 0;
  font-size: 12px;
  color: #2c3e50;
}
</style>
