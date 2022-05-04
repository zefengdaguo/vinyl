<template>
  <div>
    <Header />
    <div style="width: 840px; margin: 0 auto">
      <h1 style="font-size: 26px; color: #333; margin-left: 20px">选影视</h1>
      <ul class="category">
        <li @click="toggleCheck(0)">
          <span class="tag" :class="{ 'tag-checked': check[0].isCheck }"
            >全部类型</span
          >
        </li>
        <li
          v-for="item in categories"
          :key="item.id"
          @click="toggleCheck(item.id)"
        >
          <span
            class="tag"
            :class="{ 'tag-checked': check[item.id].isCheck }"
            >{{ item.name }}</span
          >
        </li>
      </ul>
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
      </div>
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
          :current-page="pageNum"
          :page-size="pageSize"
          :total="total"
          @current-change="list"
        >
        </el-pagination>
      </div>
    </div>
  </div>
</template>

<script>
import Header from "../components/Header";
export default {
  name: "Category",
  components: { Header },
  data() {
    return {
      categories: [],
      check: [
        {
          index: 0,
          isCheck: true,
        },
      ],
      sort: "date",
      pageNum: 1,
      movielist: [],
      pageSize: 15,
      total: 0,
    };
  },
  methods: {
    list(pageNum) {
      var categories = "";
      var url =
        "/movie/list?pageNum=" + pageNum + "&pageSize=15&sort=" + this.sort;
      // 将已选类型 id 拼接字符串，用于传参
      if (!this.check[0].isCheck) {
        this.check.forEach((v) =>
          v.isCheck ? (categories += v.index + ",") : (categories += "")
        );
      }
      if (categories !== "") {
        url += "&categories=" + categories.substring(0, categories.length - 1);
      } else {
        this.check[0].isCheck = true;
      }
      this.$axios.get(url).then((resp) => {
        this.movielist = resp.data.list;
        this.total = resp.data.total;
        this.pageNum = resp.data.pageNum;
      });
    },
    changesort(sort) {
      this.sort = sort;
      this.list(this.pageNum);
    },
    toggleCheck(index) {
      if (index > 0) {
        // 取消全部类型
        this.check[0].isCheck = false;
      } else if (index === 0) {
        this.check.forEach((v) => (v.isCheck = false));
      }
      this.check[index].isCheck = !this.check[index].isCheck;
      this.pageNum = 1;
      this.list(this.pageNum);
    },
  },
  mounted: function () {
    this.$axios.get("/movie/categories").then((resp) => {
      this.categories = resp.data;
      for (var i in this.categories) {
        this.check.push({
          index: this.categories[i].id,
          isCheck: false,
        });
      }
    });
    this.list(this.pageNum);
  },
};
</script>

<style scoped>
.category {
  margin-bottom: 17px;
}

ul {
  list-style: none;
}

.category li {
  display: inline-block;
  color: #333;
  margin-right: 4px;
  padding-top: 3px;
}

.tag-checked {
  opacity: 0.8;
  background: #258dcd;
  color: #fff;
}

.category .tag {
  zoom: 1;
  cursor: pointer;
  font-size: 14px;
  padding: 2px 10px;
  line-height: 20px;
  border-radius: 2px;
}

li:hover {
  color: #258dcd;
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
</style>