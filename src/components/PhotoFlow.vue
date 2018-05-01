<template>
  <div id="container" v-viewer="{movable: false}">
    <div v-for="p in this.images" :key="p.data.storename" class="one">
        <img :src="p.data.url" class="item"/>
    </div>
  </div>
</template>

<script>
import images from "../assets/uploaded.json"
import 'viewerjs/dist/viewer.css'
import Viewer from 'v-viewer'
import Vue from 'vue'

Vue.use(Viewer)
Viewer.setDefaults({
  title: false
})

export default {
  name: 'PhotoFlow',
  props: {
  },
  data() {
    return {
      images: images,
      url: 'https://gist.githubusercontent.com/weaming/f15ac6ee19c2a359f910a37f02677014/raw/uploaded.json',
    }
  },
  beforeMount: function() {
    const self = this
    fetch(this.url).
      then(function(res) {
        return res.json()
      }).
      then(function(res) {
        self.images = res
        return self.images
      }).
      then(function(res) {
        console.log(res)
        return res
      }).
      catch(function(e) {
        console.log(e)
      })
  },
  methods: {
  }
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
h3 {
  margin: 40px 0 0;
}

a {
  color: #42b983;
}

img.item, .one{
  margin: 0;
  padding: 0;
  display: inline-block;
}

/* image box */
.one {
    display:inline-block;
    width: 10vw;
    height: 10vw;
    overflow: hidden;
}

img.item {
  min-width: 10vw;
  min-height: 10vw;
  max-width: 15vw;
  max-height: 15vw;
  position: relative;
  left: -20%;
}
</style>
