<template>
  <div class="search-result-data">
    <template v-for="result in results">
      <div class="search-result-data__row">
        <div class="search-result-data__detail">
          <div class="search-result-data__title">
            <a :href="result.source.url" class="search-result-data__title--link" target="_blank">
              <div v-html="getTitle(result)"></div>
            </a>
          </div>
          <div class="search-result-data__price">￥{{ result.source.price }}</div>
          <div class="search-result-data__date">{{ result.source.published_at }}</div>
        </div>
        <div class="search-result-data__thumb">
          <img :src="getThumbUrl(result.source.isbn_10)" alt="No Image">
        </div>
        <div class="search-result-data__results">
          <template  v-for="content in result.highlight.content">
            <div class="search-result-data__content" v-html="getContent(content)"></div>
          </template>
        </div>
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
      return content.replace(/\r\n/g, '<br>').replace(/<select>/g, "&lt;select&gt;")
    },
    getTitle(result) {
      if (result.highlight.title) {
        return result.highlight.title
      } else {
        return result.source.title
      }
    },
    getContent(content) {
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
.search-result-data {
  &__row {
    display: flex;
    align-items: flex-start;
    padding: 10px;
    border-top: 1px solid gray;
    text-align: left;
  }
  &__detail {
    display: flex;
    flex-direction: column;
    width: 20%;
  }
  &__title {
    &--link {
      text-decoration: none;
      font-size: 16px;
    }
  }
  &__price,&__date {
    padding-top: 5px;
  }
  &__thumb {
    display: flex;
    justify-content: center;
    width: 20%;
    padding: 0 10px;
  }
  &__results {
    display: flex;
    flex-direction: column;
    width: 60%;
  }
  &__content {
    padding: 5px 0;
    &:not(:last-child) {
      border-bottom: 1px solid gray;
    }
  }
  div {
    &/deep/ highlight {
      background-color: yellow;
      font-weight: bold;
    }
  }
}
</style>
