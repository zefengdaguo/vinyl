<template>
  <div id="recent" style="margin: 20px auto; width: 800px;">
    <div>
      <span>最近热门</span>
      <div class="slide-page">
        <a
          class="item"
          :href="'/movie/' + item.id"
          v-for="(item, index) in movielist"
          :key="index"
        >
          <div class="cover-wp">
            <img style="width:100%;height:180px"
              :src="'/api/poster/' + item.posterPath"
              :alt="item.posterPath"
            />
          </div>
          <span>{{ item.title }}</span>
          <div style="color:rgb(255, 172, 45)">{{item.rate==0?'暂无评分':item.rate}}</div>
        </a>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: "RecentHot",
  data() {
    return {
      movielist: []
    };
  },
  mounted: function () {
    this.$axios.get("/movie/list?pageNum=1&pageSize=15").then((resp) => {
        this.movielist = resp.data.list;
    });
  }
};
</script>

<style scoped>
.slide-page {
  float: left;
  margin-top: 10px;
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
a {
  text-decoration: none;
}
</style>