<template>
  <div class="message">
    <h2>{{ subTitle }}</h2>
    <div v-for="m in msg" class="message__sub-message">
      {{ m }}
    </div>
  </div>
</template>

<script>
import { mapState, mapActions } from 'vuex'

export default {
  name: 'Message',
  data () {
    return {
      subTitle: 'made by Vue.js, VueRouter, Vuex'
    }
  },
  computed: {
    ...mapState('search', ['msg'])
  },
  methods: {
    ...mapActions('search', ['searchArticles'])
  },
  mounted() {
    this.searchArticles()
  }
}
</script>

<style lang="scss" scoped>
.message {
  margin-top: 60px;

  &__sub-message {
    font-size: 20px;
  }
}
</style>
