<template>
  <div>
   <div class="d-flex justify-space-between align-center">
      <div>
        <Breadcrumb :items="BreadcrumbItems" />
      </div>
      <div>
       <Button
          name="Add Customer"
          color="#183652"
          prependIcon="mdi-plus"
          @click="openModal()"
        />
      </div>
    </div>


    <!-- <DataTable /> -->

    <Modal
      title="Add Customer"
      prependIcon="mdi-account"
      buttonText="Add Customer"
      :dialog="dialog"
      @update:dialog="val => dialog = val"
      @closeModal="closeModal"
      @SubmitModal="submitModal"
    >
      <DataTable />
    </Modal>
    

  </div>
</template>

<script setup lang="ts">
import { ref } from 'vue'
import DataTable from '../../components/Table/DataTable.vue';
import Breadcrumb from '../../components/Breadcrumbs/Breadcrumb.vue';
import Button from '../../components/Buttons/Button.vue';
import Modal from '../../components/Modals/Modal.vue';

const BreadcrumbItems = ref([
   {
    title: "Manage Customers",
    disabled: false,
    href: "Customer",
  },
])

let dialog = ref(false);


const openModal = () => {
  dialog.value = true;
};

const closeModal = () => {
  dialog.value = false;
};

const submitModal = () => {
  console.log('Customer Added');
  dialog.value = false;
};
</script>

<style scoped></style>
