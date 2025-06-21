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
          :title="'Search customer'"
         
        />
        <ButtonIcon
          :icon="'mdi-filter'"
          
          :size="'small'"
          :title="'Filter customer'"
         
        />
        <ButtonIcon
          :icon="'mdi-download'"
          
          :size="'small'"
          :title="'Download customer list'"
         
        />
        <!-- <v-icon
          color="medium-emphasis"
          icon="mdi-pencil"
          size="small"
        ></v-icon> -->
       <Button
          name="Customer"
          color="#183652"
          prependIcon="mdi-plus"
          @click="openModal()"
        />
      </div>
    </div>


    <DataTable :headers="headers" :items="desserts"/>

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
import { ref, onMounted } from 'vue'
import DataTable from '@components/Table/DataTable.vue';
import Breadcrumb from '@components/Breadcrumbs/Breadcrumb.vue';
import Button from '@components/Buttons/Button.vue';
import Modal from '@components/Modals/Modal.vue';
import ButtonIcon from '@components/Buttons/ButtonIcon.vue';
import {getAllUsers} from '@utils/apiServices';
import { useRouter } from 'vue-router';
const router = useRouter();

const BreadcrumbItems = ref([
   {
    title: "Manage Customers",
    disabled: false,
    href: "Customer",
  },
]);

const headers = ref([
  { title: 'Sr.No.', align: 'start', key: 'sr' },
  { title: 'Name',align: 'start',key: 'name'},
  { title: 'Mobile', align: 'start', key: 'mobile' },
  { title: 'Pet Count', align: 'start', key: 'petCount' },
  { title: 'Locality', align: 'start', key: 'location' },
  { title: 'Actions', key: 'actions', align: 'center', sortable: false },
]);

const desserts = ref([
  { sr: 1,
    name: 'Ritesh Deshmukh',
    mobile: 8764927654,
    petCount: 2,
    location: 'Mumbai',
    isSubscribed: true
  },
  {sr: 2,
    name: 'Akshay Kumar',
    mobile: 9865324564,
    petCount: 5,
    location: 'Mumbai',
    isSubscribed: false
  },
  
  {sr: 3,
    name: 'Mugdha Deshpande',
    mobile: 914378643,
    petCount: 4,
    location: 'Pune',
    isSubscribed: true
  },

  {sr: 4,
    name: 'Swapnil Joshi',
    mobile: 8563789345,
    petCount: 3,
    location: 'Pune',
    isSubscribed: true
  },
]);

const getAllUser = async () => {
  try {
    const response = await getAllUsers();
    console.log('Users Data:', response.data.data);
    // Assuming response.data is an array of user objects
    // const desserts = response.data.data.map((user, index) => ({
    //   sr: index + 1,
    //   name: user.name,
    //   mobile: user.mobile,
    //   petCount: user.petCount,
    //   location: user.location,
    //   isSubscribed: user.isSubscribed
    // }));
    // Process the data as needed
  } catch (error) {
    console.error('Error fetching users:', error);
  }
};

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


onMounted(() => {
  getAllUser();
});

</script>

<style scoped></style>
