<template>
  <div>
    <Header />
    <div id="block">
      <div id="db-usr-profile">
        <div class="pic">
          <el-tooltip placement="bottom">
            <div slot="content">
              <el-upload
                action="/api/img/avatar/upload"
                :on-success="handleAvatarSuccess"
                :before-upload="beforeAvatarUpload"
              >
                <el-button size="small" type="primary">修改头像</el-button>
                <div slot="tip" class="el-upload__tip">
                  只能上传jpg/png/webp文件
                </div>
              </el-upload>
            </div>
            <img height="48" width="48" alt="avatar" :src="avatar" />
          </el-tooltip>
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
          <el-tab-pane label="已看" name="collect"><Collect /></el-tab-pane>
          <el-tab-pane label="想看" name="wish"><Wish /></el-tab-pane>
          <el-tab-pane label="在看" name="do"><Do /></el-tab-pane>
        </el-tabs>
      </div>
    </div>
    <MyReview/>
  </div>
</template>

<script>
import Header from "../components/Header";
import Collect from "../components/mylist/collect";
import Wish from "../components/mylist/wish";
import Do from "../components/mylist/do";
import MyReview from "../components/mylist/myReview.vue";
export default {
  name: "Mylist",
  components: { Header, Collect, Wish, Do, MyReview },
  data() {
    return {
      activeName: "collect",
      username: this.$store.state.userInfo.username,
      avatar: "/api/avatar/" + this.$store.state.userInfo.avatarPath,
      profile: "",
      fuck:''
    };
  },
  methods: {
    handleAvatarSuccess(res) {
      var userInfo = {
        id:this.$store.state.userInfo.id,
        username:this.$store.state.userInfo.username,
        avatarPath:res.data,
        status: this.$store.state.userInfo.status
      }
      this.$store.commit("SET_USERINFO", userInfo);
      location.reload();
    },
    beforeAvatarUpload(file) {
      const isJPG = file.type === "image/jpeg";
      const isPNG = file.type === "image/png";
      const isWebp = file.type === "image/webp";
      const isLt2M = file.size / 1024 / 1024 < 2;

      if (!isJPG && !isPNG && !isWebp) {
        this.$message.error("上传头像图片只能是 JPG/PNG/WEBP 格式!");
      }
      if (!isLt2M) {
        this.$message.error("上传头像图片大小不能超过 2MB!");
      }
      return (isJPG||isPNG||isWebp) && isLt2M;
    },
  },
  mounted: function () {
    this.$axios.get("/user/" + this.$store.state.userInfo.id).then((resp) => {
      this.profile = resp.data.profile;
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