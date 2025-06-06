<template>
  <div class="pa-4 text-center">
    <v-dialog
      :model-value="dialog"
      @update:model-value="$emit('update:dialog', $event)"
      max-width="600"
    >
      <v-card
        :prepend-icon="prependIcon"
        :title="title"
      >
        <v-card-text>
          <slot></slot>
        </v-card-text>

        <v-divider></v-divider>

        <v-card-actions>
          <v-spacer></v-spacer>

          <v-btn
            text="Close"
            variant="plain"
            @click="closeModal"
          ></v-btn>

          <v-btn
            color="primary"
            :text="buttonText"
            variant="tonal"
            @click="SubmitModal"
          ></v-btn>
        </v-card-actions>
      </v-card>
    </v-dialog>
  </div>
</template>

<script setup lang="ts">
import { defineProps, defineEmits } from 'vue';

const props = defineProps<{
  title: string;
  prependIcon: string;
  dialog: boolean;
  buttonText: string;
}>();

const emit = defineEmits<{
  'update:dialog': [value: boolean];
  'closeModal': [];
  'SubmitModal': [];
}>();

const closeModal = () => {
  emit('update:dialog', false);
  emit('closeModal');
};

const SubmitModal = () => {
  emit('update:dialog', false);
  emit('SubmitModal');
};
</script>