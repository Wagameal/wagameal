<template>
    <div>
        <div class="d-flex justify-space-between align-center">
      <div>
        <Breadcrumb :items="BreadcrumbItems" />
      </div>
      <div class="d-flex align-center ga-4">
        <ButtonIcon
          :icon="'mdi-magnify'"
          
          :size="'small'"
          :title="'Search Product'"
         
        />
        <ButtonIcon
          :icon="'mdi-filter'"
          
          :size="'small'"
          :title="'Filter Product'"
         
        />
        <ButtonIcon
          :icon="'mdi-download'"
          
          :size="'small'"
          :title="'Download Product list'"
         
        />
        <!-- <v-icon
          color="medium-emphasis"
          icon="mdi-pencil"
          size="small"
        ></v-icon> -->
       <Button
          name="Product"
          color="#183652"
          prependIcon="mdi-plus"
          @click="openModal()"
        />
      </div>
    </div>

  <v-card flat>
    

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
      

      <template v-slot:item.image="{ item }">
        <v-card class="my-2" elevation="2" rounded>
          <v-img
            :src="`https://cdn.vuetifyjs.com/docs/images/graphics/gpus/${item.image}`"
            height="64"
            cover
          ></v-img>
        </v-card>
      </template>

      

      <template v-slot:item.action="{ item }">
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
  </v-card>

    </div>
</template>

<script setup lang="ts">

import { ref } from 'vue'
import Switch from '@components/Switcher/Switch.vue';
import Breadcrumb from '@components/Breadcrumbs/Breadcrumb.vue';
import Button from '@components/Buttons/Button.vue';
import Modal from '@components/Modals/Modal.vue';
import ButtonIcon from '@components/Buttons/ButtonIcon.vue';

  const search = ref('')
  const BreadcrumbItems = ref([
   {
    title: "Manage Products",
    disabled: false,
    href: "Product",
  },
]);
  const items = [
    {
      sr:1,
      name:'Product 1',
      image: '1.png',
      category: 'Dog',
      action: true,
    },
    {
      sr:2,
      name:'Product 2',
      image: '2.png',
      category: 'Cat',
      action: false,
    },
    {
      sr:3,
      name:'Product 3',
      image: '3.png',
      category: 'Dog',
      action: true,
    },
    {
      sr:4,
      name:'Product 4',
      image: '4.png',
      category: 'Cat',
      action: true,
    },
    {
      sr:5,
      name:'Product 5',
      image: '5.png',
      category: 'Dog',
      action: false,
    },
  ]

</script>

<style scoped>

</style>