<template>
    <div id="block">
        <h2>影评</h2>
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
</template>

<script>
import formatDate from "../utils/date.js";
export default {
    name: 'MovieReview',
    data() {
        return {
            reviews: {},
            pageNum: 1,
            total: 0,
            pageSize: 5,
        }
    },
    filters: {
        formatDate(time) {
        return formatDate(time);
        },
    },
    methods: {
        page(pageNum) {
        this.$axios
            .get("/review/list?pageSize="+this.pageSize+"&pageNum=" + pageNum+"&movieId="+this.movieId)
            .then((res) => {
            this.reviews = res.data.list;
            this.pageNum = res.data.pageNum;
            this.total = res.data.total;
            this.pageSize = res.data.pageSize;
            });
        },
    },
    mounted() {
        this.page(this.pageNum);
    },
    props: ['movieId']
}
</script>

<style scoped>
h2 {
  color: #4aabc6;
  margin: 24px 0 12px 0;
  font-size: 18px;
}

#block {
  width:840px;
  margin: 0 auto;
}
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