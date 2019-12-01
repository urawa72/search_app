 <template>
  <header class="header">
    <NavMobile />
    <h1 class="header__title">Full Text Search for Oreilly</h1>
  </header>
</template>

<script>
import NavMobile from './NavMobile'

export default {
  name: 'GlobalHeader',
  components: {
    NavMobile
  }
}
</script>

<style lang="scss" scoped>
.header {
  display: flex;
  flex-direction: row;
  width: 100%;
  position: fixed;
  top: 0;
  left: 0;
  z-index: 100;
  background: #fff;
  box-shadow: 0 0 4px rgba(0,0,0,.15);
  &__title {
    margin: 0 auto;
    padding: 10px 0;
  }
}
</style>
