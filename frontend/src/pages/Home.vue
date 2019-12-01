<template>
  <div class="home">
    <h2>Let's Search!</h2>
    <search-form @search="search" />
    <search-result v-if="!!results" :results="results" />
  </div>
</template>

<script>
import { debounce } from 'lodash'
import { mapState, mapActions } from 'vuex'
import SearchResult from 'components/SearchResult'
import SearchForm from 'components/SearchForm'

export default {
  name: 'Home',
  components: {
    SearchResult,
    SearchForm
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
  margin-top: 80px;
}
</style>
