<template>
  <div id="header">
    <el-menu
      :default-active="currentPath"
      router
      mode="horizontal"
      background-color="#545c64"
      text-color="#fff"
      style="min-widtn: 1300px"
      active-text-color="#ffd04b"
    >
      <el-menu-item style="padding: 0" index="/"
        ><div class="logo"></div
      ></el-menu-item>
      <el-menu-item
        v-for="(item, index) in navList"
        :key="index"
        :index="item.name"
      >
        {{ item.navItem }}
      </el-menu-item>
      <el-input
        placeholder="电影、电视剧、影人"
        size="large"
        style="width: 400px; position: relative; margin-top: 12px"
        v-model="keyword"
        @keyup.enter.native="searchClick"
        clearable
      >
      </el-input>
      <el-button
        size="large"
        type="primary"
        style="width: 50px; position: relative; margin-top: 12px"
        icon="el-icon-search"
        @click="searchClick"
      ></el-button>

      <span v-show="!hasLogin" class="rightname"
        ><el-link type="primary" href="/login" target="_blank">登录</el-link>
        <el-divider direction="vertical"></el-divider>
        <el-link type="primary" href="/register">注册</el-link></span
      >
      <span v-show="hasLogin" class="rightname"
        >{{ user.username}}
        <el-divider direction="vertical"></el-divider>
        <el-link type="danger" @click="logout">退出</el-link></span
      >
    </el-menu>
  </div>
</template>
<script>
export default {
  name: "Header",
  data() {
    return {
      user: {
        username: "登录"
      },
      hasLogin: false,
      navList: [
        { name: "/", navItem: "首页" },
        { name: "/mylist", navItem: "我看" },
        { name: "/category", navItem: "分类" },
        { name: "/reviews", navItem: "影评" },
      ],
      keyword: "",
    };
  },
  methods: {
    logout() {
      const _this = this;
      _this.$axios.post("/logout", {}).then((res) => {
        console.info(res);
        _this.$store.commit("REMOVE_INFO");
        location.reload();
      });
    },
    searchClick() {
      if(this.keyword == '')
        this.$ElementUI.Message.error('请输入关键字', { duration: 1000 });
      else
        location.assign("/search?keyword="+this.keyword);
    },
  },
  computed: {
    currentPath() {
      var x = this.$route.path.indexOf("/", 1);
      if (x !== -1) {
        // console.log(this.$route.path.substring(0,x));
        return this.$route.path.substring(0, x);
      } else {
        return this.$route.path;
      }
    },
  },
  created() {
    // 是否已登录
    if (this.$store.state.userInfo != "") {
      this.user.username = this.$store.state.userInfo.username;
      this.hasLogin = true;
    }
  },
};
</script>

<style scoped>
.logo {
  width: 150px;
  height: 61px;
  background: rgba(255, 255, 255, 0.2);
  background-image: url("../assets/logo.png");
  background-size: cover;
  margin: 0;
  float: left;
}
.rightname {
  position: absolute;
  top: 18px;
  color: antiquewhite;
  font-size: 1em;
  right: 20px;
}
</style>
