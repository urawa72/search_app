<template>
  <div class="search-result__data">
    <template v-for="result in results">
      <div class="search-result__data-row">
        <div class="search-result__data-title" v-html="getTitle(result)"></div>
        <div class="search-result__data-content" v-html="getContent(result)"></div>
      </div>
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
    },
    getTitle(result) {
      if (result.highlight.title) {
        return result.highlight.title
      } else {
        return result.source.title
      }
    },
    getContent(result) {
      let content = result.highlight.content
      if (content !== null) {
        return this.convert(content)
      }
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
