import Vue from 'vue'
import App from './App.vue'
import router from './router'
import store from './store'
import axios from 'axios'
import ElementUI from 'element-ui';
import mavonEditor from 'mavon-editor'

import 'element-ui/lib/theme-chalk/index.css';
import './axios';
import 'mavon-editor/dist/css/index.css';

Vue.config.productionTip = false;
Vue.prototype.$axios = axios;
Vue.use(ElementUI);
Vue.use(mavonEditor);

Vue.prototype.$axios = axios;
Vue.prototype.$ElementUI = ElementUI;

// 路由权限
router.beforeEach((to, from, next) => {
  // 路由变化时改变标签名
  if (to.meta.title) {
    document.title = to.meta.title;
  }
  // if (to.meta.requireAuth) {
  if (to.matched.some(record => record.meta.requireAuth)) {
    // 如果需要权限且未登录
    if (store.state.userInfo == "") {
      ElementUI.Message.error('请先登录', { duration: 1000 });
      next({
        path: '/login'
      })
    } else {
      // 向后端验证是否登录
      axios.get("/user/isLogin").then((res) => {
        // 如果后端未登录，要清除前端的登录状态
        if (res.data === false) {
          store.commit("REMOVE_INFO");
        }
      });
    }
  }
  if (to.meta.requireAdmin) {
    // 如果需要管理员权限且未登录
    if (localStorage.isAdminLogin == "") {
      ElementUI.Message.error('请先登录管理员', { duration: 1000 });
      next({
        path: '/adminlogin'
      })
    } else {
      // 向后端验证是否登录
      axios.get("/admin/isLogin").then((res) => {
        // 如果后端未登录，要清除前端的登录状态
        if (res.data === false) {
          store.commit("REMOVE_ADMIN");
        }
      });
    }
  }
  next()

})

new Vue({
  router,
  store,
  render: h => h(App),
}).$mount('#app')
