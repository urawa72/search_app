<template>
  <div class="search-form">
    <h3>Let's Search!</h3>
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
  margin: 20px 0;
}
</style>
