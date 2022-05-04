<template>
  <div>
    <Header />
    <el-dialog title="添加收藏：修改" :visible.sync="dialogVisible">
      <el-form style="text-align: left" ref="dataForm">
        <el-radio v-model="watchInfo.status" :label="0">想看</el-radio>
        <el-radio v-model="watchInfo.status" :label="1">已看</el-radio>
        <el-radio v-if="movieInfo.isTv" v-model="watchInfo.status" :label="2">在看</el-radio>
        <el-form-item
          label="评分(1-10)"
          class="formitem"
          v-if="watchInfo.status != 0"
        >
          <el-input-number
            v-model="watchInfo.rate"
            :min="0"
            :max="10"
            label="评分"
          ></el-input-number>
        </el-form-item>
        <el-form-item label="简短评论">
          <el-input type="textarea" v-model="watchInfo.comment"></el-input>
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button @click="dialogVisible = false">取 消</el-button>
        <el-button type="primary" @click="onSubmit">确 定</el-button>
      </div>
    </el-dialog>
    <div id="block">
      <h1>
        <span>{{ movieInfo.title }} {{ movieInfo.originalTitle }}</span>
        <span style="color: #888">({{ movieInfo.year }})</span>
      </h1>
      <div class="clearfix">
        <div class="subject">
          <div id="mainpic">
            <img :src="'/api/poster/'+movieInfo.posterPath" :alt="movieInfo.title">
          </div>
          <div id="info">
            <div class="line">
              <span class="p1">类型：</span>
              <span v-for="(item,index) in movieInfo.categories" :key="index">
              {{ item.name }}
                <template v-if="index < movieInfo.categories.length-1">
                  <span>/</span>
                </template>
              </span>
            </div>
            <div class="line">
              <span class="p1">制片国家/地区：</span>
              <span v-for="(item,index) in movieInfo.countries" :key="index">
                {{ item.nameZh }}
                <template v-if="index < movieInfo.countries.length-1">
                  <span>/</span>
                </template>
              </span>
            </div>
            <div class="line">
              <span class="p1">语言：</span>
              <span v-for="(item,index) in movieInfo.languages" :key="index" >
                {{ item.name }}
                <template v-if="index < movieInfo.languages.length-1">
                  <span>/</span>
                </template>
              </span>
            </div>
            <div class="line">
              <span class="p1">上映日期：</span>
              <span>{{movieInfo.releaseDate}}</span>
            </div>
            <div class="line">
              <span class="p1">片长：</span>
              <span>{{movieInfo.runtime}}分钟</span>
            </div>
            <div class="line" v-if="movieInfo.isTv == 1">
              <span class="p1">集数：</span>
              <span>{{movieInfo.episodeNumber}}</span>
            </div>
          </div>
        </div>
        <div id="interest">
          <div style="line-height:2;">vinyl评分</div>
          <div class="rating">
            <strong class="rating_num">{{movieInfo.rate == 0?'暂无评分':movieInfo.rate}}</strong>
          </div>
          <div style="margin-top:13px">
            <el-rate
              :value="movieInfo.rate / 2"
              disabled
              allow-half
              text-color="#ff9900"
              score-template="{value}"
            >
            </el-rate>
          </div>
        </div>
      </div>
      <div style="clear:both"></div>
      <div v-if="isLogin">
        <div class="watch" v-if="isMarked">
          <div v-if="watchInfo.status !== 0">
            <el-rate
              :value="watchInfo.rate / 2"
              disabled
              allow-half
              text-color="#ff9900"
              score-template="{value}"
            >
            </el-rate>
            <span class="subject-rate">个人评分：{{ watchInfo.rate == 0?'未评分':watchInfo.rate }}</span>
            <span style="color: #666; margin-left: 10px">{{
              watchInfo.date | formatDate
            }}</span>
          </div>
          <div v-if="watchInfo.status === 0">
            <span style="color:black">已想看</span>
          </div>
          <span class="comment">{{ watchInfo.comment }}</span>
          <div>
          <el-button @click="dialogVisible = true" type="text" size="small">
            修改
          </el-button>
          <el-button type="text" size="small" @click="remove">
            删除
          </el-button>
          </div>
        </div>
        <div class="watch" v-if="!isMarked">
          <el-button @click="dialogVisible = true" type="primary">
            mark
          </el-button>
        </div>
        <span>
        <el-link
          v-if="isReview"
          type="success" :href="'/review/' + myReviewId"
          >{{'查看我的影评'}}</el-link
        ></span>
        <span>
        <el-link
          v-if="!isReview"
          type="success" :href="'/review/add?movieId=' + movieId"
          >{{'发表影评'}}</el-link
        ></span>
      </div>
      <h2>剧情简介</h2>
      <div class="overview">
        {{movieInfo.overview}}
      </div>
    </div>
    <MoviePerson :movieId="movieId"/>
    <div style="clear:both"></div>
    <Comments :movieId="movieId"/>
    <div style="clear:both"></div>
    <MovieReview :movieId="movieId"/>
  </div>
