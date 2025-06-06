<template>
    <v-app>
      <HeaderComponent />
      <div class="relative mt-12 h-full">
        <SidePanel @toggle-view-size="adjustViewSize" @drawer-open="drawerOpen" />
        <DefaultLayout :view-size="viewSize" class="" />
      </div>
      <FooterComponent />
    </v-app>
  </template>
  
  <script setup lang="ts">
  import { ref, watch, onMounted } from 'vue'
  import HeaderComponent from '../layout/components/Header.vue'
  import SidePanel from '../layout/components/SidePanel.vue'
  import FooterComponent from '../layout/components/Footer.vue'
  import DefaultLayout from '../layout/DefaultLayout.vue'
  
  const viewSize = ref<'open' | 'close'>('open')
  
  const adjustViewSize = () => {
    viewSize.value = viewSize.value === 'open' ? 'close' : 'open'
  }
  
  const drawerOpen = () => {
    viewSize.value = 'open'
  }
  
  watch(() => viewSize.value, (newValue) => {
    console.log('viewSize changed to:', newValue)
  })
  
  onMounted(() => {
    console.log('Initial viewSize:', viewSize.value)
  })
  </script>
  