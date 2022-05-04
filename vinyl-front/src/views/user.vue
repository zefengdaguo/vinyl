<template>
  <div>
    <Header />
    <div id="block">
      <div id="db-usr-profile">
        <div class="pic">
          <img height="48" width="48" alt="avatar" :src="avatar" />
        </div>
        <div class="info">
          <h1>{{ username }}的电影主页</h1>
          <span
            style="font: 12px Arial, Helvetica, sans-serif; margin-bottom: 6px"
            >{{ profile }}</span
          >
        </div>
      </div>
      <div style="margin-top: 20px">
        <el-tabs
          v-model="activeName"
          type="border-card"
        >
          <el-tab-pane label="已看" name="collect"><Collect :userId="userId"/></el-tab-pane>
          <el-tab-pane label="想看" name="wish"><Wish :userId="userId"/></el-tab-pane>
          <el-tab-pane label="在看" name="do"><Do :userId="userId"/></el-tab-pane>
        </el-tabs>
      </div>
    </div>
    <MyReview :userId="userId"/>
  </div>
</template>

<script>
import Header from "../components/Header";
import Collect from "../components/user/collect";
import Wish from "../components/user/wish";
import Do from "../components/user/do";
import MyReview from "../components/user/userReview.vue";
export default {
  name: "User",
  components: { Header, Collect, Wish, Do, MyReview },
  data() {
    return {
      userId: this.$route.params.userId,
      activeName: "collect",
      username: '',
      avatar: '',
      profile: "",
    };
  },
  created() {
    this.$axios.get("/user/" + this.userId).then((resp) => {
      this.profile = resp.data.profile;
      this.username = resp.data.username;
      document.title = this.username + '的电影主页';
      this.avatar = "/api/avatar/" + resp.data.avatarPath;
    });
  },
};
</script>

<style scoped>
#block {
  width: 840px;
  margin: 20px auto;
}

#db-usr-profile {
  width: 100%;
  height: 58px;
  position: relative;
  left: 0;
  top: 0;
  zoom: 1;
}

#db-usr-profile .pic {
  float: left;
  margin-right: 12px;
}

#db-usr-profile .info {
  float: left;
  padding-top: 2px;
}

h1 {
  word-wrap: break-word;
  display: block;
  font-size: 25px;
  font-weight: bold;
  color: #494949;
  margin: 0;
  padding: 0 0 4px 0;
  line-height: 1.1;
}
</style>