<template>
    <div>
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
            <div style="clear: both"></div>
        </div>
    </div>
</template>

<script>
export default {
    name: 'PersonInfo',
    data() {
        return {
            personId: this.$route.params.personId,
            person:{}
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
    mounted() {
        this.$axios.get("/person/admin/" + this.personId).then((res) => {
            this.person = res.data;
        });
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
</style>