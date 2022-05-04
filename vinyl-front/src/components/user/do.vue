<template>
  <div class="article">
    <div>
      <div class="sort">
        <span
          :class="sort == 'date' ? 'ck-option' : 'ck-option checked'"
          @click="changesort('date')"
          >按时间排序</span
        >
        <el-divider direction="vertical"></el-divider>
        <span
          :class="sort == 'rate' ? 'ck-option' : 'ck-option checked'"
          @click="changesort('rate')"
          >按评分排序</span
        >
        <el-divider direction="vertical"></el-divider>
        <span class="amount">共 {{ amount }} 部</span>
      </div>
      <div class="grid-view">
        <div class="item" v-for="(item, index) in movielist" :key="index">
          <div class="pic">
            <a :title="item.title" :href="'/movie/' + item.movieId">
              <img :src="'/api/poster/' + item.posterPath" :alt="item.title" />
            </a>
          </div>
          <div class="info">
            <ul>
              <li class="title">
                <a :href="'/movie/' + item.movieId"
                  >{{ item.title }} / {{ item.originalTitle }} ({{
                    item.year
                  }})</a
                >
              </li>
              <li class="intro">上映日期：{{ item.releaseDate }}</li>
              <li style="margin-bottom: 6px">
                <el-rate
                  :value="item.rate / 2"
                  disabled
                  allow-half
                  text-color="#ff9900"
                  score-template="{value}"
                >
                </el-rate>
                <span class="subject-rate">个人评分：{{ item.rate == 0?'未评分':item.rate }}</span>
                <span style="color: #666; margin-left: 10px">{{
                  item.markDate | formatDate
                }}</span>
              </li>
              <li>
                <span class="comment">{{ item.comment }}</span>
              </li>
            </ul>
          </div>
        </div>
      </div>
      <el-pagination
        @current-change="handleCurrentChange"
        :current-page="currentPage"
        :page-size="pageSize"
        :total="amount"
      >
      </el-pagination>
    </div>
  </div>
</template>

<script>
import formatDate from "../../utils/date.js";

export default {
  name: "Do",
  filters: {
    formatDate(time) {
      return formatDate(time);
    },
  },
  data() {
    return {
      amount: 0,
      sort: "date",
      pageNum: 1,
      pages: 1,
      movielist: [],
      currentPage: 1,
      pageSize: 10
    };
  },
  methods: {
    list(pageNum) {
      this.$axios
        .get(
          "/watch/do/" +
            this.userId +
            "?pageNum=" +
            pageNum +
            "&pageSize="+this.pageSize+"&sort=" +
            this.sort
        )
        .then((resp) => {
          this.amount = resp.data.total;
          this.movielist = resp.data.list;
          this.pages = resp.data.pages;
        });
    },
    handleCurrentChange: function (currentPage) {
      this.currentPage = currentPage;
      this.list(currentPage);
    },
  },
  props:['userId'],
  mounted: function () {
    this.list(this.pageNum);
  },
};
</script>

<style scoped>
.article {
  float: left;
}

html body {
  font-size: 13px;
}
.sort {
  float: left;
  color: #999;
  margin-bottom: 20px;
}

.ck-option {
  font-size: 13px;
  color: black;
}

.ck-option:hover {
  cursor: pointer;
}
.checked {
  color: #999;
}

.amount {
  font-size: 13px;
  color: #999;
}

.grid-view .item {
  overflow: auto;
  display: table;
  width: 100%;
  zoom: 1;
  margin: 0 0 20px;
  padding: 0 0 5px;
  font-size: 13px;
  border-bottom: 1px dashed #ddd;
}

.grid-view .item > .pic,
.grid-view .item > .info {
  display: table-cell;
  vertical-align: top;
  float: initial;
}

.grid-view .item .pic {
  width: 100px;
  overflow: hidden;
}

.grid-view .item .info {
  overflow: hidden;
  text-align: left;
}

a:link {
  color: #37a;
  text-decoration: none;
}

a img {
  border-width: 0;
  vertical-align: middle;
  max-width: 100%;
}

.item .info ul {
  margin-left: 1em;
  list-style: none;
}

.item .info li {
  clear: both;
}

.item .info li.intro {
  overflow: hidden;
  text-overflow: ellipsis;
}

.item .intro {
  color: #666;
  margin: 0 0 6px;
}

.item .title {
  margin: 0 0 6px;
  padding: 3px 0px 1px;
}

a:hover {
  background-color: rgb(148, 199, 237);
}

.subject-rate {
  color: #e09015;
  font-size: 13px;
  margin-left: 2px;
}
</style>