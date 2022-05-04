<template>
  <div>
    <Header />
    <div style="width: 840px; margin: 0 auto">
      <el-input
        placeholder="电影、电视剧、影人"
        size="medium"
        style="width: 400px; position: relative; margin: 20px"
        v-model="keyword"
        @keyup.enter.native="searchClick"
        clearable
      >
      </el-input>
      <h1 style="font-size: 26px; color: #333; margin: 0 20px">{{keyword}}的搜索结果：</h1>
      <h2>找到的影片</h2>
      <div class="slide-page">
        <a
          class="item"
          :href="'/movie/' + item.id"
          v-for="(item, index) in movielist"
          :key="index"
        >
          <div class="cover-wp">
            <img
              style="width: 100%; height: 180px"
              :src="'/api/poster/' + item.posterPath"
              :alt="item.posterPath"
            />
          </div>
          <span>{{ item.title }}</span>
          <div style="color: rgb(255, 172, 45)">{{ item.rate==0?'暂无评分':item.rate }}</div>
        </a>
      </div>
      <div style="clear: both"></div>
      <div>
        <el-pagination
          class="mpage"
          background
          layout="prev, pager, next"
          :current-page="mpageNum"
          :page-size="pageSize"
          :total="movietotal"
          @current-change="listmovie"
        >
        </el-pagination>
      </div>
      <span style="margin-left:20px;font-size:14px;color:#072">没找到想要的结果？<a class="tip" href="/addMovie">创建影片条目</a></span>
    </div>
    <div style="width: 840px; margin: 0 auto">
      <h2>找到的影人</h2>
      <div class="slide-page">
        <a
          class="item"
          :href="'/person/' + item.id"
          v-for="(item, index) in personlist"
          :key="index"
        >
          <div class="cover-wp">
            <img
              style="width: 100%; height: 180px"
              :src="'/api/profile/' + item.profilePath"
              :alt="item.profilePath"
            />
          </div>
          <span>{{ item.name }}</span>
        </a>
      </div>
      <div style="clear: both"></div>
      <div>
        <el-pagination
          class="mpage"
          background
          layout="prev, pager, next"
          :current-page="ppageNum"
          :page-size="pageSize"
          :total="persontotal"
          @current-change="listperson"
        >
        </el-pagination>
      </div>
      <span style="margin-left:20px;font-size:14px;color:#072">没找到想要的结果？<a class="tip" href="/addPerson">创建影人条目</a></span>
    </div>
  </div>
</template>

<script>
import Header from "../components/Header";
export default {
  name: "Search",
  components: { Header },
  data() {
    return {
      mpageNum: 1,
      ppageNum: 1,
      movielist: [],
      personlist:[],
      keyword: this.$route.query.keyword,
      pageSize: 10,
      movietotal: 0,
      persontotal: 0
    };
  },
  methods: {
    listmovie(pageNum) {
      this.$axios.get("/movie/search?title="+this.keyword+"&pageNum="+pageNum+"&pageSize="+this.pageSize).then((resp) => {
        this.movielist = resp.data.list;
        this.movietotal = resp.data.total;
        this.mpageNum = resp.data.pageNum;
      });
    },
    listperson(pageNum) {
      this.$axios.get("/person/search?name="+this.keyword+"&pageNum="+pageNum+"&pageSize="+this.pageSize).then((resp) => {
        this.personlist = resp.data.list;
        this.persontotal = resp.data.total;
        this.ppageNum = resp.data.pageNum;
      });
    },
    searchClick() {
      if(this.keyword == '')
        this.$ElementUI.Message.error('请输入关键字', { duration: 1000 });
      else
        location.assign("/search?keyword="+this.keyword);
    },
  },
  mounted: function () {
      this.listmovie(this.mpageNum);
      this.listperson(this.ppageNum);
  },
};
</script>

<style scoped>
a {
  text-decoration: none;
}
.slide-page {
  margin-top: 10px;
  margin-left: 28px;
}
.item {
  display: block;
  float: left;
  color: #37a;
  font-size: 13px;
  text-align: center;
  margin: 0 25px 10px 0;
  width: 135px;
}
.cover-wp {
  position: relative;
  background-size: 100%;
  width: 130px;
  height: 180px;
  overflow: hidden;
}
.mpage {
  margin: 0 auto;
  text-align: center;
}

h2 {
  color: #4aabc6;
  margin: 24px 0 12px 0;
  font-size: 18px;
  margin-left: 20px;
}

span {
  white-space: nowrap;
  overflow: hidden;
  text-overflow: ellipsis;
}
.tip:hover {
    background-color: rgb(148, 199, 237);
}
</style>