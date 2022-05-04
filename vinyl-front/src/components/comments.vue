<template>
    <div id="block">
        <h2>短评</h2>
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
        <div id="comments">
            <div class="comment-item" v-for="(item, index) in comments" :key="index">
                <span>
                    <a :href="'/user/' + item.userId">{{ item.username }}</a>评论
                    <el-rate
                    v-if="item.rate !== 0"
                    :value="item.rate / 2"
                    disabled
                    allow-half
                    text-color="#ff9900"
                    score-template="{value}"
                    >
                    </el-rate>
                    <span class="subject-rate">{{ item.rate == 0?'':item.rate}}</span>
                    <span style="color: #666; margin-left: 10px">{{
                    item.date | formatDate
                    }}</span><br>
                    <span class="comment">{{ item.comment }}</span>
                </span>
            </div>
        </div>
        <el-pagination
          class="mpage"
          background
          layout="prev, pager, next"
          :current-page="pageNum"
          :page-size="pageSize"
          :total="total"
          @current-change="list"
        >
        </el-pagination>
      </div>
    </div>
</template>

<script>
import formatDate from "../utils/date.js";
export default {
    name: 'Comments',
    data() {
        return {
            comments:[],
            pageNum:1,
            pageSize:4,
            sort:'date',
            total:0
        }
    },
    filters: {
        formatDate(time) {
        return formatDate(time);
        },
    },
    methods: {
        list(pageNum) {
            this.$axios.get("/movie/"+this.movieId+"/comments?pageNum="+pageNum+"&pageSize="+this.pageSize+"&sort="+this.sort).then((resp) => {
                this.comments = resp.data.list;
                this.total = resp.data.total;
                this.pageNum = resp.data.pageNum;
            });
        },
        changesort(sort) {
            this.sort = sort;
            this.list(this.pageNum);
        },
    },
    mounted() {
        this.list(this.pageNum);
    },
    props: ['movieId']
}
</script>

<style scoped>

#block {
  width:840px;
  margin: 0 auto;
}

h2 {
  color: #4aabc6;
  margin: 24px 0 12px 0;
  font-size: 18px;
}

.sort {
  color: #999;
  margin-left: 40px;
  margin-bottom: 40px;
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
#comments {
    font-size: 13px;
    line-height: 1.62;
}
.comment-item {
    padding: 14px 0;
    position: relative;
    margin: 0;
    overflow: initial;
    font-size: 13px;
    word-break: break-word;
}
.comment-item::before {
    content: "";
    position: absolute;
    left: 0;
    bottom: 0;
    width: 100%;
    height: 1px;
    background: #ddd;
    transform: scaleY(0.5);
}
a:link {
    color: #37a;
    text-decoration: none;
    margin-right: 5px;
}
.subject-rate {
  color: #e09015;
  font-size: 13px;
  margin-left: 2px;
}
.comment {
    color: black;
}
.mpage {
  margin: 0 auto;
  text-align: center;
}
</style>