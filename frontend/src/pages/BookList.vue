<template>
  <div class="book-list">
    <h2>Book List</h2>
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
    ...mapState('search', ['results'])
  },
  methods: {
    ...mapActions('search', ['searchBooks']),
    getBookList() {

    }
  }
}
</script>

<style lang="scss" scoped>
.book-list {
  margin-top: 80px;
}
</style>
