import { createRouter, createWebHistory } from 'vue-router';
import Login from '../pages/login.vue';
import Main from '../pages/main.vue';
import Dashboard from '../pages/dashboard/index.vue';
import Customers from '../pages/customers/index.vue';
import Enquiry from '../pages/enquiry/index.vue';
import Subscription from '../pages/subscription/index.vue';
import Products from '../pages/products/index.vue';
import Banners from '../pages/banners/index.vue';


const routes = [
  {
    path: '/',
    name: 'Login',
    component: Login
  },
  { path: '/main',
    name: 'Main',
    component: Main,
    children: [
      {
        path: '/dashboard',
        name: 'Dashboard',
        component: Dashboard,
      },
      {
        path: '/customer',
        name: 'Customers',
        component: Customers,
      },
      {
        path: '/enquiry',
        name: 'Enquiry',
        component: Enquiry,
      },
      {
        path: '/subscription',
        name: 'Subscription',
        component: Subscription,
      },
      {
        path: '/products',
        name: 'Products',
        component: Products,
      },
      {
        path: '/banners',
        name: 'Banners',
        component: Banners,
      }
    ] 
  },
  
]

const router = createRouter({
  history: createWebHistory(),
  routes
})

export default router
