<template>
  <div class="nav-sidebar" :class="{ 'open' : isOpen }">
    <NavLinks @close="closeSidebar()" />
  </div>
</template>

<script>
import NavLinks from './NavLinks'

export default {
  name: "NavSidebar",
  components: {
    NavLinks
  },
  props: {
    isOpen: Boolean
  },
  methods: {
    closeSidebar() {
      this.$emit('close')
    }
  }
}
</script>

<style lang="scss" scoped>
.nav-sidebar {
  position: fixed;
  top: 0;
  left: 0;
  z-index: 10;
  width: 70%;
  max-width: 300px;
  height: 100%;
  background: #f8f8f8;
  transition: .3s ease-in-out;
  transform: translate(-105%);
  &.open {
    transform: translate(0%);
    box-shadow: 6px 0 25px rgba(0,0,0,.15);
  }
}
</style>
