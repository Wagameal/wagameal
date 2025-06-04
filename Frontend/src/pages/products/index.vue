<template>
  <v-card flat>
    <v-card-title class="d-flex align-center pe-2">
      <v-icon icon="mdi-video-input-component"></v-icon> &nbsp;
      Products

      <v-spacer></v-spacer>

      <v-text-field
        v-model="search"
        density="compact"
        label="Search"
        prepend-inner-icon="mdi-magnify"
        variant="solo-filled"
        flat
        hide-details
        single-line
      ></v-text-field>
    </v-card-title>

    <v-divider></v-divider>
    <v-data-table
      v-model:search="search"
      :filter-keys="['name']"
      :items="items"
    >
      <template v-slot:header.stock>
        <div class="text-end">Stock</div>
      </template>

      <template v-slot:item.image="{ item }">
        <v-card class="my-2" elevation="2" rounded>
          <v-img
            :src="`https://cdn.vuetifyjs.com/docs/images/graphics/gpus/${item.image}`"
            height="64"
            cover
          ></v-img>
        </v-card>
      </template>

      <template v-slot:item.category="{ item }">
        <div
          :model-value="item.category"
          color="orange-darken-2"
          density="compact"
          size="small"
          readonly
        >{{item.category}}</div>
      </template>

      <template v-slot:item.stock="{ item }">
        <div class="text-end">
          <v-chip
            :color="item.stock ? 'green' : 'red'"
            :text="item.stock ? 'In stock' : 'Out of stock'"
            class="text-uppercase"
            size="small"
            label
          ></v-chip>
        </div>
      </template>
    </v-data-table>
  </v-card>
</template>
<script setup lang="ts">
  import { ref } from 'vue'

  const search = ref('')
  const items = [
    {
      name: 'Wholesome meal',
      image: '1.png',
      price: 699.99,
      category: 5,
      stock: true,
    },
    {
      name: 'Wholesome meal',
      image: '2.png',
      price: 799.99,
      category: 4,
      stock: false,
    },
    {
      name: 'Wholesome meal',
      image: '3.png',
      price: 649.99,
      category: 3,
      stock: true,
    },
    {
      name: 'Wholesome meal',
      image: '4.png',
      price: 1499.99,
      category: 4,
      stock: true,
    },
    {
      name: 'Wholesome meal',
      image: '5.png',
      price: 299.99,
      category: 4,
      stock: false,
    },
  ]
</script>