<template>
  <div>
    <v-card flat>
      <v-card-title class="d-flex align-center pe-2">
         Customers

        <v-spacer></v-spacer>

        
      </v-card-title>

      <!-- <v-divider></v-divider> -->
      
    </v-card>
    <v-toolbar flat>
          <v-toolbar-title>
            <v-icon color="medium-emphasis" icon="mdi-book-multiple" size="x-small" start></v-icon>

            Customer
          </v-toolbar-title>

          <v-btn
            class="me-2 mb-2"
            prepend-icon="mdi-plus"
            rounded="lg"
            text="Customer"
            border
            @click="add"
          ></v-btn>
        </v-toolbar>

    <DataTable />
  </div>
</template>

<script setup lang="ts">
import DataTable from '@components/Table/DataTable.vue'

  
  
</script>

<style scoped></style>
