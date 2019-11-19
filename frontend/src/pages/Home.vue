<template>
  <div>
    <h2>Full Text Search for Oreilly</h2>
    <div v-for="result in results">
      <div v-html="result.highlight.title[0]"></div>
      <template v-for="c in result.highlight.content">
        <div v-html="convert(c)"></div>
      </template>
    </div>
  </div>
</template>

<script>
import { mapState, mapActions } from 'vuex'

export default {
  name: 'Home',
  data () {
    return {
    }
  },
  computed: {
    ...mapState('search', ['results'])
  },
  methods: {
    ...mapActions('search', ['searchBooks']),
    convert(content) {
      return content.replace(/\r\n/g, '<br>')
    }
  },
  mounted() {
    this.searchBooks()
    console.log(results[0])
  }
}
</script>

<style lang="scss" scoped>
div {
  padding: 10px 0;
  &/deep/ highlight {
    background-color: yellow;
    font-weight: bold;
  }
}
</style>
