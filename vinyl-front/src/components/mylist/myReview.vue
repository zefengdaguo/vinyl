<template>
  <div class="mcontaner">
    <div class="block">
      <h2 style="font-size:16px;font: 15px Arial, Helvetica, sans-serif;">我的影评</h2>
      <el-timeline>
        <el-timeline-item
          :timestamp="review.date | formatDate"
          placement="top"
          v-for="review in reviews"
          v-bind:key="review.id"
        >
          <el-card>
            <div class="review-hd">
              <a :href="'/movie/' + review.movieId">
                <img
                  style="display: inline; width: 68px; height: 100px"
                  :src="'/api/poster/' + review.moviePoster"
                  :alt="review.moviePoster"
                />
              </a>
            </div>
            <div class="review-bd">
              <h3>
                <a :href="'/review/' + review.id">{{ review.title }}</a>
              </h3>
              <div class="review-meta">
                <a :href="'/user/' + review.userId">{{ review.authorName }}</a>
                评论
                <a :href="'/movie/' + review.movieId">{{
                  review.movieTitle
                }}</a>
              </div>
              <div class="review-content">
                {{ review.description }}
              </div>
              <div>赞：{{ review.likeNumber }}</div>
            </div>
          </el-card>
        </el-timeline-item>
      </el-timeline>
      <el-pagination
        class="mpage"
        background
        layout="prev, pager, next"
        :current-page="pageNum"
        :page-size="pageSize"
        :total="total"
        @current-change="page"
      >
      </el-pagination>
    </div>
  </div>
</template>

<script>
import formatDate from "../../utils/date.js";
export default {
  name: "Reviews",
  filters: {
    formatDate(time) {
      return formatDate(time);
    },
  },
  data() {
    return {
      reviews: {},
      pageNum: 1,
      total: 0,
      pageSize: 5,
    };
  },
  methods: {
    page(pageNum) {
      const _this = this;
      _this.$axios
        .get(
          "/review/list?pageSize=5&pageNum=" +
            pageNum +
            "&userId=" +
            this.$store.state.userInfo.id
        )
        .then((res) => {
          _this.reviews = res.data.list;
          _this.pageNum = res.data.pageNum;
          _this.total = res.data.total;
          _this.pageSize = res.data.pageSize;
        });
    },
  },
  created() {
    this.page(1);
  },
};
</script>

<style scoped>
.review-hd {
  float: left;
  width: 68px;
}
.review-bd {
  padding-left: 83px;
}
.review-bd h3 {
  margin: 0;
  height: auto;
  background: none;
}
html h3 {
  font-size: 15px;
}
.review-bd .review-meta {
  color: #666;
  padding: 5px 0;
}
.review-bd .review-content {
  line-height: 20px;
  font-size: 13px;
}
a:link {
  color: #37a;
  text-decoration: none;
}

.review-bd .review-meta a {
  font-size: 12px;
  color: #666;
}

.date {
  font-size: 12px;
  color: #666;
}

a:hover {
  background-color: rgb(148, 199, 237);
}

.block {
  width: 840px;
  padding-top: 20px;
  margin: 0 auto;
}

.mpage {
  margin: 0 auto;
  text-align: center;
}
</style>