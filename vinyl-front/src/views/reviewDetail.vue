<template>
  <div>
    <Header />
    <div id="block">
      <h2 style="padding-top:20px">{{ review.title }}</h2>
      <span style="color: #666; font-size:13px">{{review.date | formatDate}}</span>
      <el-button type="small" style="margin-left:10px;" :class="hasLike?'haslike':'unlike'" @click="like">赞：{{likeNumber}}</el-button>
      <div v-if="ownreview" style="margin-top:12px">
        <router-link :to="{ name: 'ReviewEdit', params: { reviewId: review.id },query:{movieId:review.movieId} }">
          <el-button type="small" style="margin-right:20px">编辑</el-button>
        </router-link>
        <el-button type="small" @click="remove">
          删除
        </el-button>
      </div>

      <el-divider></el-divider>
      <div class="markdown-body" v-html="review.body"></div>
    </div>
  </div>
</template>

<script>
import Header from "../components/Header";
import formatDate from "../utils/date.js";
import "github-markdown-css/github-markdown-light.css";

export default {
  name: "ReviewDetail",
  components: { Header },
  filters: {
    formatDate(time) {
      return formatDate(time);
    },
  },
  data() {
    return {
      review: {
        id: this.$route.params.reviewId,
        title: "",
        body: "",
        movieId:"",
        date:0,
      },
      ownreview: false,
      likeNumber: 0,
      hasLike: false,
      isLogin: false,
    };
  },
  methods: {
    remove() {
      this.$axios
        .delete("/review/del/" + this.review.id)
        .then(() => {
          location.assign("/mylist");
        });
    },
    like() {
      if(!this.isLogin){
        this.$ElementUI.Message.error('请先登录', { duration: 1000 });
      } else {
        if(this.hasLike === false){
          this.$axios.post("/dolike?reviewId="+this.review.id).then(()=>{
          this.hasLike = true;
          this.likeNumber++;
        })
        } else {
          this.$axios.post("/undolike?reviewId="+this.review.id).then(()=>{
          this.hasLike = false;
          this.likeNumber--;
        })
        }
      }
    }
  },
  mounted() {
    this.isLogin = this.$store.state.userInfo != ""?true:false;
    this.$axios.get("/review/" + this.review.id).then((res) => {
      this.review.title = res.data.title;
      document.title = this.review.title;
      this.review.movieId = res.data.movieId;
      this.review.date = res.data.date;
      // 渲染md
      var MardownIt = require("markdown-it");
      var md = new MardownIt();

      var result = md.render(res.data.body);
      this.review.body = result;
      this.ownreview = res.data.userId === this.$store.state.userInfo.id;
    });
    this.$axios.get("/likeNumber?reviewId="+this.review.id).then(res => {
      this.likeNumber = res.data;
    });
    this.$axios.get("/hasLike?reviewId="+this.review.id).then(res => {
      this.hasLike = res.data;
    });

  },
};
</script>

<style scoped>
#block {
  width:840px;
  margin: 20px auto;
}
.haslike {
  color:red;
}
.unlike {
  color: rgb(235, 195, 19);
}
</style>