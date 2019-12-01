<template>
  <div class="search-form">
    <input type="text" v-model="keyword" />
  </div>
</template>

<script>
export default {
  name: 'SearchForm',
  data() {
    return {
      keyword: ''
    }
  },
  watch: {
    keyword: function() {
      this.$emit('search', this.keyword)
    }
  }
}
</script>

<style lang="scss" scoped>
.search-form {
  margin-bottom: 20px;
}
</style>
