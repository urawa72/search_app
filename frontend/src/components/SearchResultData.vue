<template>
  <div class="search-result__data">
    <template v-for="result in results">
      <div class="search-result__data-row">
        <div class="search-result__data-title">
          <a :href="result.source.url" class="search-result__data-title--link" target="_blank">
            <div v-html="getTitle(result)"></div>
          </a>
        </div>
        <div class="search-result__data-thumb">
          <img :src="getThumbUrl(result.source.isbn_10)"></img>
        </div>
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
    },
    getThumbUrl(url) {
      return 'http://images-jp.amazon.com/images/P/' + url + '.09.MZZZZZZZ'
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
    width: 20%;
    &--link {
      text-decoration: none;
    }
  }
  &__data-thumb {
    width: 20%;
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