</template>

<script>
import Header from "../components/Header";
import MoviePerson from "../components/moviePerson";
import Comments from "../components/comments";
import MovieReview from "../components/movieReview";
import formatDate from "../utils/date.js";
export default {
  name: "MovieDetail",
  components: { Header, MoviePerson, Comments, MovieReview },
  data() {
    return {
      dialogVisible: false,
      movieId: this.$route.params.movieId,
      movieInfo: {},
      isMarked: false, // 是否标记过
      watchInfo:{status: 1},   // 标记信息
      isReview: false,  // 是否写过影评
      isLogin: false,
      myReviewId: 0
    };
  },
  filters: {
    formatDate(time) {
      return formatDate(time);
    },
  },
  methods: {
    watchstatus() {
      this.isLogin = this.$store.state.userInfo != ""?true:false;
      if(this.isLogin) {
        this.$axios.get("/watch/marked?movieId="+this.movieId).then(res => {
          if(res.data == -1) {
            this.isMarked = false;
          }
          else{
            this.watchInfo = res.data;
            this.isMarked = true;
          }
        })
      }
    },
    reviewStatus() {
      if(this.isLogin) {
        this.$axios.get("/review/list?pageNum=1&pageSize=1&movieId="+this.movieId+"&userId="+this.$store.state.userInfo.id).then(res => {
          if(res.data.total === 0) {
            this.isReview = false;
          } else{
            this.isReview = true;
            this.myReviewId = res.data.list[0].id;
          }
        })
      }
    },
    remove() {
      this.$axios
        .delete("/watch/mark/delete?movieId=" + this.movieId)
        .then(() => {
          // 删除前端的记录
          this.isMarked = false;
        });
    },
    onSubmit() {
      var url = "";
      if (this.watchInfo.status === 0) {
        url = "/watch/mark/wish";
      } else if (this.watchInfo.status === 1) {
        url = "/watch/mark/collect";
      } else {
        url = "/watch/mark/do";
      }
      this.$axios.post(url, {
        movieId: this.movieId,
        rate: this.watchInfo.rate,
        comment: this.watchInfo.comment
      }).then(() => {
        location.reload();
      });
    },
  },
  mounted() {
    this.$axios.get("/movie/" + this.movieId).then((res) => {
      this.movieInfo = res.data;
      document.title = res.data.title;
    });
    this.watchstatus();
    this.reviewStatus();
  },
};
</script>

<style scoped>
#block {
  width:840px;
  margin: 0 auto;
}

h1 {
  word-wrap: break-word;
  display: block;
  font-size: 26px;
  font-weight: bold;
  color: #494949;
  margin-top: 26px;
  padding: 0 0 15px 0;
  line-height: 1.1;
}

.clearfix {
  margin-bottom: 30px;
  display: block;
  zoom: 1;
  word-break: normal;
  word-wrap: break-word;
  font: 15px Helvetica,Arial,sans-serif;
}

.subject {
  width: 500px;
  float: left;
}

.subject #mainpic {
    float: left;
    text-align: center;
    margin: 3px 20px 0 0;
    max-width: 155px;
    overflow: hidden;
}

#mainpic img {
  width: 130px;
  margin-bottom: 10px;
  border-width: 0;
  vertical-align: middle;
}

#info {
  max-width: 333px;
  float: left;
  word-break: break-word;
}
.p1 {
  color: rgb(93, 92, 92);
}
.line {
  margin-bottom: 12px;
}

#interest {
    float: left;
    width: 155px;
    margin: 2px 0 0 0;
    padding: 0 0 0 15px;
    border-left: 1px solid #eaeaea;
    color: #9b9b9b;
}

.rating_num {
    color: #494949;
    padding: 0;
    min-width: 30%;
    font-size: 28px;
}
.watch {
  margin-top: 15px;
  font-size: 13px;
  color: #5c5858;
}

.subject-rate {
  color: #e09015;
  font-size: 13px;
  margin-left: 2px;
}

.comment {
  word-break: normal;
  word-wrap: break-word;
}

h2 {
  color: #4aabc6;
  margin: 24px 0 12px 0;
  font-size: 18px;
}

.overview{
  line-height: 1.5;
  margin: 20px;
  white-space: pre-wrap;
}
</style>