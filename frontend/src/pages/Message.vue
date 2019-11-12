<template>
  <div>
    <h2>This is front application made by vue!</h2>
    <h3>{{ subMsg }}</h3>
    {{ msg }}
  </div>
</template>

<script>
import { mapState, mapActions } from 'vuex'

export default {
  name: 'Message',
  data () {
    return {
      subMsg: 'use Vue, VueRouter, Vuex'
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

<style scoped>
</style>
