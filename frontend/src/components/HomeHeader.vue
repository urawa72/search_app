 <template>
  <header class="header">
    <h1>Full Text Search for Oreilly</h1>
  </header>
</template>

<script>
</script>

<style lang="scss" scoped>
.header {
  width: 100%;
  position: fixed;
  top: 0;
  left: 0;
  z-index: 100;
  background: #fff;
  box-shadow: 0 0 4px rgba(0,0,0,.15);
}
/* レスポンシブ */
.mobile-nav {
  @include mq-up(md) {
    display: none;
  }
}
.desktop-nav {
  @include mq-down(md) {
    display: none;
  }
}
</style>
