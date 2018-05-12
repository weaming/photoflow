<template>
  <div id="container" v-viewer="{movable: false}">
    <div :line-gap="200" :watch="images" class="waterfall">
      <div
        v-for="(item, index) in images"
        :width="calcWidth(item)" :height="calcHeight(item)"
        :order="index" :key="item.data.hash" class="slot">

        <img class="item" :src="item.data.url" :origin-src="item.data.url"/>

      </div>
    </div>
  </div>
</template>

<script>
//import Waterfall from 'vue-waterfall/lib/waterfall'
//import WaterfallSlot from 'vue-waterfall/lib/waterfall-slot'

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
    //Waterfall,
    //WaterfallSlot
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
    },
    calcWidth(item) {
      /* 1440 2560 公约数 160 */
      return screen.width / 10
      //return 80
      //return item.image.width / 10
    },
    calcHeight(item) {
      /* 1440 2560 公约数 160 */
      return screen.width / 10
      //return 80
      //return item.image.height / 10
    },
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

#container{
  width: 100vw;
  z-index: 1;
}

.waterfall {
  box-sizing: border-box;
  padding: 0px;
  display:flex;
  flex-direction: row;
  flex-wrap: wrap;
}
.slot {
  background-color:#cfc;
  margin: 0px;
  width: 20vw;
  height: 20vw;
  transition:flex-basis 200ms ease;
  overflow: hidden;
}

img.item {
  min-width: 100%;
  min-height: 100%;
  zoom: 0.01;
}
</style>
