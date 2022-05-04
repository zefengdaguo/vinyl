<template>
    <div>
        <Header />
        <div id="block">
            <h1>
                <span>{{ person.name }} {{ person.originalName }}</span>
            </h1>
            <div class="clearfix">
                <div id="mainpic">
                    <img :src="'/api/profile/'+person.profilePath" :alt="person.profielPath">
                </div>
                <div id="info">
                    <div class="line">
                        <span class="p1">性别：</span>
                        <span>{{person.gender | gender}}</span>
                    </div>
                    <div class="line">
                        <span class="p1">生日：</span>
                        <span>{{person.birthday}}</span>
                    </div>
                    <div class="line">
                        <span class="p1">国籍：</span>
                        <span>{{person.country.nameZh}}</span>
                    </div>
                </div>
            </div>
            <h2>影人简介</h2>
            <div class="overview">
                {{person.introduction}}
            </div>
            <h2>参与影片</h2>
            <div>
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
    name: 'Person',
    components: { Header },
    data() {
        return {
            personId: this.$route.params.personId,
            person:{},
            pageNum: 1,
            movielist: [],
            pageSize: 5,
            total: 0,
        }
    },
    filters :{
        gender(sex) {
            if(sex === 2)
                return '未知';
            else if(sex === 0)
                return '女';
            else
                return '男';
        }
    },
    methods: {
        list(pageNum) {
            this.$axios.get("/movie/list?pageNum="+pageNum+"&pageSize="+this.pageSize+"&personId="+this.personId).then((resp) => {
                this.movielist = resp.data.list;
                this.total = resp.data.total;
                this.pageNum = resp.data.pageNum;
            });
        }
    },
    mounted() {
        this.$axios.get("/person/" + this.personId).then((res) => {
            this.person = res.data;
            document.title = res.data.name;
        });
        this.list(this.pageNum);
    }
}
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
  width: 500px;
  float: left;
}

#mainpic {
    float: left;
    text-align: center;
    margin: 3px 20px 0 0;
    max-width: 120px;
    overflow: hidden;
}

#mainpic img {
  width: 100px;
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
  clear: both;
}

.overview{
  line-height: 1.5;
  margin: 20px;
  white-space: pre-wrap;
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
a {
  text-decoration: none;
}
</style>