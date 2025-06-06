<template>
  <!-- <v-app-bar density="compact" color="#014880" class="">
    <v-container>
        <v-row>
      <div class="d-flex" @click="returnHome()">
        <img src="/src/assets/images/logo.png" class="logo d-flex" />
        <span class="brand-name"> Wagameal </span>
        <v-icon icon="md:home"></v-icon>
      </div>
      <v-spacer></v-spacer>
      <div class="d-flex">
        <UserProfile />
      </div>
      </v-row>
    </v-container>
  </v-app-bar> -->
 
      <v-app-bar
        color="#183652"
        density="compact"
        class="header position-fixed top-0 right-0"
      >
        <!-- <template v-slot:prepend>
          <v-app-bar-nav-icon></v-app-bar-nav-icon>
        </template> -->

        <v-app-bar-title>Wagameal</v-app-bar-title>

        <v-btn class="text-none" stacked>
        <v-badge color="error" content="2">
          <v-icon>mdi-bell-outline</v-icon>
        </v-badge>
        </v-btn>

        <template v-slot:append>
            <UserProfile />
        </template>
      </v-app-bar>
</template>

<script lang="ts" setup>
import { useRouter } from "vue-router";
import UserProfile from "../components/UserProfile.vue";

const router = useRouter();
const returnHome = () => {
  router.push("/Dashboard");
};
</script>

<style scoped>
.header {
  z-index: 9999 !important;
  
}

.nav-header {
  overflow: hidden;
  padding: 1rem 2.2rem;
  margin-inline: 0;
  align-items: center;
  cursor: pointer;
}

.logo {
  width: 2.5rem;
  height: 2.5rem;
  justify-content: center;
  align-items: center;
  flex-shrink: 0;
}

.brand-name {
  color: #fff;
  font-family: MB Corpo A Title Cond WEB;
  font-size: 1.2rem;
  font-style: normal;
  font-weight: 400;
  line-height: 1.40625rem;
  margin-left: 0.30919rem;
}
</style>
