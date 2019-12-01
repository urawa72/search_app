<template>
  <div class="nav-links-wrap">
    <div class="nav-links-inner" @click="closeSidebar()">
      <router-link to="/" class="nav-links">Home</router-link>
      <router-link to="/list" class="nav-links">List</router-link>
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
.nav-links-wrap {
  display: flex;
  top: 0;
  bottom: 40px;
  left: 0;
  right: 0;
  overflow-y: auto;
  padding: 30px;
  position: absolute;
  flex-direction: column;
}
.nav-links-inner {
  /* desktop */
  @include mq-up(md) {
    padding: 0 30px;
    flex: 2;
  }
}
.nav-links {
  text-decoration: none;
  font-size: 1rem;
  color: #000;
  padding: 0 10px;
  &:hover {
    opacity: .6;
    transition: .2s;
  }
  /* mobile */
  @include mq-down(md) {
    display: block;
    padding: 5px 0;
  }
}
</style>
