<template>
  <div class="search-result">
    <search-result-header />
    <search-result-data v-if="results.length > 0" :results="results" />
  </div>
</template>

<script>
import SearchResultHeader from './SearchResultHeader'
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
    SearchResultHeader,
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
}
</style>
