<template>
  <div>
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
      </div>
      <div style="clear:both"></div>
      <h2>剧情简介</h2>
      <div class="overview">
        {{movieInfo.overview}}
      </div>
    </div>
    <MoviePerson :movieId="movieId"/>
    <div style="clear:both"></div>
  </div>
</template>

<script>
import MoviePerson from "../../components/moviePerson";
export default {
  name: "MovieInfo",
  components: { MoviePerson},
  data() {
    return {
      movieId: this.$route.params.movieId,
      movieInfo: {}
    };
  },
  mounted() {
    this.$axios.get("/movie/admin/" + this.movieId).then((res) => {
      this.movieInfo = res.data;
      document.title = res.data.title;
    });
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