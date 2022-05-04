<template>
  <div>
    <el-container>
      <el-main>
        <el-form
          ref="form"
          :rules="rules"
          :model="form"
          label-width="80px"
          class="login-form"
        >
        <h3 class="title">管理员登录</h3>
          <el-form-item label="登陆名" prop="loginName">
            <el-input v-model="form.loginName"></el-input>
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
export default {
  name: "Login",
  data() {
    return {
      form: {
        loginName: "admin1",
        password: "123",
      },
      rules: {
        loginName: [
          { required: true, message: "请输入登录名", trigger: "blur" },
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
          this.$axios.post("/admin/login", this.form).then(() => {
            this.$store.commit("SET_ADMIN");
            this.$router.push("/admin");
          });
        } else {
          this.$ElementUI.Message.error('请正确填写表单', { duration: 1000 });
          return false;
        }
      });
    },
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
.title {
    margin: 0px auto 40px auto;
    text-align: center;
    color: #505458;
}
</style>