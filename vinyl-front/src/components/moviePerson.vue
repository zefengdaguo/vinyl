<template>
    <div id="block">
        <h2>演职员</h2>
        <div class="slide-page">
        <a
          class="item"
          :href="'/person/' + item.personId"
          v-for="(item, index) in personList"
          :key="index"
        >
          <div class="cover-wp">
            <img
              :src="'/api/profile/' + item.profilePath"
              :alt="item.profilePath"
            />
          </div>
          <span>{{ item.personName }}</span><br>
          <span style="color:#888">{{ item.role }}</span>
        </a>
      </div>
    </div>
</template>

<script>
export default {
    name: 'MovieActor',
    data() {
        return {
            personList:[]
        }
    },
    methods: {

    },
    mounted() {
        this.$axios.get("/movie/"+this.movieId+"/people").then((resp) => {
            this.personList = resp.data;
        });
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
  width: 100px;
}
.cover-wp {
  position: relative;
  background-size: 100%;
  width: 95px;
  overflow: hidden;
}
.cover-wp img {
  width: 95px;
}
a {
  text-decoration: none;
  white-space: nowrap;
  overflow: hidden;
  text-overflow: ellipsis;
}
</style>