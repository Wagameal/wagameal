<template>
  <div>
    <div class="d-flex justify-space-between align-center">
      <div>
        <Breadcrumb :items="BreadcrumbItems" />
      </div>
      <div>
        <!-- <Datepicker /> -->
      </div>
    </div>

    <v-col>
      <v-row>
        <v-col v-for="(cardItem, i) in cardItems" :key="i" cols="12" md="3">
          <!-- <v-card color="indigo" variant="elevated" class="">
            <v-card-item>
              <div class="d-flex  align-center mb-2">
                <div>
                  <v-icon
                    :icon="cardItem.icon"
                    size="36"
                    class="mb-2"
                    color="white"
                  />
                </div>
                <div>
                  <div class="text-h6 mb-1">
                    {{ cardItem.value }}
                  </div>
                  <div class="text-caption">{{ cardItem.title }}</div>
                </div>
              </div>
            </v-card-item>
          </v-card> -->

          <v-card class="mx-auto" subtitle="Customes" title="790">
            <template v-slot:prepend>
              <v-avatar color="blue-darken-2">
                <v-icon icon="mdi-alarm"></v-icon>
              </v-avatar>
            </template>
          </v-card>
        </v-col>
      </v-row>
      <v-row>
        <v-col cols="12" md="6">
          <v-card color="green">
            <v-card-title>Card Title</v-card-title>
            <v-card-text>
      <v-sheet color="rgba(0, 0, 0, .12)">
        <v-sparkline
          :model-value="value"
          color="rgba(255, 255, 255, .7)"
          height="100"
          padding="24"
          stroke-linecap="round"
          smooth
        >
          <template v-slot:label="item">
            ${{ item.value }}
          </template>
        </v-sparkline>
      </v-sheet>
    </v-card-text>

    <!-- <v-card-text>
      <div class="text-h4 font-weight-thin">
        Sales Last 24h
      </div>
    </v-card-text> -->
          </v-card>
        </v-col>
      </v-row>
    </v-col>
  </div>
</template>

<script setup lang="ts">
import { ref } from "vue";
import Breadcrumb from "@/components/Breadcrumbs/Breadcrumb.vue";
// import Datepicker from "@/components/Datepicker/RangeDatepicker.vue";
const BreadcrumbItems = ref<any>([
  {
    title: "Dashboard",
    disabled: false,
    href: "Dashboard",
  },
]);

const variants = ["elevated", "flat", "tonal", "outlined"];
const color = ref("indigo");

const cardItems = ref([
  { icon: "mdi-account", value: 2000, title: "Customers" },
  { icon: "mdi-account", value: 2000, title: "Customers" },
  { icon: "mdi-account", value: 2000, title: "Customers" },
  { icon: "mdi-account", value: 2000, title: "Customers" },
]);

const value = ref([
    423,
    446,
    675,
    510,
    590,
    610,
    760,
  ]);
</script>
