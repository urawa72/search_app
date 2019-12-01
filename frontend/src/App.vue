<template>
  <div class="container">
    <global-header />
    <router-view />
  </div>
</template>

<script>
import GlobalHeader from 'components/GlobalHeader'

export default {
  name: 'App',
  components: {
    GlobalHeader
  }
}
</script>

<style scoped>
.container {
  font-family: 'Avenir', Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  margin: 50px 0;
  font-size: 12px;
  text-align: center;
  color: #2c3e50;
}
</style>
