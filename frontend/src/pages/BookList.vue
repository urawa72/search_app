<template>
  <div class="book-list">
    <h2>Book List</h2>
    <template v-if="results.length > 0">
      <div class="book-list__total-num">
        合計：{{ results.length }} 冊
      </div>
      <div class="book-list__header">
        <div class="book-list__header-title">タイトル</div>
        <div class="book-list__header-price">価格</div>
        <div class="book-list__header-published-at">発売年月日</div>
      </div>
      <div class="book-list__row" v-for="result in results">
        <div class="book-list__title">{{ result.title }}</div>
        <div class="book-list__price">￥{{ result.price }}</div>
        <div class="book-list__published-at">{{ result.published_at }}</div>
      </div>
    </template>
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
  &__total-num {
    padding: 10px 0;
    font-size: 16px;
  }
  &__header {
    display: flex;
    width: 600px;
    margin: 0 auto;
    padding: 5px 10px;
    background-color: #333333;
    text-align: left;
    color: white;
  }
  &__row {
    display: flex;
    width: 600px;
    margin: 0 auto;
    padding: 5px 0;
    border-bottom: 1px solid gray;
  }
  &__header-title, &__title {
    width: 60%;
    text-align: left;
  }
  &__header-price, &__price {
    width: 20%;
    text-align: left;
  }
  &__header-published-at, &__published-at {
    width: 20%;
    text-align: left;
  }
}
</style>
</style>
