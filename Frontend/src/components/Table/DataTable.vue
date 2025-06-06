<template>
  <!-- <v-text-field
          v-model="search"
          density="compact"
          label="Search"
          prepend-inner-icon="mdi-magnify"
          variant="solo-filled"
          flat
          hide-details
          single-line
        ></v-text-field> -->
  <v-data-table
    v-model:search="search"
    :filter-keys="['name']"
    v-model="selected"
    :headers="headers"
    :items="items"
    item-value="name"
    items-per-page="5"
    return-object
    show-select
  >
    <template v-slot:item.actions="{ item }">
      <div class="d-flex align-center ga-2 justify-center">
        <v-icon
          color="medium-emphasis"
          icon="mdi-pencil"
          size="small"
          @click="edit(item.id)"
        ></v-icon>

        <v-icon
          color="medium-emphasis"
          icon="mdi-delete"
          size="small"
          @click="remove(item.id)"
        ></v-icon>
        <Switch :switch="item.isSubscribed" @update:switcher="switchFn" />
      </div>
    </template>
  </v-data-table>
</template>

<script setup type="ts">
import { ref } from 'vue'
import Switch from '@components/Switcher/Switch.vue';

const search = ref('')
const selected = ref([]);

const props = defineProps({
  headers: {
    type: Array,
    required: true
  },
  items: {
    type: Array,
    required: true
  }
});



function add () {
    isEditing.value = false
    record.value = DEFAULT_RECORD
    dialog.value = true
  }

  const switchFn = (value) => {
    console.log('Switch toggled',value);
  }
</script>
