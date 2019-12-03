<template>
  <div class="nav-mobile">
    <div class="nav-mobile__inner">
      <div class="nav-mobile__burger" @click="toggleSidebar">
        <span class="nav-mobile__burger-line"></span>
        <span class="nav-mobile__burger-line"></span>
        <span class="nav-mobile__burger-line"></span>
      </div>
    </div>
    <NavSidebar :isOpen="isOpen" @close="toggleSidebar()" />
    <div v-if="isOpen" class="nav-mobile__bg" @click="closeSidebar"></div>
  </div>
</template>

<script>
import NavSidebar from './NavSidebar.vue'

export default {
  name: "NavMobile",
  components: {
    NavSidebar
  },
  data() {
    return {
      isOpen: false
    }
  },
  methods: {
    toggleSidebar() {
      this.isOpen = !this.isOpen
    },
    closeSidebar() {
      if (this.isOpen) { this.isOpen = false }
    }
  }
}
</script>

<style lang="scss" scoped>
.nav-mobile {
  &__inner {
    z-index: 1;
  }
  &__burger {
    position: absolute;
    height: 20px;
    width: 50px;
    top: 18px;
    z-index: 2;
    cursor: pointer;
  }
  &__burger-line {
    position: absolute;
    width: 25px;
    height: 2px;
    z-index: 1;
    border-radius: 2px;
    opacity: .5;
    background-color: #000;
    &:first-child {
      top: 0;
    }
    &:nth-child(2) {
      top: 8px;
    }
    &:last-child {
      top: 16px;
    }
  }
  &__bg {
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    z-index: 3;
    background-color: #000;
    opacity: .7;
  }
}
</style>
