<template>
  <div class="search-result">
    <div class="search-result__result-count" v-show="results.length > 0">
      検索結果： {{ results.length }} 件
    </div>
    <search-result-data v-if="results.length > 0" :results="results" />
  </div>
</template>

<script>
import SearchResultData from './SearchResultData'

export default {
  name: 'SearchResult',
  props: {
    results: Array
  },
  methods: {
    convert(content) {
      return content.replace(/\r\n/g, '<br>')
    }
  },
  components: {
    SearchResultData
  }
}
</script>

<style lang="scss" scoped>
.search-result {
  display: flex;
  flex-direction: column;
  width: 70vw;
  margin: 0 auto;
  &__result-count {
    padding: 10px 0;
    font-size: 16px;
  }
}
</style>
