<template>
  <div class="search-result-header">
    <div class="search-result-header__title">
      タイトル
    </div>
    <div class="search-result-header__content">
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
.search-result-header {
  display: flex;
  padding: 5px 10px;
  background-color: #333333;
  text-align: left;
  color: white;
  &__title {
    width: 40%;
  }
  &__content {
    width: 60%;
  }
}
</style>
