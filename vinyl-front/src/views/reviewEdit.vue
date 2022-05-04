<template>
  <div>
    <Header/>
    <div class="m-content">
      <el-form
        class="form"
        :model="ruleForm"
        :rules="rules"
        ref="ruleForm"
        label-width="80px"
      >
        <el-form-item label="标题" prop="title">
          <el-input v-model="ruleForm.title"></el-input>
        </el-form-item>

        <el-form-item label="摘要" prop="description">
          <el-input type="textarea" v-model="ruleForm.description"></el-input>
        </el-form-item>

        <el-form-item label="内容" prop="body">
          <mavon-editor v-model="ruleForm.body" ref=md @imgAdd="$imgAdd"></mavon-editor>
        </el-form-item>

        <el-form-item>
          <el-button type="primary" @click="submitForm('ruleForm')"
            >立即创建</el-button
          >
          <el-button @click="resetForm('ruleForm')">重置</el-button>
        </el-form-item>
      </el-form>
    </div>
  </div>
</template>

<script>
import Header from "../components/Header";
export default {
  name: "ReviewEdit",
  components:{Header},
  data() {
    return {
      ruleForm: {
        id: "",
        title: "",
        description: "",
        body: "",
        movieId: this.$route.query.movieId,
        // userId 由后端记录
      },
      rules: {
        title: [
          { required: true, message: "请输入标题", trigger: "blur" },
          {
            min: 3,
            max: 25,
            message: "长度在 3 到 25 个字符",
            trigger: "blur",
          },
        ],
        description: [{ required: true, message: "请输入摘要", trigger: "blur" }],
        body: [{ trequired: true, message: "请输入内容", trigger: "blur" }],
      },
    };
  },
  methods: {
    submitForm(formName) {
      this.$refs[formName].validate((valid) => {
        if (valid) {
          this.$axios.post("/review/edit", this.ruleForm).then(() => {
            this.$alert("操作成功", "提示", {
              confirmButtonText: "确定",
              callback: () => {
                this.$router.push("/reviews");
              },
            });
          });
        } else {
          this.$ElementUI.Message.error('请正确填写表单', { duration: 1000 });
        }
      });
    },
    /**
     * https://github.com/hinesboy/mavonEditor/blob/HEAD/doc/cn/upload-images.md
     * pos: 写在md中的文件名
     * file: 图片文件
     */
    $imgAdd(pos, $file){
        // 第一步.将图片上传到服务器.
        var imgData = new FormData();
        imgData.append('file', $file);
        this.$axios({
            url: '/img/articleImg/upload',
            method: 'post',
            data: imgData,
            headers: { 'Content-Type': 'multipart/form-data' },
        }).then((res) => {
            // 第二步.将返回的路径替换到文本原位置![...](0) -> ![...](url)
            /**
           * $vm 指为mavonEditor实例，可以通过如下两种方式获取
           * 1. 通过引入对象获取: `import {mavonEditor} from ...` 等方式引入后，`$vm`为`mavonEditor`
           * 2. 通过$refs获取: html声明ref : `<mavon-editor ref=md ></mavon-editor>，`$vm`为 `this.$refs.md`
           */
          console.log("上传图片了啦啦啦啦")
          this.$refs.md.$img2Url(pos, '/api/articleImg/'+res.data);
        })
    },
    resetForm(formName) {
      this.$refs[formName].resetFields();
    },
  },
  created() {
    // 用于数据回显，编辑已创建的 review 会显示之前的内容
    if (this.$route.params.reviewId) {
      this.$axios.get("/review/" + this.$route.params.reviewId).then((res) => {
        const review = res.data;
        this.ruleForm.id = review.id;
        this.ruleForm.title = review.title;
        this.ruleForm.description = review.description;
        this.ruleForm.body = review.body;
      });
    }
  },
};
</script>

<style scoped>
.m-content {
  text-align: center;
  width: 1200px;
  margin: 0 auto;
  margin-top: 36px;
}

.form {
  background-color: white;
  padding:10px;
  border: 1px solid black;
  border-radius: 10px;
  box-shadow: 10px 5px 5px rgb(190, 190, 190);
}
</style>