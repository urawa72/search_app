<template>
  <div class="search-form">
    <h2>Let's Search!</h2>
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
  margin-top: 80px;
  margin-bottom: 20px;
}
</style>
