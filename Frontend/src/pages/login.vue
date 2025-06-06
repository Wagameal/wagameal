<template>
  <div>
    <v-row no-gutters>
      <v-col cols="7">
        <v-img class="w-100 h-screen" :src="loginImage"> </v-img>
      </v-col>

      <v-col cols="5">
        <v-card
        class="mx-auto pa-12 pb-8"
        elevation="0"
        max-width="448"
        >
          <v-sheet>
            <v-img
              class="mx-auto my-3 w-33 h-100"
              :src="logo"
            ></v-img>
            <v-card class="mb-4" elevation="0">
                <v-card-title class="text-center font-weight-black">Admin Login</v-card-title>
              <v-card-text class="text-medium-emphasis text-caption text-center">
                The tail wags, the purrs, the happy<br/> woofs— all start with you logging in!
              </v-card-text>
            </v-card>

            <div class="text-subtitle-2 text-medium-emphasis">Mobile Number</div>

            <!-- <v-text-field
              density="compact"
              placeholder="Mobile Number"
              prepend-inner-icon="mdi-phone-outline"
              variant="outlined"
              
            ></v-text-field> -->
            <InputField 
            v-model="mobileNumber"
            :type="'text'"
            :prependIcon="'mdi-phone-outline'"
            :appendIcon="''"
            :placeholder="'Mobile Number'"
            :rules="mobileRules"
            @update:modelValue="mobileNumber = $event"
            />
            <div
              class="text-subtitle-2 text-medium-emphasis d-flex align-center justify-space-between"
            >
              Password
            </div>

            <v-text-field
              :append-inner-icon="visible ? 'mdi-eye-off' : 'mdi-eye'"
              :type="visible ? 'text' : 'password'"
              density="compact"
              placeholder="Enter your password"
              prepend-inner-icon="mdi-lock-outline"
              variant="outlined"
              @click:append-inner="visible = !visible"
            ></v-text-field>

            <v-btn class="mb-8" color="#183652" size="large" block @click="login">
              Log In
            </v-btn>
          </v-sheet>
        </v-card>
      </v-col>
    </v-row>
  </div>
</template>

<script setup lang="ts">
import { ref } from "vue";
import loginImage from "@images/login.png";
import logo from "@images/logo.png";
import InputField from "@components/Inputs/TextField.vue";
import { adminLogin} from '@utils/apiServices';

const visible = ref(false);

let mobileNumber = ref<number | null>(null);

const mobileRules = [
    (v: string )=> !!v || 'Number is required', 
    (v: string )=> /^[0-9]{10}$/.test(v) || 'Mobile number must be 10 digits'
    
]

const login = async () => {
  console.log("Mobile Number:", mobileNumber);
  if (mobileNumber.value ) {
    try {
      const response = await adminLogin(mobileNumber.value);
      console.log("Login successful:", response);
      // Handle successful login, e.g., redirect to dashboard
    } catch (error) {
      console.error("Login failed:", error);
      // Handle login failure, e.g., show an error message
    }
  } else {
    console.error("Invalid mobile number");
  }
};

</script>

<style scoped></style>
