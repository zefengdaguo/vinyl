<template>
    <div>
        <Header/>
        <div style="width: 840px; margin: 0 auto">
            <h1 style="font-size: 26px; color: #333; margin-left: 20px">添加影片</h1>
            <el-container class="container">
            <el-main>
                <el-form
                :model="form"
                :rules="rules"
                ref="form"
                label-width="100px"
                class="form"
                >
                <el-form-item label="片名" prop="title">
                    <el-input v-model="form.title"></el-input>
                </el-form-item>
                <el-form-item label="原片名">
                    <el-input v-model="form.originalTitle"></el-input>
                </el-form-item>
                <el-form-item label="年份" prop="year">
                    <el-input v-model="form.year"></el-input>
                </el-form-item>
                <el-form-item label="上映日期">
                    <el-date-picker
                    v-model="form.releaseDate"
                    value-format="yyyy-MM-dd"
                    type="date"
                    placeholder="选择日期">
                    </el-date-picker>
                </el-form-item>
                <el-form-item>
                    <el-upload
                        class="uploader"
                        action="/api/img/poster/upload"
                        :show-file-list="false"
                        :on-success="handleSuccess"
                        :before-upload="beforeUpload">
                    <i class="el-icon-plus uploader-icon">添加海报</i>
                    <img v-if="form.posterPath" :src="'/api/poster/'+form.posterPath" class="avatar">
                    </el-upload>
                </el-form-item>
                <el-form-item label="时长（分钟）" prop="runtime">
                    <el-input v-model="form.runtime"></el-input>
                </el-form-item>
                <el-form-item label="是否为剧集">
                    <el-select v-model="form.isTv" placeholder="请选择">
                        <el-option
                            v-for="item in [{id:0,value:'影片'},{id:1,value:'剧集'}]"
                            :key="item.id"
                            :label="item.value"
                            :value="item.id">
                        </el-option>
                    </el-select>
                </el-form-item>
                <el-form-item label="集数" prop="episodeNumber" v-if="form.isTv !== 0">
                    <el-input v-model="form.episodeNumber"></el-input>
                </el-form-item>
                <el-form-item label="影片简介">
                    <el-input v-model="form.overview" type="textarea"></el-input>
                </el-form-item>
                <el-form-item label="制片国家">
                    <el-select v-model="chosenCountries" filterable multiple placeholder="请选择">
                        <el-option
                        v-for="item in countries"
                        :key="item.id"
                        :label="item.nameZh+' / '+item.name"
                        :value="item.id">
                        </el-option>
                    </el-select>
                </el-form-item>
                <el-form-item label="语言">
                    <el-select v-model="chosenLangs" filterable multiple placeholder="请选择">
                        <el-option
                        v-for="item in languages"
                        :key="item.id"
                        :label="item.name"
                        :value="item.id">
                        </el-option>
                    </el-select>
                </el-form-item>
                <el-form-item label="类型">
                    <el-select v-model="chosenCategories" filterable multiple placeholder="请选择">
                        <el-option
                        v-for="item in categories"
                        :key="item.id"
                        :label="item.name"
                        :value="item.id">
                        </el-option>
                    </el-select>
                </el-form-item>
                <el-form-item>
                    <el-button type="primary" @click="submit('form')"
                    >提交</el-button
                    >
                </el-form-item>
                </el-form>
                <a v-if="success" :href="'/addRoles?movieId='+movieId">继续添加影职员信息</a>
            </el-main>
            </el-container>
        </div>
    </div>
</template>

<script>
import Header from "../components/Header";
export default {
    name:"AddPerson",
    components: {Header},
    data() {
        return {
            rules:{
                title:[{ required: true, message: "请输入影片名", trigger: "blur" }],
                year:[{message: '请输入正确的年份', trigger: 'blur', pattern: /^(1[89]\d\d)|(20\d\d)$/,}],
                runtime:[{message: '请输入正确的时长', trigger: 'blur', pattern:/^\d{0,5}$/}],
                episodeNumber:[{message: '请输入正确的集数', trigger: 'blur', pattern:/^\d{0,4}$/}]
            },
            form:{
                title:'',
                originalTitle:'',
                year:'',
                releaseDate:'',
                posterPath:'',
                runtime:'',
                isTv:0,
                episodeNumber:0,
                overview:'',
                countries:[],
                languages:[],
                categories:[]
            },
            countries:[],
            languages:[],
            categories:[],
            chosenCountries:[],
            chosenLangs:[],
            chosenCategories:[],
            success: false,
            movieId: 0
        }
    },
    methods: {
      handleSuccess(res) {
        this.form.posterPath = res.data;
      },
      beforeUpload(file) {
        const isJPG = file.type === "image/jpeg";
        const isPNG = file.type === "image/png";
        const isWebp = file.type === "image/webp";
        const isLt2M = file.size / 1024 / 1024 < 2;

        if (!isJPG && !isPNG && !isWebp) {
            this.$message.error("上传图片只能是 JPG/PNG/WEBP 格式!");
        }
        if (!isLt2M) {
            this.$message.error("上传图片大小不能超过 2MB!");
        }
        return (isJPG||isPNG||isWebp) && isLt2M;
      },
      loading() {
        const loading = this.$loading({
          lock: true,
          text: 'Loading',
          spinner: 'el-icon-loading',
          background: 'rgba(0, 0, 0, 0.7)'
        });
        setTimeout(() => {
          loading.close();
        }, 500);
      },
      submit(form) {
        this.loading();
        for(var item in this.chosenCountries){
            this.form.countries.push({
                id:this.chosenCountries[item]
            })
        }
        for(var item1 in this.chosenLangs){
            this.form.languages.push({
                id:this.chosenLangs[item1]
            })
        }
        for(var item2 in this.chosenCategories){
            this.form.categories.push({
                id:this.chosenCategories[item2]
            })
        }
        this.$refs[form].validate(valid => {
            if(valid) {
                this.$axios.post("/movie/add",this.form).then((res) => {
                    this.success = true;
                    this.movieId = res.data;
                    this.$message('提交成功');
                });
            } else {
                this.$ElementUI.Message.error('请正确填写表单', { duration: 1000 });
            }
        })

      }
    },
    created() {
        this.$axios.get("/movie/countries").then( res =>{
            this.countries = res.data;
        });
        this.$axios.get("/movie/languages").then( res =>{
            this.languages = res.data;
        });
        this.$axios.get("/movie/categories").then( res =>{
            this.categories = res.data;
        });
    }
}
</script>

<style scoped>
.form {
    max-width: 800px;
    margin: 0 auto;
}

.container {
    width: 600px;
    background-color: white;
    padding:10px;
    border: 1px solid black;
    border-radius: 10px;
    box-shadow: 10px 5px 5px rgb(190, 190, 190);
}

.avatar {
    width: 100px;
    height: 148px;
    display: block;
    border: thick solid #32a1ce;
}
.uploader-icon {
    color: #8c939d;
    border: 1px dashed #d9d9d9;
    width: 100px;
    height: 100px;
    line-height: 100px;
}

a:link {
    color: #37a;
    text-decoration: none;
    margin-left: 350px;
}
a:hover {
    color: rgb(148, 199, 237);
}
</style>