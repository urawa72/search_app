<template>
  <div class="nav-links">
    <div class="nav-links__inner" @click="closeSidebar()">
      <router-link to="/" class="nav-links__link">Home</router-link>
      <router-link to="/list" class="nav-links__link">List</router-link>
    </div>
  </div>
</template>

<script>
export default {
  name: "NavLinks",
  methods: {
    closeSidebar() {
      this.$emit('close')
    }
  }
}
</script>

<style lang="scss" scoped>
.nav-links {
  &__inner {
    display: flex;
    flex-direction: column;
    position: absolute;
    overflow: auto;
    padding: 30px;
    text-align: left;
  }
  &__link {
    padding: 10px 0;
    text-decoration: none;
    font-size: 1rem;
    color: #000;
    &:hover {
      opacity: .6;
      transition: .2s;
    }
  }
}
</style>
