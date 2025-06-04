<template>
    <div>
        <v-btn
          :color="color"
          :prepend-icon="prependIcon"
          :text="name"
          :append-icon="appendIcon"
          class="text-none"
          variant="elevated"
          @click="buttonClick"
        ></v-btn>
    </div>
</template>
<script setup lang="ts">
    import { ref } from 'vue'
    
    const props = defineProps({
        name: {
            type: String,
            default: 'Button',
        },
        color: {
            type: String,
            default: 'primary',
        },
        prependIcon: {
            type: String,
            default: '',
        },
        appendIcon: {
            type: String,
            default: '',
        },
    });

    const color = ref(props.color);
    const prependIcon = ref(props.prependIcon);
    const appendIcon = ref(props.appendIcon);
    const name = ref(props.name);

     const emit = defineEmits(['click']);

    const buttonClick = () => {
        emit('click');
    };

</script>
