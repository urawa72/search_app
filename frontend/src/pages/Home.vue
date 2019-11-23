<template>
  <div class="home">
    <h2>Full Text Search for Oreilly</h2>
    <search-result :results="results" />
  </div>
</template>

<script>
import { mapState, mapActions } from 'vuex'
import SearchResult from '../components/SearchResult'

export default {
  name: 'Home',
  data () {
    return {
    }
  },
  computed: {
    ...mapState('search', ['results'])
  },
  methods: {
    ...mapActions('search', ['searchBooks']),
    convert(content) {
      return content.replace(/\r\n/g, '<br>')
    }
  },
  mounted() {
    this.searchBooks()
  },
  components: {
    SearchResult
  }
}
</script>

<style lang="scss" scoped>
.home {
  text-align: center;
}
</style>
