<template>
  <div class="search-result__data">
    <template v-for="result in results">
      <template v-for="c in result.highlight.content">
        <div class="search-result__data-row">
          <div class="search-result__data-title" v-html="result.highlight.title[0]"></div>
          <div class="search-result__data-content" v-html="convert(c)"></div>
        </div>
      </template>
    </template>
  </div>
</template>

<script>
export default {
  name: 'SearchResultData',
  props: {
    results: Array
  },
  methods: {
    convert(content) {
      return content.replace(/\r\n/g, '<br>')
    }
  }
}
</script>

<style lang="scss" scoped>
.search-result {
  &__data-row {
    display: flex;
    padding: 5px;
    border-top: 1px solid gray;
    text-align: left;
  }
  &__data-title {
    width: 40%;
  }
  &__data-content {
    width: 60%;
  }
  div {
    &/deep/ highlight {
      background-color: yellow;
      font-weight: bold;
    }
  }
}
</style>
