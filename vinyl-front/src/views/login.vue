<template>
  <div>
    <Header/>
    <el-container>
      <el-main>
        <el-form
          ref="form"
          :rules="rules"
          :model="form"
          label-width="80px"
          class="login-form"
        >
          <el-form-item label="用户名" prop="username">
            <el-input v-model="form.username"></el-input>
          </el-form-item>
          <el-form-item label="密码" prop="password">
            <el-input type="password" v-model="form.password"></el-input>
          </el-form-item>
          <el-form-item>
            <el-button type="primary" @click="submitForm('form')"
              >登录</el-button
            >
          </el-form-item>
        </el-form>
      </el-main>
    </el-container>
  </div>
</template>

<script>
import Header from "../components/Header";
export default {
  name: "Login",
  components:{Header},
  data() {
    return {
      form: {
        username: "user1",
        password: "123",
      },
      rules: {
        username: [
          { required: true, message: "请输入用户名", trigger: "blur" },
          {
            min: 3,
            max: 15,
            message: "长度在 3 到 15 个字符",
            trigger: "blur",
          },
        ],
        password: [
          { required: true, message: "请输入密码", trigger: "change" },
        ],
      },
    };
  },
  methods: {
    submitForm(formName) {
      this.$refs[formName].validate((valid) => {
        if (valid) {
          const _this = this;
          this.$axios.post("/login", this.form).then((res) => {
            const userInfo = res.data;
            // 保存token和用户信息
            // _this.$store.commit("SET_TOKEN", token);
            _this.$store.commit("SET_USERINFO", userInfo);

            // 返回上级
            _this.$router.push("/");
          });
        } else {
          this.$ElementUI.Message.error('请正确填写表单', { duration: 1000 });
          return false;
        }
      });
    },
  },
  mounted() {
    // this.$axios.get("/test").then((resp) => {
    //   console.log(resp);
    // });
  },
};
</script>

<style scoped>
.el-main {
  color: #333;
  text-align: center;
  line-height: 160px;
}
body > .el-container {
  margin-bottom: 40px;
}
.login-form {
    max-width: 500px;
    margin: 0 auto
}

</style>