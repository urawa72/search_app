<template>
  <div class="search-result__header">
    <div class="search-result__header-title">
      タイトル
    </div>
    <div class="search-result__header-content">
      検索結果
    </div>
  </div>
</template>

<script>
export default {
  name: 'SearchResultHeader'
}
</script>

<style lang="scss" scoped>
.search-result {
  &__header {
    display: flex;
    padding: 5px 10px;
    background-color: #333333;
    text-align: left;
    color: white;
  }
  &__header-title {
    width: 40%;
  }
  &__header-content {
    width: 60%;
  }
}
</style>
