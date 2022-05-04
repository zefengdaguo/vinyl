<template>
  <div id="reviews" style="margin: 20px auto; width: 800px">
    <span>最近影评</span>
    <div class="reviews-bd">
      <div class="review" v-for="(item, index) in reviewlist" :key="index">
        <div class="review-hd">
          <a :href="'/movie/' + item.movieId">
            <img
              style="display: inline; width: 68px; height: 100px"
              :src="'/api/poster/' + item.moviePoster"
              :alt="item.moviePoster"
            />
          </a>
        </div>
        <div class="review-bd">
          <h3>
            <a :href="'/review/' + item.id">{{ item.title }}</a>
          </h3>
          <span class="date">{{ item.date | formatDate }}</span>
          <div class="review-meta">
            <a :href="'/user/' + item.userId">{{ item.authorName }}</a> <span style="font-size:14px">评论 </span>
            <a :href="'/movie/' + item.movieId">{{ item.movieTitle }}</a>
          </div>
          <div class="review-content">
            {{ item.description }}
            <a :href="'/review/' + item.id">(全文)</a>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import formatDate from "../../utils/date.js";
export default {
  name: "RecentReview",
  data() {
    return {
      reviewlist: [],
    };
  },
  filters: {
    formatDate(time) {
      return formatDate(time);
    },
  },
  mounted: function () {
    this.$axios.get("/review/list?pageNum=1&pageSize=5").then((resp) => {
      this.reviewlist = resp.data.list;
    });
  },
};
</script>

<style scoped>
.reviews {
  margin-top: 10px;
}
.review {
  overflow: hidden;
  zoom: 1;
  margin-bottom: 24px;
  padding-bottom: 24px;
  border-bottom: 1px solid #eaeaea;
}
.review-hd {
  margin-top: 10px;
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
  color: #9b9b9b;
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
</style>