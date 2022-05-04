<template>
  <el-menu
    :default-active="currentPath"
    class="el-menu-admin"
    router
    mode="vertical"
    background-color="#7f8c8d"
    text-color="#fff"
    active-text-color="#ffd04b">
    <div style="height: 80px;"></div>
      <!--index 没有用但是必需字段-->
      <el-submenu  v-for="(item,i) in adminMenus" :key="i" :index="i" style="text-align: left">
        <span slot="title" style="font-size: 17px;">
          {{item.name}}
        </span>
        <el-menu-item v-for="child in item.children" :key="child.path" :index="child.path">
          {{ child.name }}
        </el-menu-item>
      </el-submenu>
  </el-menu>
</template>

<script>
    export default {
      name: 'AdminMenu',
      data () {
        return {
          adminMenus: [
            {
                name:'用户管理',
                children:[
                    {
                        path:'/admin/useraudit',
                        name:'用户状态管理'
                    }
                ]
            },
            {
                name:'内容管理',
                children: [
                    {
                        path: '/admin/movieaudit',
                        name: '影片审核'
                    },
                    {
                        path: '/admin/personaudit',
                        name: '影人审核'
                    },
                    {
                        path: '/admin/reviewaudit',
                        name: '影评审核'
                    }
                ]
            }
          ]
        }
      },
      computed: {
        currentPath () {
          return this.$route.path
        }
      }
    }
</script>

<style scoped>
  .el-menu-admin {
    border-radius: 5px;
    height: 100%;
  }
</style>
