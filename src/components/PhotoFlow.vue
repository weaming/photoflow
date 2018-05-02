<template>
  <div id="container" v-viewer="{movable: false}">
    <waterfall :line-gap="200" :watch="images">
      <waterfall-slot v-for="(item, index) in images"
                      :width="item.image.width / 10" :height="item.image.height / 10"
                      :order="index" :key="item.data.path">
        <img :src="item.data.thumb_url" :origin-src="item.data.url" :style="getImgStyle(item)"/>
      </waterfall-slot>
    </waterfall>
  </div>
</template>

<script>
import Waterfall from 'vue-waterfall/lib/waterfall'
import WaterfallSlot from 'vue-waterfall/lib/waterfall-slot'

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
  components: {
    Waterfall,
    WaterfallSlot
  },
  data() {
    return {
      images: images,
      url: 'http://jredison.bitsflow.org/json/photography',
    }
  },
  created: function() {
    const self = this
    fetch(this.url).
      then(function(res) {
        return res.json()
      }).
      then(function(res) {
        self.images = res
        return self.images
      }).
      catch(function(e) {
        console.log(e)
      })
  },
  methods: {
    getImgStyle(item) {
      var rv = `width: ${item.image.width / 8}px;`
      console.log(rv)
      return rv
    }
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

</style>
