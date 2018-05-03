<template>
  <div id="app">
    <Slideout menu="#menu" panel="#panel" :toggleSelectors="['.toggle-button']" @on-open="open" duration="200">
      <nav id="menu">
        <SlideMenu/>
      </nav>
      <main id="panel">
        <header>
          <div>
            <button class="toggle-button">☰</button>
          </div>
        </header>
            <div>
              <PhotoFlow/>
            </div>
      </main>
    </Slideout>
  </div>
</template>

<script>
import PhotoFlow from './components/PhotoFlow.vue'
import SlideMenu from './components/SlideMenu.vue'
import Slideout from 'vue-slideout'
import Vue from 'vue'
import VueHead from 'vue-head'
import icon from './assets/logo.png'

Vue.use(VueHead)

const title = 'Photography works of weaming'

export default {
  name: 'app',
  components: {
    PhotoFlow,
    Slideout,
    SlideMenu,
  },
  data: function() {
    return {
      title: title
    }
  },
  methods: {
    open() {
      console.log('opened')
    }
  },
  head: {
    title: function () {
      return {
        inner: this.title
      }
    },
    // Meta tags
    meta: [
      { itemprop: 'name', content: title },
      { itemprop: 'description', content: 'This is photogoraphy wokrs made by weaming' },
    ],
    // link tags
    link: [
      { rel: 'icon', href: icon, sizes: '16x16', type: 'image/png' },
    ],
    script: [
    ],
    style: [
    ]
  }
}
</script>

<style>
#app {
  font-family: 'Avenir', Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  color: #2c3e50;
  margin: 0;
}

body {
  background-color: black;
  background: url(./assets/body-bg.png);
  margin: 0;
  padding: 0;
}
</style>

/* Slideout */
<style>
body {
  width: 100%;
  height: 100%;
  margin: 0;
}

.slideout-menu {
  position: fixed;
  top: 0;
  bottom: 0;
  width: 256px;
  height: 100vh;
  overflow-y: scroll;
  -webkit-overflow-scrolling: touch;
  z-index: 0;
  display: none;
  background-color: #1d1f20;
  color: white;
}

.slideout-menu-left {
  left: 0;
}

.slideout-menu-right {
  right: 0;
}

.toggle-button {
  margin: 0px 0;
  z-index: 99;
}

.slideout-panel {
  background-color: transparent;
  color: white;
  position: relative;
  z-index: 1;
  will-change: transform;
  min-height: 100vh;
}

.slideout-open,
.slideout-open body,
.slideout-open .slideout-panel {
  overflow: hidden;
}

.slideout-open .slideout-menu {
  display: block;
}
</style>
