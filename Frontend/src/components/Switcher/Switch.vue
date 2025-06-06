<template>
  <v-switch
    v-model="switcher"
    color="primary"
    :false-value=false
    :true-value=true
    hide-details
    @update:model-value="updateSwitcher"
    class="small-switch"
  ></v-switch>
</template>

<script setup lang="ts">
  import { ref } from 'vue'

  const model = ref('no')

    const props = defineProps({
        switch: {
        type: Boolean,
        default: false
        }
    })
    const emit = defineEmits(['update:switcher'])
    const switcher = ref(props.switch)

    const updateSwitcher = (value: boolean | null) => {
        switcher.value = value ?? false
        emit('update:switcher', value ?? false)
    }
</script>

<style scoped>
.small-switch {
  transform: scale(0.75);
  transform-origin: left center;
}
</style>