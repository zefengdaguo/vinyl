<template>
  <div style="text-align: left">
    <el-button class="add-button" type="mini" @click="dialogFormVisible = true"
      >添加影片</el-button
    >
    <el-dialog
      title="添加影片"
      :visible.sync="dialogFormVisible"
      @close="clear"
    >
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
            placeholder="选择日期"
          >
          </el-date-picker>
        </el-form-item>
        <el-form-item>
          <el-upload
            class="uploader"
            action="/api/img/poster/upload"
            :show-file-list="false"
            :on-success="handleSuccess"
            :before-upload="beforeUpload"
          >
            <i class="el-icon-plus uploader-icon">添加海报</i>
            <img
              v-if="form.posterPath"
              :src="'/api/poster/' + form.posterPath"
              class="avatar"
            />
          </el-upload>
        </el-form-item>
        <el-form-item label="时长（分钟）" prop="runtime">
          <el-input v-model="form.runtime"></el-input>
        </el-form-item>
        <el-form-item label="是否为剧集">
          <el-select v-model="form.isTv" placeholder="请选择">
            <el-option
              v-for="item in [
                { id: 0, value: '影片' },
                { id: 1, value: '剧集' },
              ]"
              :key="item.id"
              :label="item.value"
              :value="item.id"
            >
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
          <el-select
            v-model="chosenCountries"
            filterable
            multiple
            placeholder="请选择"
          >
            <el-option
              v-for="item in countries"
              :key="item.id"
              :label="item.nameZh + ' / ' + item.name"
              :value="item.id"
            >
            </el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="语言">
          <el-select
            v-model="chosenLangs"
            filterable
            multiple
            placeholder="请选择"
          >
            <el-option
              v-for="item in languages"
              :key="item.id"
              :label="item.name"
              :value="item.id"
            >
            </el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="类型">
          <el-select
            v-model="chosenCategories"
            filterable
            multiple
            placeholder="请选择"
          >
            <el-option
              v-for="item in categories"
              :key="item.id"
              :label="item.name"
              :value="item.id"
            >
            </el-option>
          </el-select>
        </el-form-item>
        <el-form-item>
          <el-button type="primary" @click="submit('form')">提交</el-button>
        </el-form-item>
      </el-form>

      <el-button
        type="primary"
        v-if="success"
        @click="addRoles = true"
        style="margin: 10px 0 10px 100px"
        >继续添加影职员信息</el-button
      >
      <div v-if="addRoles" style="margin-left: 18px">
        <el-form :inline="true">
          <span v-for="(item, index) in roleform" :key="index">
            <el-form-item label="影人">
              <el-select
                v-model="item.chosenPersonId"
                filterable
                remote
                reserve-keyword
                placeholder="请输入影人名"
                :remote-method="(val) => remoteMethod(val, index)"
                :loading="item.loading"
              >
                <el-option
                  v-for="person in item.persons"
                  :key="person.id"
                  :label="person.name"
                  :value="person.id"
                >
                  <span style="float: left">{{ person.name }}</span>
                  <span style="float: right; color: #8492a6; font-size: 13px"
                    ><a
                      style="text-decoration: none"
                      :href="'/person/' + person.id"
                      target="_blank"
                      >详情</a
                    ></span
                  >
                </el-option>
              </el-select>
            </el-form-item>
            <el-form-item label="职位">
              <el-select
                v-model="item.chosenRoleIds"
                filterable
                multiple
                placeholder="请选择"
              >
                <el-option
                  v-for="role in roles"
                  :key="role.id"
                  :label="role.name"
                  :value="role.id"
                >
                </el-option>
              </el-select>
            </el-form-item>
          </span>

          <el-form-item>
            <el-button type="primary" @click="submitrole">提交</el-button>
            <el-button @click="add">新增一项</el-button>
          </el-form-item>
        </el-form>
      </div>
    </el-dialog>
  </div>
</template>

