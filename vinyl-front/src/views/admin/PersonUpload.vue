<template>
  <div style="text-align: left">
    <el-button class="add-button" type="mini" @click="dialogFormVisible = true"
      >添加影人</el-button
    >
    <el-dialog
      title="添加影人"
      :visible.sync="dialogFormVisible"
      @close="clear"
    >
      <el-form
        :model="form"
        :rules="rules"
        ref="form"
        label-width="80px"
        class="form"
      >
        <el-form-item label="影人名" prop="name">
          <el-input v-model="form.name"></el-input>
        </el-form-item>
        <el-form-item label="原名">
          <el-input v-model="form.originalName"></el-input>
        </el-form-item>
        <el-form-item label="性别">
          <el-select v-model="form.gender" placeholder="请选择">
            <el-option
              v-for="item in gender"
              :key="item.id"
              :label="item.value"
              :value="item.id"
            >
            </el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="国籍">
          <el-select v-model="form.country.id" filterable placeholder="请选择">
            <el-option
              v-for="item in countries"
              :key="item.id"
              :label="item.nameZh + ' / ' + item.name"
              :value="item.id"
            >
            </el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="出生日期">
          <el-date-picker
            v-model="form.birthday"
            value-format="yyyy-MM-dd"
            type="date"
            placeholder="选择日期"
          >
          </el-date-picker>
        </el-form-item>
        <el-form-item>
          <el-upload
            class="uploader"
            action="/api/img/profile/upload"
            :show-file-list="false"
            :on-success="handleSuccess"
            :before-upload="beforeUpload"
          >
            <i class="el-icon-plus uploader-icon">添加照片</i>
            <img
              v-if="form.profilePath"
              :src="'/api/profile/' + form.profilePath"
              class="avatar"
            />
          </el-upload>
        </el-form-item>
        <el-form-item label="简介">
          <el-input v-model="form.introduction" type="textarea"></el-input>
        </el-form-item>
        <el-form-item>
          <el-button type="primary" @click="submit">提交</el-button>
        </el-form-item>
      </el-form>
    </el-dialog>
  </div>
</template>

<script>
export default {
  name: "PersonUpload",
  data() {
    return {
      dialogFormVisible: false,
      rules: {
        name: [{ required: true, message: "请输入影人名", trigger: "blur" }],
      },
      gender: [
        { id: 0, value: "女" },
        { id: 1, value: "男" },
        { id: 2, value: "未知" },
      ],
      form: {
        name: "",
        originalName: "",
        profilePath: "",
        gender: 2,
        country: {
          id: "",
        },
        introduction: "",
        birthday: "",
      },
      countries: [],
    };
  },
  methods: {
    clear() {
      this.form = {
        name: "",
        originalName: "",
        profilePath: "",
        gender: 2,
        country: {
          id: "",
        },
        introduction: "",
        birthday: "",
      };
    },
    handleSuccess(res) {
      this.form.profilePath = res.data;
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
    submit() {
      this.$axios.post("/person/save", this.form).then(() => {
        this.$message("提交成功");
      });
    },
  },
  created() {
    this.$axios.get("/movie/countries").then((res) => {
      this.countries = res.data;
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
</style>
