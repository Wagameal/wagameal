<template>
    
        
      
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
    <v-data-table
      v-model:search="search"
      :filter-keys="['name']"
      
      
      v-model="selected"
      :headers="headers"
      :items="desserts"
      item-value="name"
      items-per-page="5"
      return-object
      show-select
    ></v-data-table>
  
    <pre>{{ selected }}</pre>
  </template>

<script setup type="ts">
import { ref } from 'vue'

const search = ref('')
const selected = ref([])

const headers = ref([
  { title: 'Sr.No.', align: 'start', key: 'sr' },
  { title: 'Name',align: 'start',key: 'name'},
  { title: 'Mobile', align: 'start', key: 'mobile' },
  { title: 'Pet Count', align: 'start', key: 'petCount' },
  { title: 'Locality', align: 'start', key: 'location' },
  { title: 'Action', align: 'start' },
  
])
const desserts = ref([
  { sr: 1,
    name: 'Ritesh Deshmukh',
    mobile: 8764927654,
    petCount: 2,
    location: 'Mumbai'
  },
  {sr: 2,
    name: 'Akshay Kumar',
    mobile: 9865324564,
    petCount: 5,
    location: 'Mumbai'
  },
  
  {sr: 3,
    name: 'Mugdha Deshpande',
    mobile: 914378643,
    petCount: 4,
    location: 'Pune'
  },

  {sr: 4,
    name: 'Swapnil Joshi',
    mobile: 8563789345,
    petCount: 3,
    location: 'Pune'
  },
]);

function add () {
    isEditing.value = false
    record.value = DEFAULT_RECORD
    dialog.value = true
  }
</script>