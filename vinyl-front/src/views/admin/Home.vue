<template>
  <el-container id="admin-body">
    <el-header style="z-index: 1;height: 80px;margin-left: -20px">
      <AdminHeader style="position: absolute;width: 100%;"></AdminHeader>
    </el-header>
    <el-container>
      <el-aside style="height: 112%;margin-top: -80px;width: 250px">
        <admin-menu></admin-menu>
      </el-aside>
      <el-main>
        <router-view/>
      </el-main>
    </el-container>
  </el-container>
</template>

<script>
  import AdminMenu from './AdminMenu'
  import AdminHeader from './AdminHeader'

  export default {
    name: 'AdminIndex',
    components: {AdminMenu, AdminHeader},
    data () {
      return {
      }
    }
  }
</script>

<style scoped>
#admin-body {
  height: 95vh;
}
</style>
