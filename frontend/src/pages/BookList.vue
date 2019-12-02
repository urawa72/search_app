<template>
  <div class="book-list">
    <h2>Book List</h2>
    <div v-for="result in results">
      {{ result.title }}
    </div>
  </div>
</template>

<script>
import { debounce } from 'lodash'
import { mapState, mapActions } from 'vuex'

export default {
  name: 'BookList',
  components: {
  },
  data () {
    return {
    }
  },
  computed: {
    ...mapState('books', ['results'])
  },
  methods: {
    ...mapActions('books', ['getList']),
    getBookList() {
      this.getList()
    }
  },
  mounted() {
    this.getBookList()
  }
}
</script>

<style lang="scss" scoped>
.book-list {
  margin-top: 80px;
}
</style>
