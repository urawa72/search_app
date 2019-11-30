<template>
  <div class="home">
    <home-header />
    <search-form @search="search" />
    <search-result v-if="!!results" :results="results" />
  </div>
</template>

<script>
import { debounce } from 'lodash'
import { mapState, mapActions } from 'vuex'
import HomeHeader from 'components/HomeHeader'
import SearchResult from 'components/SearchResult'
import SearchForm from 'components/SearchForm'

export default {
  name: 'Home',
  components: {
    HomeHeader,
    SearchResult,
    SearchForm
  },
  data () {
    return {
    }
  },
  computed: {
    ...mapState('search', ['results'])
  },
  methods: {
    ...mapActions('search', ['searchBooks']),
    search: debounce(function(keyword) {
      this.searchBooks(keyword)
    }, 500)
  }
}
</script>

<style lang="scss" scoped>
.home {
  text-align: center;
}
</style>
