<template>
    <div>
      <v-text-field
        v-model="inputValue"
        :type="props.type"
        :prepend-inner-icon="props.prependIcon"
        :append-inner-icon="props.appendIcon"
        :placeholder="props.placeholder"
        :rules="props.rules"
        density="compact"
        variant="outlined"
      ></v-text-field>
    </div>
  </template>
  
  <script setup lang="ts">
  import { ref, watch } from "vue";
  
  
 const props = defineProps<{
      modelValue: any,
      type: string,
      prependIcon?: string,
      appendIcon?: string,
      placeholder?: string,
      rules?: any
  }>();
  
  const inputValue = ref<any>("");
  
  const emit = defineEmits<{
      (e: 'update: modelValue', value:any): void
  }>();
  
  watch(
      () => inputValue.value,
      (val) => emit('update: modelValue', val),
  );
  
  watch(
      () => props.modelValue,
      (val) => {
          if(val != inputValue.value) inputValue.value = val
      },
    //   {immediate: true}
  )
  
  </script>
  
  <style scoped></style>
  