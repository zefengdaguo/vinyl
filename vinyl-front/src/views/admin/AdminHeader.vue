<template>
  <el-card class="admin-header">
    <a href="/" style="color:#00a8ff">
      <span style="font-size: 32px;font-weight: bold;position:absolute;left: 80px">vinyl</span>
    </a>
    
    <i class="el-icon-switch-button" v-on:click="logout" style="font-size: 40px;float: right"></i>
  </el-card>
</template>

<script>

  export default {
    name: 'AdminHeader',
    methods: {
      logout () {
        this.$axios.post("/admin/logout").then(() => {
          this.$message({
            type:'info',
            message:'已退出'
          });
          this.$store.commit("REMOVE_ADMIN");
          this.$router.replace('/');
        })
      }
    }
  }
</script>

<style scoped>
  .admin-header {
    height: 80px;
    opacity: 0.85;
    line-height: 40px;
    min-width: 900px;
  }
  .el-icon-switch-button {
    cursor: pointer;
    outline:0;
  }
</style>
