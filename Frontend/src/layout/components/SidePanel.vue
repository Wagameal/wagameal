<template>
  <v-navigation-drawer
    class="drawer"
    :rail="rail"
    @click.stop="rail = false"
    @click="drawerOpen()"
  >
    <v-list density="compact" nav>
      <div
        class="menu-list"
        title="Menu"
        value="Menu"
        @click="toggleDrawer"
        @click.stop="rail = !rail"
      >
        <div class="d-flex justify-space-between align-center menu">
          <span v-if="!rail"> Menu </span>
          <v-icon
            :icon="rail ? 'mdi-menu' : 'mdi-chevron-right'"
            class="menu-icon"
            @click.stop="rail = !rail"
            @click="toggleDrawer"
          ></v-icon>
        </div>
      </div>

      <v-list>
        <!-- <template v-slot:activator="{ props }">
              <v-list-item
                v-bind="props"
                :prepend-icon="menuItem.icon"
                :title="menuItem.title"
                class="custom-icon-color"
              ></v-list-item>
            </template> -->
        <!-- <v-list-item
          v-for="menuItem in menuItems"
          :key="menuItem.value"
          :value="menuItem.value"
          :to="menuItems.path"
          class="v-list-item v-list-item--link v-list-item--nav v-list-item--slim v-theme--dark v-list-item--density-compact v-list-item--rounded v-list-item--variant-text"
        >
        <template v-slot:prepend>
              <v-icon :icon="menuItem.icon"
              class="v-list-item v-list-item--link v-list-item--nav v-list-item--slim v-theme--dark v-list-item--density-compact v-list-item--rounded v-list-item--variant-text"></v-icon>
            </template>

            <v-list-item-title v-text="menuItem.value"></v-list-item-title>
        </v-list-item> -->

        <v-list-item
        v-for="(item, i) in items"
        :key="i"
        :value="item"
        :to="item.path"
        color="primary"
        class="v-list-item v-list-item--link v-list-item--nav v-list-item--slim v-theme--dark v-list-item--density-compact v-list-item--rounded v-list-item--variant-text"
        
      >
        <template v-slot:prepend>
          <v-icon :icon="item.icon"
          ></v-icon>
        </template>

        <v-list-item-title v-text="item.text"></v-list-item-title>
      </v-list-item>

      </v-list>
    </v-list>
  </v-navigation-drawer>
</template>

<script setup lang="ts">
import { ref } from "vue";

const emit = defineEmits(["drawer-open", "toggle-view-size"]);

const rail = ref(false);

const drawerOpen = () => {
  emit('drawer-open')
}

const toggleDrawer = () => {
  emit('toggle-view-size')
}


const items = [
    { text: 'Dashboard', icon: 'mdi-view-dashboard', path: '/dashboard' },
    { text: 'Manage Customers', icon: 'mdi-account-box-multiple', path: '/customer' },
    { text: 'Sampal Enquiry', icon: 'mdi-calendar-question', path: '/enquiry' },
    { text: 'Subscriptions', icon: 'mdi-text-box-check', path: '/subscription' },
    { text: 'Manage Products', icon: 'mdi-nutrition', path: '/products' },
    { text: 'Manage Banners', icon: 'mdi-view-day', path: '/banners' },
  ]
</script>

<style scoped>
.drawer {
  position: fixed !important;
  height: calc((100% - 50px) - 0px);
  border-color: var(--blue-blue-75, #80c6ff);
  background-color: #183652;
  color: #eeeeee;
  /* width: 225px !important; */

}
.v-list--nav {
  padding: 0 !important;
}
.menu {
  min-height: 50px;
  padding-left: 20px;
  background-color: #183652;
    color: #eeeeee;
}
.menu-list {
  color: var(--blue-blue-15, #003156);
  font-family: MB Corpo S Text WEB;
  font-size: 16px;
  font-style: normal;
  font-weight: 400;
  line-height: 24px; /* 150% */
  min-height: 50px;
  /* border-bottom: 1px solid var(--blue-blue-75, #80c6ff); */
}
.menu-icon {
  padding-right: 15px;
}
.v-list-item--density-compact.v-list-item--one-line {
  min-height: 50px;
  /* border-bottom: 1px solid var(--blue-blue-75, #80c6ff); */
}
.v-list-item--nav {
  padding-inline-start: 15px;
  border-radius: 0px;
  margin-bottom: 0px !important;
}
.v-list-item-title {
  /* border-bottom: 1px solid var(--blue-blue-75, #80c6ff); */
}
.custom-icon-color {
  color: #16466b;
  opacity: unset !important;
}
.v-icon {
  opacity: unset !important;
}
.v-list-group--open {
  background: var(--blue-blue-85, #b4ddfe);
}

.v-list-item--active {
  font-weight: 700;
  font-size: 16px;
}
</style>
