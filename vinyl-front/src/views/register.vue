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
          class="register-form"
        >
          <el-form-item label="用户名" prop="username">
            <el-input v-model="form.username"></el-input>
          </el-form-item>
          <el-form-item label="密码" prop="password">
            <el-input type="password" v-model="form.password"></el-input>
          </el-form-item>
          <el-form-item label="确认密码" prop="repassword">
            <el-input type="password" v-model="form.repassword"></el-input>
          </el-form-item>
          <el-form-item label="邮箱" prop="email">
            <el-input v-model="form.email"></el-input>
          </el-form-item>
          <el-form-item label="手机号" prop="phone">
            <el-input v-model="form.phone"></el-input>
          </el-form-item>
          <el-form-item label="简介">
            <el-input v-model="form.profile" type="textarea"></el-input>
          </el-form-item>
          <el-form-item>
            <el-button type="primary" @click="submitForm('form')"
              >注册</el-button
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
  name: "Register",
  components:{Header},
  data() {
    return {
        form: {
            username:'',
            password:'',
            email:'',
            phone:'',
            profile:'',
            repassword:'',
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
                { required: true, message: "请输入密码", trigger: "blur" },
            ],
            // https://github.com/yiminghe/async-validator
            repassword: [
                {
                    required: true, trigger: "blur", 
                    validator: (rule, value, callback) => {
                        if (value === '') {
                            callback(new Error('请再次输入密码'))
                        } else if (value !== this.form.password) {
                            callback(new Error('两次输入密码不一致!'))
                        } else {
                            callback()
                        }
                    }
                },
            ],
            email: [
                { type: 'email', required: true, trigger: 'blur', message: "请输入正确的邮箱格式" }
            ],
            phone: [
                { pattern: /^(1[3-9]\d{9})?$/, trigger: 'blur', message:"请输入合法的11位手机号"},
            ]
        },
    };
  },
  methods: {
    submitForm(formName) {
      this.$refs[formName].validate((valid) => {
        if (valid) {
          this.$axios.post("/register", this.form).then(() => {
            this.$message('注册成功');
            this.$router.push("/login");
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
.register-form {
    max-width: 500px;
    margin: 0 auto;
}
</style>