<script>
export default {
  name: "MovieUpload",
  data() {
    return {
      dialogFormVisible: false,
      rules: {
        title: [{ required: true, message: "请输入影片名", trigger: "blur" }],
        year: [
          {
            message: "请输入正确的年份",
            trigger: "blur",
            pattern: /^(1[89]\d\d)|(20\d\d)$/,
          },
        ],
        runtime: [
          {
            message: "请输入正确的时长",
            trigger: "blur",
            pattern: /^\d{0,5}$/,
          },
        ],
        episodeNumber: [
          {
            message: "请输入正确的集数",
            trigger: "blur",
            pattern: /^\d{0,4}$/,
          },
        ],
      },
      form: {
        title: "",
        originalTitle: "",
        year: "",
        releaseDate: "0000-01-01",
        posterPath: "",
        runtime: "",
        isTv: 0,
        episodeNumber: 0,
        overview: "",
        countries: [],
        languages: [],
        categories: [],
      },
      countries: [],
      languages: [],
      categories: [],
      chosenCountries: [],
      chosenLangs: [],
      chosenCategories: [],
      success: false,
      movieId: 0,

      addRoles: false,

      // 处理表单
      roleform: [
        {
          chosenPersonId: "",
          persons: [], // 远程请求出来的选项
          loading: false,
          chosenRoleIds: [],
        },
      ],
      // 最终提交表单
      submitForm: [],
      roles: [],
    };
  },
  methods: {
    clear() {
      (this.form = {
        title: "",
        originalTitle: "",
        year: "",
        releaseDate: "0000-01-01",
        posterPath: "",
        runtime: "",
        isTv: 0,
        episodeNumber: 0,
        overview: "",
        countries: [],
        languages: [],
        categories: [],
      }),
        (this.roleform = [
          {
            chosenPersonId: "",
            persons: [], // 远程请求出来的选项
            loading: false,
            chosenRoleIds: [],
          },
        ]),
        (this.submitForm = []);
      this.chosenCountries = [];
      this.chosenLangs = [];
      this.chosenCategories = [];
      this.success = false;
      this.addRoles = false;
    },
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
      return (isJPG || isPNG || isWebp) && isLt2M;
    },
    loading() {
      const loading = this.$loading({
        lock: true,
        text: "Loading",
        spinner: "el-icon-loading",
        background: "rgba(0, 0, 0, 0.7)",
      });
      setTimeout(() => {
        loading.close();
      }, 500);
    },
    submit(form) {
      this.loading();
      for (var item in this.chosenCountries) {
        this.form.countries.push({
          id: this.chosenCountries[item],
        });
      }
      for (var item1 in this.chosenLangs) {
        this.form.languages.push({
          id: this.chosenLangs[item1],
        });
      }
      for (var item2 in this.chosenCategories) {
        this.form.categories.push({
          id: this.chosenCategories[item2],
        });
      }
      this.$refs[form].validate((valid) => {
        if (valid) {
          this.$axios.post("/movie/save", this.form).then((res) => {
            this.success = true;
            this.movieId = res.data;
            this.$message("提交成功");
          });
        } else {
          this.$ElementUI.Message.error("请正确填写表单", { duration: 1000 });
        }
      });
    },
    remoteMethod(query, index) {
      if (query !== "") {
        this.roleform[index].loading = true;
        setTimeout(() => {
          this.roleform[index].loading = false;
          this.$axios
            .get("/person/search?name=" + query + "&pageNum=1&pageSize=100")
            .then((res) => {
              this.roleform[index].persons = res.data.list;
            });
        }, 200);
      }
    },
    add() {
      this.roleform.push({
        chosenPersonId: "",
        persons: [], // 远程请求出来的选项
        loading: false,
        chosenRoleIds: [],
      });
    },
    submitrole() {
      for (let i of this.roleform) {
        for (let j of i.chosenRoleIds) {
          this.submitForm.push({
            personId: i.chosenPersonId,
            roleId: j,
          });
        }
      }
      this.$axios
        .post("/movie/" + this.movieId + "/addRoles", this.submitForm)
        .then(() => {
          this.$message("提交成功");
        });
    },
  },
  created() {
    this.$axios.get("/movie/countries").then((res) => {
      this.countries = res.data;
    });
    this.$axios.get("/movie/languages").then((res) => {
      this.languages = res.data;
    });
    this.$axios.get("/movie/categories").then((res) => {
      this.categories = res.data;
    });
    this.$axios.get("/movie/roles").then((res) => {
      this.roles = res.data;
    });
  },
};
</script>

<style scoped>
.add-button {
  margin: 10px 0 0 18px;
}
.form {
  max-width: 800px;
  margin: 0 auto;
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
