<template>
  <div>
    <Header/>
    <div id="index">
    <RecentHot/>
    <RecentReview/>
    </div>

  </div>
</template>

<script>
import Header from "../components/Header";
import RecentHot from '../components/index/RecentHot.vue';
import RecentReview from '../components/index/RecentReview.vue';
export default {
  name: "Index",
  components: {Header, RecentHot, RecentReview},
};
</script>

<style scoped>
#index {
  width:840px;
  margin: 0 auto;
}
</style>