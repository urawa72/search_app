<template>
  <div class="search-form">
    <div>Search</div>
    <input type="text" v-model="keyword" />
  </div>
</template>

<script>
export default {
  name: 'SearchForm',
  components: {
  },
  data() {
    return {
      keyword: ''
    }
  },
  methods: {
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
  margin: 10px 0;
}
</style>
