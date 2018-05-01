<template>
  <ul>
    <li>
      <h2>我的摄影集</h2>
    </li>
    <li>
      <img src="../assets/logo.png" id="logo">
    </li>
    <li>
      <a href="https://twitter.com/iweaming" target="_blank">Twitter</a>
    </li>
    <li>
      <a href="https://github.com/weaming/photoflow" target="_blank">Github</a>
    </li>
    <li>
      <a href="#">About</a>
    </li>
  </ul>
</template>

<script>
export default {
  name: 'iMenu',
  props: {
  },
  data() {
    return {
    }
  },
  mounted: function() {
  },
  methods: {
  }
}
</script>

<style scoped>
h2 {
}
#logo {
  display: block;
  max-width: 61%;
  text-align: center;
  margin: 0 auto;
}

a {
  text-decoration: none;
  color: white;
  display: block;
  padding: 10px 25%;
  margin: 0 auto;
  font-size: 20px;
}

ul, li {
  text-align: center;
  display: inline-block;
  box-sizing: content-box;
  padding: 0;
  list-style-type: none;
  color: white;
  width: 100%;
}

li > a:hover {
  background: white;
  color: black;
}
</style>
