<template>
  <v-btn :icon="icon" :color="color" :size="size" :title="title" ></v-btn>
</template>

<script setup lang="ts">
import { defineProps } from 'vue';      

const props = defineProps<{
  icon: string;
  color?: string;
  size?: string;
  title?: string;
}>();


</script>