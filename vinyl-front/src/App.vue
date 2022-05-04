<template>
  <div id="app">
    <router-view />
    <Footer />
  </div>
</template>

<script>
import Footer from "./components/Footer";
export default {
  components: { Footer },
  created() {
    // 向后端验证是否登录
    this.$axios.get("/user/isLogin").then((res) => {
      // 如果后端未登录，要清除前端的登录状态
      if (res.data == false) {
        this.$store.commit("REMOVE_INFO");
      }
    });
  },
};
</script>

<style>
#app {
  /* max-width: 1200px; */
  margin: 0 auto;
  width: 100%;
  min-height: 800px;
  /* background-image:  url("./assets/background.jpg");
  background-attachment: fixed;
  background-size: 20%;
  background-repeat: no-repeat;
  background-position: bottom 0px left 0px; */
}
body {
  margin: 0;
}
</style>