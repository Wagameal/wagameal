<template>
  <main :class="['transition-on duration-300 core', viewSize]">
    <v-container>
      <RouterView />
    </v-container>
    
  </main>
</template>

<script setup lang="ts">
import { RouterView } from 'vue-router'
import { watch, onMounted, computed,  } from 'vue'


const props = defineProps<{
  'view-size': 'open' | 'close'
}>();

const viewSize = computed(() => props['view-size'])


watch(viewSize, (newVal) => {
  console.log('👀 viewSize changed ------to:', newVal)
})

</script>



<style>
.core {
  padding: 0px 0px 0px 260px;
}

.open {
  padding: 0px 0px 0px 255px;
}

.open {
  padding: 0px 0px 0px 55px;
}

</style>